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

@end
