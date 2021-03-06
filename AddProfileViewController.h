//
//  AddProfileViewController.h
//  TempMonitor
//
//  Created by Sarah Esunis on 4/24/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProfileViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btnSaveProfile;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UIDatePicker *cal;
@property (strong, nonatomic) IBOutlet UITextField *txtHeight;
@property (strong, nonatomic) IBOutlet UITextField *txtWeight;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

@property (strong) NSManagedObjectModel *
birthdaydb;
@property (strong) NSMutableArray *databasearray;
- (IBAction)btnSaveProfile:(id)sender;
- (IBAction)btnBackk:(id)sender;

@end
