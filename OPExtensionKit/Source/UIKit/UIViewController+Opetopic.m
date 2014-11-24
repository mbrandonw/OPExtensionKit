//
//  UIViewController+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/24/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "UIViewController+Opetopic.h"
@import ObjectiveC;

@implementation UIViewController (Opetopic)

-(void) dismissModalViewControllerWithAnimation {
	[self dismissViewControllerAnimated:YES completion:nil];
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

-(BOOL) orientationIsPortrait {
  return UIInterfaceOrientationIsPortrait(self.interfaceOrientation);
}

-(BOOL) orientationIsLandscape {
  return UIInterfaceOrientationIsLandscape(self.interfaceOrientation);
}

-(void) traverseSelfAndChildrenControllers:(void(^)(UIViewController *child))block {
  block(self);
  for (UIViewController *child in self.childViewControllers) {
    [child traverseSelfAndChildrenControllers:block];
  }
}

-(void) traverseChildrenControllers:(void(^)(UIViewController *child))block {
  for (UIViewController *child in self.childViewControllers) {
    [child traverseSelfAndChildrenControllers:block];
  }
}

-(Class) viewClass {
  return self.class.viewClass;
}

+(Class) viewClass {
  objc_property_t property = class_getProperty([self class], [@"view" UTF8String]);
  NSString *propertyAttributes = [NSString stringWithUTF8String:property_getAttributes(property)];
  NSUInteger location = 3;
  NSUInteger length = [propertyAttributes rangeOfString:@"\","].location - location;
  NSString *classString = [propertyAttributes substringWithRange:NSMakeRange(location, length)];
  return NSClassFromString(classString);
}

-(UIView*) lazyView {
  return [self isViewLoaded] ? self.view : nil;
}

-(void) setNeedsStatusBarAppearanceUpdateAnimated:(NSTimeInterval)duration {
  if (duration > 0.0) {
    [UIView animateWithDuration:duration animations:^{
      [self setNeedsStatusBarAppearanceUpdate];
    }];
  } else {
    [self setNeedsStatusBarAppearanceUpdate];
  }
}

@end
