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

@end
