//
//  ViewController.h
//  HelloWorld
//
//  Created by Li Richard on 12-10-19.
//
//

#import <UIKit/UIKit.h>
#import "UIDevice-Hardware.h"
#import "UIDevice-IOKitExtensions.h"

@interface ViewController : UIViewController

@property (weak, readwrite) IBOutlet UILabel *platform;
@property (weak, readwrite) IBOutlet UILabel *hardwareModel;
@property (weak, readwrite) IBOutlet UILabel *platformType;
@property (weak, readwrite) IBOutlet UILabel *platformString;

@property (weak, readwrite) IBOutlet UILabel *cpuFrequency;
@property (weak, readwrite) IBOutlet UILabel *busFrequency;
@property (weak, readwrite) IBOutlet UILabel *cpuCount;
@property (weak, readwrite) IBOutlet UILabel *totalMemory;
@property (weak, readwrite) IBOutlet UILabel *userMemory;

@property (weak, readwrite) IBOutlet UILabel *totalDiskSpace;
@property (weak, readwrite) IBOutlet UILabel *freeDiskSpace;

@property (weak, readwrite) IBOutlet UILabel *macAddress;

@property (weak, readwrite) IBOutlet UILabel *hasRetinaDisplay;
@property (weak, readwrite) IBOutlet UILabel *has4InchDisplay;

@property (weak, readwrite) IBOutlet UILabel *deviceFamily;

@end
