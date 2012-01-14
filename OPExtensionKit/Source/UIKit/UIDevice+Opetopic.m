//
//  UIDevice+Opetopic.m
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 11/28/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "UIDevice+Opetopic.h"
#import "NSString+Opetopic.h"

@implementation UIDevice (Opetopic)

#pragma mark Device capabilities
+(BOOL) isGameCenterReady {
	
    // Check for presence of GKLocalPlayer API.
    Class gcClass = (NSClassFromString(@"GKLocalPlayer"));
	
    // The device must be running running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
	
    return (gcClass && osVersionSupported);
}

+(BOOL) isHD {
	return ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) || ([UIScreen instancesRespondToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] > 1.0f));
}

+(BOOL) isPhone {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

+(BOOL) isPad {
	return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+(BOOL) isFast {
	
#if defined(__ARM_NEON__) || defined(__MAC_OS_X_VERSION_MAX_ALLOWED) || TARGET_IPHONE_SIMULATOR
	return YES;
#else
	return NO;
#endif
}

+(BOOL) hasFacetime {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"facetime://"]];
}

+(BOOL) hasTelephony {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
}
#pragma mark -

@end
