//
//  UIProgressView+Opetopic.m
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 12/23/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "UIProgressView+Opetopic.h"

@implementation UIProgressView (Opetopic)

-(void) setProgressWithAnimation:(float)progress {
    
    if ([self respondsToSelector:@selector(setProgress:animated:)])
        [self setProgress:progress animated:YES];
    else
        [self setProgress:progress];
}

@end
