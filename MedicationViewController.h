//
//  MedicationViewController.h
//  TempMonitor
//
//  Created by Sarah Esunis on 4/23/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicationViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *btnMedicineSchedule;
@property (strong, nonatomic) IBOutlet UIButton *btnAddDosageTime;
@property (strong, nonatomic) IBOutlet UIButton *btnAutoReminder;
- (IBAction)btnsave:(id)sender;
- (IBAction)btnback:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (weak, nonatomic) IBOutlet UITextField *txtdosage;
@property (weak, nonatomic) IBOutlet UIDatePicker *cal;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sched;
@property (weak, nonatomic) IBOutlet UISwitch *autoupdate;
@property (strong) NSManagedObjectModel *
medicinedb;
@end
