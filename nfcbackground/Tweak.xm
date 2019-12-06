#import "headers.h"

// /**
//   Many thanks to @arandomdev, who helps me understanding the science behind the sense. Original repo: https://github.com/arandomdev/jailbreak
//  **/

%hook NFHardwareControllerInfo
- (id)initWithDictionary:(id)arg1 {
	NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
	[newDict addEntriesFromDictionary:arg1];
	[newDict setObject:@"1" forKey:@"hasLPCDSupport"];

	return %orig(newDict);
}
%end