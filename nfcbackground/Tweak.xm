#import "headers.h"

%hook NFHardwareManager
- (id)init {
	NSLog(@"NFCBackground - NFHardwareManager init");

	return %orig();
}
%end

%hook NFHardwareControllerInfo
- (id)initWithDictionary:(id)arg1 {
	NSLog(@"NFCBackground - NFHardwareControllerInfo initWithDictionary");

	NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
	[newDict addEntriesFromDictionary:arg1];
	[newDict setObject:@"1" forKey:@"hasLPCDSupport"];

	return %orig(newDict);
}
%end

// /**
//   Many thanks to @arandomdev, who helps me understanding the science behind the sense. Original repo: https://github.com/arandomdev/jailbreak
//  **/

// %hook NFBackgroundTagReadingManager
// - (id)initWithQueue:(id)arg1 driverWrapper:(id)arg2 lpcdHWSupport:(unsigned char)arg3 {
// 	NSLog(@"NFCBackground - initWithQueue");

// 	return %orig(arg1, arg2, 1);
// }

// %end

// // Added another hook to reset the NFC, thus you don't have to wait too long to discover your tags

// %hook _NFHardwareManager
// - (void)handleRemoteTagsDetected:(id)arg1 {
// 	NSLog(@"NFCBackground - handleRemoteTagsDetected");

// 	/*%orig;

// 	[NSThread sleepForTimeInterval:1.0];
// 	NFDriverWrapper *driver = MSHookIvar<NFDriverWrapper *>(self, "_driverWrapper");
// 	[driver closeSession];
// 	[driver restartDiscovery];*/
// }

// %end

// %ctor {
// 	NSLog(@"NFCBackground - Init")
// }