//
//  UIImage+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 7/3/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "UIImage+Opetopic.h"
#import "NSCache+Opetopic.h"

@implementation UIImage (Opetopic)

-(NSInteger) rightCapWidth {
	return (NSInteger)self.size.width - self.leftCapWidth - 1;
}

-(NSInteger) bottomCapHeight {
	return (NSInteger)self.size.height - self.topCapHeight - 1;
}

-(BOOL) isStretchableImage {
    
    if ([self respondsToSelector:@selector(leftCapWidth)] && [self respondsToSelector:@selector(topCapHeight)] &&
        (self.leftCapWidth > 0.0f || self.rightCapWidth > 0.0f))
        return YES;
    
    if ([self respondsToSelector:@selector(capInsets)] && ! UIEdgeInsetsEqualToEdgeInsets(self.capInsets, UIEdgeInsetsZero))
        return YES;
    
    return NO;
}

+(UIImage*) imageFromColor:(UIColor *)color {
    return [[NSCache sharedCache] fetch:color :^id{
        
        CGRect rect = {0.0f, 0.0f, 1.0f, 1.0f};
        
        UIImage *retVal = nil;
        UIGraphicsBeginImageContext(rect.size);
        {
            [color setFill];
            CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
            retVal = UIGraphicsGetImageFromCurrentImageContext();
        }
        UIGraphicsEndImageContext();
        
        return retVal;
        
    }];
}

@end
