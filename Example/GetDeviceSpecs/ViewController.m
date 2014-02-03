//
//  ViewController.m
//  HelloWorld
//
//  Created by Li Richard on 12-10-19.
//
//

#import "ViewController.h"
@interface ViewController ()
@end

@implementation NSString(EasyPeezy)

+ (NSString *)stringForUInt:(NSUInteger)value
{
    return [NSString stringWithFormat:@"%d", value];
}

+ (NSString *)stringForBOOL:(BOOL)value
{
    NSString *result;
    
    if (value)
    {
        result = @"YES";
    } else
    {
        result = @"NO";
    }
    
    return result;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//TODO:include string in feedback email

    [self log];
    [self updateUI];
}

- (void)log
{
    UIDevice *currentDevice = [UIDevice currentDevice];
    
    //NSString *model = [currentDevice model];
    NSString *systemVersion = [currentDevice systemVersion];
    NSString *serialnumber = [currentDevice serialnumber];
    NSString *modelnumber = [currentDevice modelnumber];
    NSString *RegionInfo = [currentDevice RegionInfo];
    NSString *platformString = [currentDevice platformString];
    NSArray *languageArray = [NSLocale preferredLanguages];
    NSString *language = [languageArray objectAtIndex:0];
    
    NSLocale *locale = [NSLocale currentLocale];
    NSString *country = [locale localeIdentifier];
    
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    
    NSString *deviceSpecs = [NSString stringWithFormat:@"%@ - %@ - %@ - %@ - %@ - %@ - %@ - %@", platformString, systemVersion, language, country, appVersion,serialnumber,modelnumber,RegionInfo];
    NSLog(@"Device Specs --> %@",deviceSpecs);
}

- (void)updateUI
{
    UIDevice *currentDevice = [UIDevice currentDevice];
    
    self.platform.text = [currentDevice platform];
    self.hardwareModel.text = [currentDevice hwmodel];
    self.platformType.text = [NSString stringForUInt:[currentDevice platformType] ];
    self.platformString.text = [currentDevice platformString];

    self.cpuFrequency.text = [NSString stringForUInt:[currentDevice cpuFrequency] ];
    self.busFrequency.text = [NSString stringForUInt:[currentDevice busFrequency] ];
    self.cpuCount.text = [NSString stringForUInt:[currentDevice cpuCount] ];
    self.totalMemory.text = [NSString stringForUInt:[currentDevice totalMemory] ];
    self.userMemory.text = [NSString stringForUInt:[currentDevice userMemory] ];
    
    self.totalDiskSpace.text = [NSString stringForUInt:[currentDevice totalDiskSpace] ];
    self.freeDiskSpace.text = [NSString stringForUInt:[currentDevice freeDiskSpace] ];
    
    self.macAddress.text = [currentDevice macaddress];
    
    self.hasRetinaDisplay.text = [NSString stringForBOOL:[UIDevice hasRetinaDisplay] ];
    self.has4InchDisplay.text = [NSString stringForBOOL:[UIDevice has4InchDisplay] ];
    
    self.deviceFamily.text = [NSString stringForUInt:[currentDevice deviceFamily] ];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
