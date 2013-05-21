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

-(void) dismissViewControllerWithAnimation {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL) isViewVisible {
    return self.isViewLoaded && self.view.window != nil;
}

-(void) simulateMemoryWarning {
#if TARGET_IPHONE_SIMULATOR
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"UISimulatedMemoryWarningNotification", NULL, NULL, true);
#endif
}

-(UIViewController*) mostParentViewController {
    UIViewController *rootViewController = self;
    while (rootViewController.parentViewController) {
        rootViewController = rootViewController.parentViewController;
    }
    return rootViewController;
}

@end
