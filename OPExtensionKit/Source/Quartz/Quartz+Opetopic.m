//
//  Quartz+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "Quartz+Opetopic.h"

CATransform3D CATransform3DMakePerspective(CGFloat d) {
    
    CATransform3D t = CATransform3DIdentity;
    t.m34 = -1.0f / d;
    return t;
}

CGRect CGRectTranslate(CGRect r, CGFloat tx, CGFloat ty) {
    return CGRectMake(r.origin.x+tx, r.origin.y+ty, r.size.width, r.size.height);
}

CGRect CGRectEdgeInset(CGRect r, UIEdgeInsets inset) {
    return CGRectMake(r.origin.x+inset.left, r.origin.y+inset.top, r.size.width-inset.left-inset.right, r.size.height-inset.top-inset.bottom);
}

CGPoint CGRectCenter(CGRect r) {
    return CGPointMake(r.origin.x + r.size.width/2.0f, r.origin.y + r.size.height/2.0f);
}

CGPoint CGPointIntegral(CGPoint p) {
    return CGPointMake(roundf(p.x), roundf(p.y));
}

void CGContextFillRectWithLinearGradient(CGContextRef c, CGRect r, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options) {
    
    CGContextSaveGState(c);
    {
        CGContextClipToRect(c, r);
        CGContextDrawLinearGradient(c, gradient, startPoint, endPoint, options);
    }
    CGContextRestoreGState(c);
}
