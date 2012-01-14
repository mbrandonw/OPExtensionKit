//
//  UIViewController+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/24/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "UIViewController+Opetopic.h"

@implementation UIViewController (Opetopic)

-(void) dismissModalViewControllerWithAnimation {
	[self dismissModalViewControllerAnimated:YES];
}

-(BOOL) isVisible {
    return self.isViewLoaded && self.view.window != nil;
}

-(void) simulateMemoryWarning {
#if TARGET_IPHONE_SIMULATOR
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"UISimulatedMemoryWarningNotification", NULL, NULL, true);
#endif
}
#pragma mark -

@end
