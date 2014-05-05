//
//  VideoMonitorViewController.m
//  TempMonitor
//
//  Created by Sarah Esunis on 4/23/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//


#import "VideoMonitorViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface VideoMonitorViewController ()

@end

@implementation VideoMonitorViewController

@synthesize videodb,scrollview;
NSString *mpath;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    if (self.videodb) {
        [self.txtname setText:[self.videodb valueForKey:@"vm_name"]];
        [self.txturl setText:[self.videodb valueForKey:@"vm_link"]];
        mpath=[self.videodb valueForKey:@"vm_link"];
        mpath= [NSString stringWithFormat:@"%@.mov", mpath];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy HH:mm"];
        
        NSLog(@"Date is: %@", [self.videodb valueForKey:@"vm_date"]);
        
        // [self.txturl setText:[self.videodb valueForKey:@"vm_date"]];
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}
-(void)dismissKeyboard {
    // add textfields and textviews
    //[Nameofoutletlikeatextfield resignFirstResponder];
    [self.txtname resignFirstResponder];
    [self.txturl resignFirstResponder];
}

//right-click drag textfield to fileowner select doneediting
//right-click drag textfield to fileowner select delegate
-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnsave:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    CFGregorianDate currentDate = CFAbsoluteTimeGetGregorianDate(CFAbsoluteTimeGetCurrent(), CFTimeZoneCopySystem());
    NSString *strDate = [NSString stringWithFormat:@"%02d/%02d %02d:%02d:%2.0f", currentDate.month,currentDate.day,currentDate.hour, currentDate.minute, currentDate.second];
    
    if (self.videodb) {
        // Update existing device
        [self.videodb setValue:self.txtname.text forKey:@"vm_name"];
        [self.videodb setValue:self.txturl.text forKey:@"vm_link"];
        [self.videodb setValue:strDate forKey:@"vm_date"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"Video" inManagedObjectContext:context];
        [newDevice setValue:self.txtname.text forKey:@"vm_name"];
        [newDevice setValue:self.txturl.text  forKey:@"vm_link"];
        [newDevice setValue:strDate forKey:@"vm_date"];
    }
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnback:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnrecord:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        picker.allowsEditing = NO;
        
        NSArray *mediaTypes = [[NSArray alloc]initWithObjects:(NSString *)kUTTypeMovie, nil];
        
        picker.mediaTypes = mediaTypes;
        
        [self presentViewController:picker animated:YES completion:nil];
        
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"I'm afraid there's no camera on this device!" delegate:nil cancelButtonTitle:@"Dang!" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [scrollview setContentOffset:scrollPoint animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollview setContentOffset:CGPointZero animated:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y);
    [scrollview setContentOffset:scrollPoint animated:YES];
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    [scrollview setContentOffset:CGPointZero animated:YES];
}

- (IBAction)play:(id)sender {
    
    // pick a video from the documents directory
    NSURL *video = [self grabFileURL:mpath];
    
    // create a movie player view controller
    MPMoviePlayerViewController * controller = [[MPMoviePlayerViewController alloc]initWithContentURL:video];
    [controller.moviePlayer prepareToPlay];
    [controller.moviePlayer play];
    
    // and present it
    [self presentMoviePlayerViewControllerAnimated:controller];
}
#pragma mark - Delegate Methods

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    // user hit cancel
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // grab our movie URL
    NSURL *chosenMovie = [info objectForKey:UIImagePickerControllerMediaURL];
    
    // save it to the documents directory
    mpath= [NSString stringWithFormat:@"%@.mov", self.txturl.text];
    NSURL *fileURL = [self grabFileURL:mpath];
    NSData *movieData = [NSData dataWithContentsOfURL:chosenMovie];
    [movieData writeToURL:fileURL atomically:YES];
    
    // save it to the Camera Roll
    // UISaveVideoAtPathToSavedPhotosAlbum([chosenMovie path], nil, nil, nil);
    
    // and dismiss the picker
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (NSURL*)grabFileURL:(NSString *)fileName {
    
    // find Documents directory
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    // append a file name to it
    documentsURL = [documentsURL URLByAppendingPathComponent:fileName];
    
    return documentsURL;
}

@end
