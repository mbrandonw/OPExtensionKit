//
//  UINavigationController+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 6/25/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UINavigationController (Opetopic)

@property (nonatomic, readonly) UIViewController *rootViewController;

-(void) popViewControllerWithAnimation;
-(void) popViewControllerWithoutAnimation;

@end
