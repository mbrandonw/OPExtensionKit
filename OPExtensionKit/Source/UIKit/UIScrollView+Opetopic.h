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

@property (nonatomic, assign) CGFloat scrollIndicatorInsetLeft;
@property (nonatomic, assign) CGFloat scrollIndicatorInsetRight;
@property (nonatomic, assign) CGFloat scrollIndicatorInsetTop;
@property (nonatomic, assign) CGFloat scrollIndicatorInsetBottom;

@property (nonatomic, assign) CGFloat contentOffsetX;
@property (nonatomic, assign) CGFloat contentOffsetY;

@property (nonatomic, assign) CGFloat contentSizeWidth;
@property (nonatomic, assign) CGFloat contentSizeHeight;

-(void) setContentOffsetX:(CGFloat)x animated:(BOOL)animated;
-(void) setContentOffsetY:(CGFloat)y animated:(BOOL)animated;

-(void) scrollRectToVisible:(CGRect)rect animated:(BOOL)animated position:(UITableViewScrollPosition)position;

@end
