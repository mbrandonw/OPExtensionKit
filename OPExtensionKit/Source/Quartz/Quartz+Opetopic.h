//
//  Quartz+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

CATransform3D CATransform3DMakePerspective(CGFloat d);

CGRect CGRectTranslate(CGRect r, CGFloat tx, CGFloat ty);
CGRect CGRectEdgeInset(CGRect r, UIEdgeInsets inset);
CGPoint CGRectCenter(CGRect r);
CGPoint CGPointIntegral(CGPoint p);

void CGContextFillRectWithLinearGradient(CGContextRef c, CGRect r, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options);
