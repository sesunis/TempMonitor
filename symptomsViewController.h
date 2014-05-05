//
//  symptomsViewController.h
//  TempMonitor
//
//  Created by Sarah Esunis on 4/23/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface symptomsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *BtnAddNotes;
@property (strong, nonatomic) IBOutlet UIButton *btnFeelingBetter;
- (IBAction)btnsave:(id)sender;
- (IBAction)btnback:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtconcern;
@property (weak, nonatomic) IBOutlet UITextField *txtnotes;
@property (weak, nonatomic) IBOutlet UISlider *temp;
@property (weak, nonatomic) IBOutlet UIPickerView *symptom;
@property (strong) NSManagedObjectModel *
symptomsdb
;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
-(IBAction) doneEditing:(id) sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *cal;
@property (strong, nonatomic) NSArray *mysymptoms;
@property (weak, nonatomic) IBOutlet UILabel *temp77;

@end
