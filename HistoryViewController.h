//
//  HistoryViewController.h
//  TempMonitor
//
//  Created by Sarah Esunis on 4/23/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController
- (IBAction)btnsave:(id)sender;
- (IBAction)btnback:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *txtNotes;
@property (strong) NSManagedObjectModel *
historydb
;
@end

