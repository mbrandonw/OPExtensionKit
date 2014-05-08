//
//  UILabel+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 6/2/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Opetopic)

+(instancetype) ssStandardLabelWithSymbol:(NSString*)symbol size:(CGFloat)size;
+(instancetype) ssStandardLabelWithSymbol:(NSString*)symbol size:(CGFloat)size color:(UIColor*)color;

-(BOOL) isTruncating;

-(void) transitionTextColorTo:(UIColor*)color;
-(void) transitionTextColorTo:(UIColor*)color duration:(NSTimeInterval)duration;

@end
