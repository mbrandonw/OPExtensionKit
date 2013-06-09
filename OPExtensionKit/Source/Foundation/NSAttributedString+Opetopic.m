//
//  NSAttributedString+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 8/2/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "NSAttributedString+Opetopic.h"
#import "OPCache.h"
#import "NSCache+Opetopic.h"
#import "NSString+Opetopic.h"

@implementation NSAttributedString (Opetopic)

-(void) drawInRect:(CGRect)rect parentBounds:(CGRect)bounds {
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CTFramesetterRef framesetterRef = [self framesetterRef];
    
    CGContextSaveGState(c);
    {
        CGContextSetTextMatrix(c, CGAffineTransformIdentity);
        CGContextTranslateCTM(c, 0.0, bounds.size.height);
        CGContextScaleCTM(c, 1.0, -1.0);
        
        CGAffineTransform reverseT = CGAffineTransformIdentity;
        reverseT = CGAffineTransformScale(reverseT, 1.0, -1.0);
        reverseT = CGAffineTransformTranslate(reverseT, 0.0, -bounds.size.height);
        
        CGMutablePathRef topFramePath = CGPathCreateMutable();
        CGPathAddRect(topFramePath, NULL, CGRectApplyAffineTransform(rect, reverseT));
        
        CTFrameRef topFrame = (__bridge CTFrameRef)[[OPCache sharedCache] fetch:$strfmt(@"%p-topFrame",self) do:^id{
            return (__bridge_transfer id)CTFramesetterCreateFrame(framesetterRef, CFRangeMake(0,0), topFramePath, NULL);
        }];
        
        CTFrameDraw(topFrame, c);
    }
    CGContextRestoreGState(c);
}

-(CTFramesetterRef) framesetterRef {
    return (__bridge CTFramesetterRef)[[OPCache sharedCache] fetch:$strfmt(@"%p-framesetterRef",self) do:^id{
        return (__bridge_transfer id)CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self);
    }];
}

-(CGSize) sizeContrainedTo:(CGSize)constraints {
    
    CTFramesetterRef framesetterRef = [self framesetterRef];
    return CTFramesetterSuggestFrameSizeWithConstraints(framesetterRef, CFRangeMake(0, [self length]), NULL, constraints, NULL);
}

@end
