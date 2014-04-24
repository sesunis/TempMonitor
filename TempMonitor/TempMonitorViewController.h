//
//  TempMonitorViewController.h
//  TempMonitor
//
//  Created by Sarah Esunis on 4/19/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempMonitorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *btnConcerns;
@property (strong, nonatomic) IBOutlet UIView *btnTemp;
@property (strong, nonatomic) IBOutlet UIView *btnSymptoms;
@property (strong, nonatomic) IBOutlet UIView *btnMedication;
@property (strong, nonatomic) IBOutlet UIButton *btnActivity;
@property (strong, nonatomic) IBOutlet UIView *btnDiagnosis;

@property (strong, nonatomic) IBOutlet UIView *btnAppetite;
@property (strong, nonatomic) IBOutlet UIView *btnHydration;
@property (strong, nonatomic) IBOutlet UIView *btnVideoMonitor;
@property (strong, nonatomic) IBOutlet UIView *btnHistory;
@end
