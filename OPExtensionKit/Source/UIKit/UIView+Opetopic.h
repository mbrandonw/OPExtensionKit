//
//  UIView+Opetopic.h
//  OPKit
//
//  Created by Brandon Williams on 4/25/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** UIView Extensions
 
 Extensions to UIView for obtaining basic geometric information
 and better handling of subviews.
 */

#import <UIKit/UIKit.h>

@interface UIView (Opetopic)

/**
 The view's left most point's x-coordinate.
 */
@property (nonatomic, assign) CGFloat left;

/**
 The view's right most point's x-coordinate.
 */
@property (nonatomic, assign) CGFloat right;

/**
 The view's top most point's y-coordinate.
 */
@property (nonatomic, assign) CGFloat top;

/**
 The view's bottom most point's y-coordinate.
 */
@property (nonatomic, assign) CGFloat bottom;

/**
 The view's width.
 */
@property (nonatomic, assign) CGFloat width;

/**
 The view's height.
 */
@property (nonatomic, assign) CGFloat height;

/**
 The view's size struct.
 */
@property (nonatomic, assign) CGSize size;

/**
 The view's center's x-coordinate.
 */
@property (nonatomic, assign) CGFloat centerX;

/**
 The view's center's y-coordinate.
 */
@property (nonatomic, assign) CGFloat centerY;

/**
 Hides all of the view's subviews.
 */
-(void) hideAllSubviews;

/**
 Removes all of the view's subviews.
 */
-(void) removeAllSubviews;

@end
