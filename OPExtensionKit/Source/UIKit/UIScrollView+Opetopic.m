//
//  UIScrollView+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 3/21/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "UIScrollView+Opetopic.h"

@implementation UIScrollView (Opetopic)

-(void) setContentInsetLeft:(CGFloat)contentInsetLeft {
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, contentInsetLeft, self.contentInset.bottom, self.contentInset.right);
}

-(CGFloat) contentInsetLeft {
    return self.contentInset.left;
}

-(void) setContentInsetRight:(CGFloat)contentInsetRight {
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom, contentInsetRight);
}

-(CGFloat) contentInsetRight {
    return self.contentInset.right;
}

-(void) setContentInsetTop:(CGFloat)contentInsetTop {
    self.contentInset = UIEdgeInsetsMake(contentInsetTop, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
}

-(CGFloat) contentInsetTop {
    return self.contentInset.top;
}

-(void) setContentInsetBottom:(CGFloat)contentInsetBottom {
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, contentInsetBottom, self.contentInset.right);
}

-(CGFloat) contentInsetBottom {
    return self.contentInset.bottom;
}

-(void) setContentOffsetX:(CGFloat)contentOffsetX {
    [self setContentOffsetX:contentOffsetX animated:NO];
}

-(CGFloat) contentOffsetX {
    return self.contentOffset.x;
}

-(void) setContentOffsetY:(CGFloat)contentOffsetY {
    [self setContentOffsetY:contentOffsetY animated:NO];
}

-(CGFloat) contentOffsetY {
    return self.contentOffset.y;
}

-(void) setContentOffsetX:(CGFloat)x animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(x, self.contentOffset.y) animated:YES];
}

-(void) setContentOffsetY:(CGFloat)y animated:(BOOL)animated {
    [self setContentOffset:CGPointMake(self.contentOffset.x, y) animated:YES];
}

@end
