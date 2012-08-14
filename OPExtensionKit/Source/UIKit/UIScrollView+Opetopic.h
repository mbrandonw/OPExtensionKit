//
//  UIScrollView+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 3/21/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Opetopic)

/**
 */
@property (nonatomic, assign) CGFloat contentInsetLeft;
@property (nonatomic, assign) CGFloat contentInsetRight;
@property (nonatomic, assign) CGFloat contentInsetTop;
@property (nonatomic, assign) CGFloat contentInsetBottom;

@property (nonatomic, assign) CGFloat contentOffsetX;
@property (nonatomic, assign) CGFloat contentOffsetY;

-(void) setContentOffsetX:(CGFloat)x animated:(BOOL)animated;
-(void) setContentOffsetY:(CGFloat)y animated:(BOOL)animated;

@end
