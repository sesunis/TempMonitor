//
//  VideoMonitorViewController.h
//  TempMonitor
//
//  Created by Sarah Esunis on 4/23/14.
//  Copyright (c) 2014 Sarah Esunis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface VideoMonitorViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *btnStartStop;
- (IBAction)btnsave:(id)sender;
- (IBAction)btnback:(id)sender;
- (IBAction)btnrecord:(id)sender;
@property (strong) NSManagedObjectModel *
videodb;
@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (weak, nonatomic) IBOutlet UITextField *txturl;
//hide keyboard
-(IBAction) doneEditing:(id) sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
- (IBAction)play:(id)sender;

@end