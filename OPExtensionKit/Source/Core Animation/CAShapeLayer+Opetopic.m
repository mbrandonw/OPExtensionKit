//
//  CAShapeLayer+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 1/26/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "CAShapeLayer+Opetopic.h"

@implementation CAShapeLayer (Opetopic)

+(id) shapeLayerWithPath:(CGPathRef)path {
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path;
    return layer;
}

@end
