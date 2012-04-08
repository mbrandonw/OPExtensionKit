//
//  UIScrollView+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 3/21/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "UIScrollView+Opetopic.h"

@implementation UIScrollView (Opetopic)

-(void) setContentOffsetX:(CGFloat)x animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(x, self.contentOffset.y) animated:YES];
}

-(void) setContentOffsetY:(CGFloat)y animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(self.contentOffset.x, y) animated:YES];
}

@end
