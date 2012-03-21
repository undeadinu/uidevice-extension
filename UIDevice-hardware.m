/* Thanks to Emanuele Vulcano, Kevin Ballard/Eridius, Ryandjohnson */

/*
 - Bluetooth? Screen pixels? Dot pitch? Accelerometer? GPS disabled in Egypt (and others?). - @halm
*/

#import "UIDevice-hardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDevice (Hardware)

/*
 Platforms
 iPhone1,1 -> iPhone 1G
 iPhone1,2 -> iPhone 3G 
 iPod1,1   -> iPod touch 1G 
 iPod2,1   -> iPod touch 2G 
 iPad2,2   -> iPad 2
 For more information:
             http://www.edepot.com/iphone.html
             http://stackoverflow.com/questions/1108859/detect-the-specific-iphone-ipod-touch-model

*/

+ (NSString *) platform
{
	size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
	sysctlbyname("hw.machine", machine, &size, NULL, 0);
	NSString *platform = [NSString stringWithCString:machine encoding: NSUTF8StringEncoding];
	free(machine);
	return platform;
}

+ (int) platformType
{
	NSString *platform = [self platform];
    //NSLog(@"Platform: %@", platform);
	if ([platform isEqualToString:@"iPhone1,1"]) return UIDevice1GiPhone;
	if ([platform isEqualToString:@"iPhone1,2"]) return UIDevice3GiPhone;
	if ([platform isEqualToString:@"iPhone2,1"]) return UIDevice3GSiPhone;
	if ([platform isEqualToString:@"iPhone3,1"]) return UIDevice4iPhone;
	// iPhone 4 CDMA
	if ([platform isEqualToString:@"iPhone3,3"]) return UIDevice4iPhone;
	if ([platform isEqualToString:@"iPhone4,1"]) return UIDevice4SiPhone;
	if ([platform hasPrefix:@"iPhone"]) return UIDeviceUnknowniPhone;
        
	if ([platform isEqualToString:@"iPod1,1"])   return UIDevice1GiPod;
	if ([platform isEqualToString:@"iPod2,1"])   return UIDevice2GiPod;
    if ([platform isEqualToString:@"iPod3,1"])   return UIDevice3GiPod;
    if ([platform isEqualToString:@"iPod4,1"])   return UIDevice4GiPod;
	if ([platform hasPrefix:@"iPod"]) return UIDeviceUnknowniPod;

    if ([platform isEqualToString:@"iPad1,1"])   return UIDevice1iPad;
    if ([platform isEqualToString:@"iPad2,1"])   return UIDevice2iPadWiFi;
    if ([platform isEqualToString:@"iPad2,2"])   return UIDevice2iPadGSM;
    if ([platform isEqualToString:@"iPad2,3"])   return UIDevice2iPadCDMA;
    if ([platform isEqualToString:@"iPad3,1"])   return UIDevice3GiPadWiFi;
    if ([platform isEqualToString:@"iPad3,2"])   return UIDevice3GiPad;
    if ([platform isEqualToString:@"iPad3,3"])   return UIDevice3GiPad;
    if ([platform hasSuffix:@"iPad"]) return UIDeviceUnknowniPad;
    
    if ([platform isEqualToString:@"i386"])      return UIDeviceSimulator;
    if ([platform isEqualToString:@"x86_64"])    return UIDeviceSimulator;

	return UIDeviceUnknown;
}

+ (NSString *) platformString
{
	switch ([self platformType])
	{
		case UIDevice1GiPhone: return IPHONE_1G_NAMESTRING;
		case UIDevice3GiPhone: return IPHONE_3G_NAMESTRING;
		case UIDevice3GSiPhone: return IPHONE_3GS_NAMESTRING;
		case UIDevice4iPhone: return IPHONE_4_NAMESTRING;
        case UIDevice4SiPhone: return IPHONE_4S_NAMESTRING;
		case UIDeviceUnknowniPhone: return IPHONE_UNKNOWN_NAMESTRING;
            
		case UIDevice1GiPod: return IPOD_1G_NAMESTRING;
		case UIDevice2GiPod: return IPOD_2G_NAMESTRING;
		case UIDevice3GiPod: return IPOD_3G_NAMESTRING;
        case UIDevice4GiPod: return IPOD_4G_NAMESTRING;
		case UIDeviceUnknowniPod: return IPOD_UNKNOWN_NAMESTRING;

        case UIDevice1iPad: return IPAD_1_NAMESTRING;
        case UIDevice2iPadCDMA: 
        case UIDevice2iPadGSM:
        case UIDevice2iPadWiFi: return IPAD_2_NAMESTRING;
        case UIDevice3GiPad: 
        case UIDevice3GiPadWiFi: return IPAD_3_NAMESTRING;
        case UIDeviceUnknowniPad: return IPAD_UNKNOWN_NAMESTRING;
            
        case UIDeviceSimulator: return SIMULATOR_NAMESTRING;
            
		default: 
            return [NSString stringWithFormat:@"Unknown platform: %@", [self platform]];
	}
}

+ (int) platformCapabilities
{
	int capabilities = 0;
	switch ([self platformType])
	{
        case UIDevice4SiPhone:
		case UIDevice4iPhone: capabilities |= UIDeviceBuiltInGyroscope | UIDeviceBuiltInFrontCamera;
		case UIDevice3GSiPhone: capabilities |= UIDeviceBuiltInCompass;
		case UIDevice3GiPhone: capabilities |= UIDeviceSupportsGPS;
		case UIDeviceUnknowniPhone:
		case UIDevice1GiPhone: 
		{
			capabilities |= UIDeviceBuiltInSpeaker | UIDeviceBuiltInCamera | UIDeviceBuiltInMicrophone | UIDeviceSupportsExternalMicrophone | UIDeviceSupportsTelephony | UIDeviceSupportsVibration;		
			return capabilities;
		}

		case UIDevice1GiPod: return 0;
		case UIDevice2GiPod: return UIDeviceBuiltInSpeaker | UIDeviceBuiltInMicrophone | UIDeviceSupportsExternalMicrophone;
		case UIDeviceUnknowniPod: return 0;
		
		default: return 0;
	}
}

@end
