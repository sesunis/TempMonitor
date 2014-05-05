//
//  symptomsViewController.m
//  TempMonitor
//
//  Created by Sarah Esunis on 4/23/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import "symptomsViewController.h"

@interface symptomsViewController ()

@end

@implementation symptomsViewController
@synthesize symptomsdb,scrollview;
NSInteger symptom;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.temp addTarget:self action:@selector(sliderUpdate:) forControlEvents:UIControlEventValueChanged];
    
    self.mysymptoms = @[@"Fever",@"Cold",@"Cough",@"Sneeze"];
    
    // Do any additional setup after loading the view.
    if (self.symptomsdb) {
        [self.txtconcern setText:[self.symptomsdb valueForKey:@"sv_concern"]];
        [self.txtnotes setText:[self.symptomsdb valueForKey:@"sv_notes"]];
        NSNumber *progressNumber = [symptomsdb valueForKey:@"sv_temp"];
        self.temp.value = [progressNumber floatValue];
        NSString *newText = [NSString stringWithFormat:@"%d degrees", (int)self.temp.value];
        
        self.temp77.text = newText;
        
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"dd/MM/yyyy HH:mm"];
        
        NSLog(@"Date is: %@", [self.symptomsdb valueForKey:@"sv_date"]);
        
        [self.cal setDate:[dateFormat dateFromString:[self.symptomsdb valueForKey:@"sv_date"]]];
        [self.symptom reloadAllComponents];
        NSInteger x=[[symptomsdb valueForKey:@"sv_symptoms"] integerValue];
        
        [self.symptom selectRow:x inComponent:0 animated:YES];
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    // [self.symptom reloadAllComponents];
    
}
- (void)sliderUpdate:(UISlider *)slider {
    float newVal = slider.value;
    
    NSString *newText = [NSString stringWithFormat:@"%d degrees", (int)newVal];
    
    self.temp77.text = newText;
}
-(void)dismissKeyboard {
    // add textfields and textviews
    //[Nameofoutletlikeatextfield resignFirstResponder];
    [self.txtconcern resignFirstResponder];
    [self.txtnotes resignFirstResponder];
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
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    symptom=row;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.mysymptoms.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.mysymptoms[row];
}

- (IBAction)btnsave:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:self.cal.date];
    NSString *newVal = [NSString stringWithFormat:@"%f", self.temp.value];
    NSString *newSym = [NSString stringWithFormat:@"%ld", (long)symptom];
    if (self.symptomsdb) {
        // Update existing device
        [self.symptomsdb setValue:self.txtconcern.text forKey:@"sv_concern"];
        [self.symptomsdb setValue:self.txtnotes.text forKey:@"sv_notes"];
        [self.symptomsdb setValue:dateString forKey:@"sv_date"];
        [self.symptomsdb setValue:newVal forKey:@"sv_temp"];
        [self.symptomsdb setValue:newSym  forKey:@"sv_symptoms"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"Symptoms" inManagedObjectContext:context];
        [newDevice setValue:self.txtconcern.text forKey:@"sv_concern"];
        [newDevice setValue:self.txtnotes.text forKey:@"sv_notes"];
        [newDevice setValue:dateString forKey:@"sv_date"];
        [newDevice setValue:newVal forKey:@"sv_temp"];
        [newDevice setValue:newSym  forKey:@"sv_symptoms"];
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
}@end
