//
//  AppetiteViewController.h
//  TempMonitor
//
//  Created by Sarah Esunis on 4/23/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppetiteViewController : UIViewController


@property (strong, nonatomic) IBOutlet UISegmentedControl *btnBarelyAteHungry;
@property (strong, nonatomic) IBOutlet UISegmentedControl*btnSippedHalfEmptyThirsty;
@property (strong, nonatomic) IBOutlet UISegmentedControl*btnBowelMovement;
@property (weak, nonatomic) IBOutlet UIDatePicker *cal;
@property (weak, nonatomic) IBOutlet UITextField *txtAte;
@property (weak, nonatomic) IBOutlet UITextField *txtDrank;
@property (weak, nonatomic) IBOutlet UITextField *txtOz;
@property (weak, nonatomic) IBOutlet UISegmentedControl *drank;
@property (weak, nonatomic) IBOutlet UISegmentedControl *bowels;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnBack:(id)sender;
@property (strong) NSManagedObjectModel *
appetitedb;


@end
