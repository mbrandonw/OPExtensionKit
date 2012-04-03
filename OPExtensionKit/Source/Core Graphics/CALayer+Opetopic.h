//
//  CALayer+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/3/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Opetopic)

/**
 The layer's left most point's x-coordinate.
 */
@property (nonatomic, assign) CGFloat left;

/**
 The layer's right most point's x-coordinate.
 */
@property (nonatomic, assign) CGFloat right;

/**
 The layer's top most point's y-coordinate.
 */
@property (nonatomic, assign) CGFloat top;

/**
 The layer's bottom most point's y-coordinate.
 */
@property (nonatomic, assign) CGFloat bottom;

/**
 The layer's width.
 */
@property (nonatomic, assign) CGFloat width;

/**
 The layer's height.
 */
@property (nonatomic, assign) CGFloat height;

/**
 The layer's size struct.
 */
@property (nonatomic, assign) CGSize size;

/**
 */
-(void) setNeedsDisplayAndLayout;

/**
 Add a sublayer to the back of the hierarcy.
 */
-(void) addSublayerToBack:(CALayer*)layer;

/**
 Hides all of the layer's sublayers.
 */
-(void) hideAllSublayers;

/**
 Removes all of the layer's sublayers.
 */
-(void) removeAllSublayers;

@end
