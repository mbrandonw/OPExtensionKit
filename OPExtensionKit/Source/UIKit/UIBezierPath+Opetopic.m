//
//  UIBezierPath+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/21/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "UIBezierPath+Opetopic.h"

@implementation UIBezierPath (Opetopic)

+(id) bezierPathWithPointedRoundedRect:(CGRect)rect radius:(CGFloat)radius pointerSize:(CGFloat)pointerSize {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(pointerSize + radius*2.0f, 0.0f)];
    [path addLineToPoint:CGPointMake(rect.size.width - radius, 0.0f)];
    [path addArcWithCenter:CGPointMake(rect.size.width-radius, radius) radius:radius startAngle:-M_PI/2.0f endAngle:0.0f clockwise:YES];
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height-1.0f-radius)];
    [path addArcWithCenter:CGPointMake(rect.size.width-radius, rect.size.height-1.0f-radius) radius:radius startAngle:0.0f endAngle:M_PI/2.0f clockwise:YES];
    [path addLineToPoint:CGPointMake(pointerSize + radius*2.0f, rect.size.height-1.0f)];
    
    CGFloat angle = atanf(rect.size.height / (2.0f * pointerSize));
    [path addArcWithCenter:CGPointMake(pointerSize + radius, rect.size.height-1.0f-radius) radius:radius startAngle:M_PI/2.0f endAngle:M_PI/2.0f+angle clockwise:YES];
    
    CGFloat otherAngle = M_PI/2.0f - angle;
    
    [path addArcWithCenter:CGPointMake(radius/2.0f, rect.size.height/2.0f) radius:radius/2.0f startAngle:M_PI-otherAngle endAngle:M_PI+otherAngle clockwise:YES];
    
    [path addArcWithCenter:CGPointMake(pointerSize + radius, radius) radius:radius startAngle:-M_PI/2.0f-angle endAngle:-M_PI/2.0f clockwise:YES];
    
    [path applyTransform:CGAffineTransformMakeTranslation(rect.origin.x, rect.origin.y)];
    return path;
}

@end
