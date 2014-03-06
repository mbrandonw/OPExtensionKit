//
//  UIViewController+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/24/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (Opetopic)

-(void) dismissModalViewControllerWithAnimation;
-(void) dismissViewControllerWithAnimation;
-(BOOL) isViewVisible;
-(void) simulateMemoryWarning;
-(UIViewController*) mostParentViewController;

-(BOOL) orientationIsPortrait;
-(BOOL) orientationIsLandscape;

/**
 */
-(void) traverseSelfAndChildrenControllers:(void(^)(UIViewController *child))block;
-(void) traverseChildrenControllers:(void(^)(UIViewController *child))block;

@end
