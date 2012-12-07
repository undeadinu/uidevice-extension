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

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//TODO:include string in feedback email
    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
