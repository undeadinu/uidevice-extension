#import <UIKit/UIKit.h>

#define IPHONE_1G_NAMESTRING @"iPhone 1G"
#define IPHONE_3G_NAMESTRING @"iPhone 3G"
#define IPHONE_3GS_NAMESTRING @"iPhone 3GS"
#define IPHONE_4_NAMESTRING @"iPhone 4"
#define IPHONE_4S_NAMESTRING @"iPhone 4S"
#define IPHONE_UNKNOWN_NAMESTRING @"Unknown iPhone"

#define IPAD_1_NAMESTRING @"iPad 1"
#define IPAD_2_NAMESTRING @"iPad 2"
#define IPAD_3_NAMESTRING @"iPad 3"
#define IPAD_UNKNOWN_NAMESTRING @"Unknown iPad"

#define IPOD_1G_NAMESTRING @"iPod touch 1G"
#define IPOD_2G_NAMESTRING @"iPod touch 2G"
#define IPOD_3G_NAMESTRING @"iPod touch 3G"
#define IPOD_4G_NAMESTRING @"iPod touch 4G"
#define IPOD_UNKNOWN_NAMESTRING @"Unknown iPod"

#define SIMULATOR_NAMESTRING @"Simulator"

typedef enum {
	UIDeviceUnknown,
	UIDevice1GiPhone,
	UIDevice3GiPhone,
	UIDevice3GSiPhone,
	UIDevice4iPhone,
	UIDevice4SiPhone,
	UIDevice1GiPod,
	UIDevice2GiPod,
    UIDevice3GiPod,
    UIDevice4GiPod,
    UIDevice1iPad,
    UIDevice2iPadWiFi,
    UIDevice2iPadGSM,
    UIDevice2iPadCDMA,
    UIDevice3GiPadWiFi,
    UIDevice3GiPad,
    UIDeviceSimulator,
	UIDeviceUnknowniPhone,
	UIDeviceUnknowniPod,
    UIDeviceUnknowniPad,
} UIDevicePlatform;

enum {
	UIDeviceSupportsGPS	= 1 << 0,
	UIDeviceBuiltInSpeaker = 1 << 1,
	UIDeviceBuiltInCamera = 1 << 2,
	UIDeviceBuiltInMicrophone = 1 << 3,
	UIDeviceSupportsExternalMicrophone = 1 << 4,
	UIDeviceSupportsTelephony = 1 << 5,
	UIDeviceSupportsVibration = 1 << 6,
	UIDeviceBuiltInCompass = 1 << 7,
	UIDeviceBuiltInLEDFlash = 1 << 8,
	UIDeviceBuiltInGyroscope = 1 << 9,
	UIDeviceBuiltInFrontCamera = 1 << 10,
};

@interface UIDevice (Hardware)
+ (NSString *) platform;
+ (int) platformType;
+ (NSString *) platformString;
+ (int) platformCapabilities;
@end
