//
//  MedicationViewController.m
//  TempMonitor
//
//  Created by Sarah Esunis on 4/23/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import "MedicationViewController.h"

@interface MedicationViewController ()

@end

@implementation MedicationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)btnsave:(id)sender {
}

- (IBAction)btnback:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

