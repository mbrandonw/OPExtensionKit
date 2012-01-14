//
//  UINavigationController+Opetopic.m
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 6/25/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "UINavigationController+Opetopic.h"

@implementation UINavigationController (Opetopic)

-(void) popViewControllerWithAnimation {
	[self popViewControllerAnimated:YES];
}

-(void) popViewControllerWithoutAnimation {
    [self popViewControllerAnimated:NO];
}

@end
