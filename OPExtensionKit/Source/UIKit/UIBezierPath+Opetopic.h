//
//  UIBezierPath+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/21/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Opetopic)

+(id) bezierPathWithPointedRoundedRect:(CGRect)rect radius:(CGFloat)radius pointerSize:(CGFloat)pointerSize;

@end
