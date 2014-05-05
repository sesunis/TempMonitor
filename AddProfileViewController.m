//
//  AddProfileViewController.m
//  TempMonitor
//
//  Created by Sarah Esunis on 4/24/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import "AddProfileViewController.h"

@interface AddProfileViewController ()

@end

@implementation AddProfileViewController
@synthesize scrollview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Birthday"];
    self.databasearray = [[managedObjectContext executeFetchRequest:fetchRequest
                                                              error:nil] mutableCopy];
    
    //self.birthdaydb = [self.databasearray objectAtIndex:0];
    NSLog(@"count is: %lu",(unsigned long)[self.databasearray count]);
    if ([self.databasearray count]>0)
    {
        self.birthdaydb = [self.databasearray objectAtIndex:0];
    }
    
    // Do any additional setup after loading the view.
    if (self.birthdaydb) {
        [self.txtname setText:[self.birthdaydb valueForKey:@"ap_name"]];
        [self.txtheoght setText:[self.birthdaydb valueForKey:@"ap_height"]];
        [self.txtweight setText:[self.birthdaydb valueForKey:@"ap_weight"]];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        
        NSLog(@"Date is: %@", [self.birthdaydb valueForKey:@"ap_date"]);
        
        [self.cal setDate:[dateFormat dateFromString:[self.birthdaydb valueForKey:@"ap_date"]]];
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}
-(void)dismissKeyboard {
    // add textfields and textviews
    //[Nameofoutletlikeatextfield resignFirstResponder];
    [self.txtName resignFirstResponder];
    [self.txtHeight resignFirstResponder];
    [self.txtWeight resignFirstResponder];
    [self.cal resignFirstResponder];
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
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:self.cal.date];
    
    if (self.birthdaydb) {
        // Update existing device
        [self.birthdaydb setValue:self.txtname.text forKey:@"ap_name"];
        [self.birthdaydb setValue:self.txtheoght.text forKey:@"ap_height"];
        [self.birthdaydb setValue:self.txtweight.text forKey:@"ap_weight"];
        [self.birthdaydb setValue:dateString forKey:@"ap_date"];
        
    } else {
        // Create a new device
        NSManagedObjectModel *newDevice = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"Birthday" inManagedObjectContext:context];
        [newDevice setValue:self.txtname.text forKey:@"ap_name"];
        [newDevice setValue:self.txtheoght.text forKey:@"ap_height"];
        [newDevice setValue:self.txtweight.text forKey:@"ap_weight"];
        [newDevice setValue:dateString forKey:@"ap_date"];
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

@end
