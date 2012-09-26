//
//  UIBezierPath+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/21/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

static const int UIRectCornerTop = UIRectCornerTopLeft | UIRectCornerTopRight;
static const int UIRectCornerBottom = UIRectCornerBottomLeft | UIRectCornerBottomRight;

@interface UIBezierPath (Opetopic)

+(id) bezierPathWithPointedRoundedRect:(CGRect)rect radius:(CGFloat)radius pointerSize:(CGFloat)pointerSize;
+(id) popoverPathWithRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius arrowPosition:(CGPoint)position arrowSize:(CGSize)size;

-(void) fillAndStroke;
-(void) fillAndStrokeWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

@end
