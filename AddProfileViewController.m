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
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    CGSize size = [self getScreenSize];
    self.scrollview .frame = CGRectMake(0, 50, size.width, size.height);
    //[self.Scrollview  setContentSize:CGSizeMake(320, 1064)];
}
-(void)dismissKeyboard {
    // add textfields and textviews
    //[Nameofoutletlikeatextfield resignFirstResponder];
    [self.txtName resignFirstResponder];
    [self.txtHeight resignFirstResponder];
    [self.txtWeight resignFirstResponder];
    [self.txtData resignFirstResponder];
    [self.txtAge resignFirstResponder];
}
-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGSize)getScreenSize
{
    //Get Screen size
    CGSize size;
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height > [[UIScreen mainScreen] bounds].size.width) {
        // in Landscape mode, width always higher than height
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) && [[UIScreen mainScreen] bounds].size.height < [[UIScreen mainScreen] bounds].size.width) {
        // in Portrait mode, height always higher than width
        size.width = [[UIScreen mainScreen] bounds].size.height;
        size.height = [[UIScreen mainScreen] bounds].size.width;
    } else {
        // otherwise it is normal
        size.height = [[UIScreen mainScreen] bounds].size.height;
        size.width = [[UIScreen mainScreen] bounds].size.width;
    }
    return size;
}

- (IBAction)btnSave:(id)sender {
    //hide keyboard
    [self dismissKeyboard];
    
    //save
    //format
    if ([self.txtData.text  isEqual:@""])
    {
        self.txtData.text = @"MyProfiles";
    }
    self.txtData.text = [NSString stringWithFormat:@"%@\n\nName:%@\nAge:%@\nHeight:%@\nWeight:%@",
                         self.txtData.text,self.txtName.text,self.txtHeight.text,self.txtWeight.text,self.txtAge.text];
    
    self.txtName.text = @"";
    self.txtAge.text = @"";
    self.txtHeight.text = @"";
    self.txtWeight.text = @"";
    
    CGPoint scrollPoint = CGPointMake(0, self.btnBackk.frame.origin.y);
    [self.scrollview  setContentOffset:scrollPoint animated:YES];
}
- (IBAction)btnBackk:(id)sender {
    //get back
    [self.scrollview setContentOffset:CGPointZero animated:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [self.scrollview setContentOffset:scrollPoint animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.scrollview setContentOffset:CGPointZero animated:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y);
    [self.scrollview  setContentOffset:scrollPoint animated:YES];
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    [self.scrollview  setContentOffset:CGPointZero animated:YES];
}

- (IBAction)btnView:(id)sender {
    //hide keyboard
    [self dismissKeyboard];
    //load voew
    CGPoint scrollPoint = CGPointMake(0, self.btnBackk.frame.origin.y);
    [self.scrollview  setContentOffset:scrollPoint animated:YES];

  
}@end