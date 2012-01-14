//
//  UIColorTest.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "UIColor+Opetopic.h"
#import "OPMacros.h"

#define kAccuracy   0.005f

@interface UIColorTest : GHTestCase

@end

@implementation UIColorTest

-(void) testRGBComponents {
    
    CGFloat r = 0.2f, g = 0.3f, b = 0.4f, a = 0.5f, w = 0.3f;
    
    UIColor *color = $rgbaf(r,g,b,a);
    GHAssertTrue(color.red == r, @"");
    GHAssertTrue(color.green == g, @"");
    GHAssertTrue(color.blue == b, @"");
    GHAssertTrue(color.alpha == a, @"");
    
    [color red:&r green:&g blue:&b alpha:&a];
    GHAssertTrue(color.red == r, @"");
    GHAssertTrue(color.green == g, @"");
    GHAssertTrue(color.blue == b, @"");
    GHAssertTrue(color.alpha == a, @"");
    
    color = $waf(w,a);
    GHAssertTrue(color.white == w, @"");
    GHAssertTrue(color.red == w, @"");
    GHAssertTrue(color.green == w, @"");
    GHAssertTrue(color.blue == w, @"");
    GHAssertTrue(color.alpha == a, @"");
}

-(void) testHex {
    
    CGFloat r = 50.0f/255.0f, g = 249.0f/255.0f, b = 173.0f/255.0f, a = 0.33f;
    UInt32 hex = 0x32f9ad;
    UIColor *color = [UIColor hex:hex alpha:a];
    
    GHAssertEqualsWithAccuracy(r, color.red, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(g, color.green, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(b, color.blue, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(a, color.alpha, kAccuracy, @"");
    GHAssertEquals(color.hex, hex, @"");
}

-(void) testHSL {
    
    NSUInteger r = 23, g = 120, b = 200, a = 65;
    NSUInteger h = 207, s = 79, l = 44;
    UIColor *rgb = $rgbai(r, g, b, a);
    UIColor *hsl = $hslai(h, s, l, a);
    
    GHAssertEqualsWithAccuracy(rgb.red, hsl.red, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(rgb.blue, hsl.blue, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(rgb.green, hsl.green, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(rgb.alpha, hsl.alpha, kAccuracy, @"");
    
    CGFloat hue, sat, light, alpha;
    [hsl hue:&hue saturation:&sat lightness:&light alpha:&alpha];
    GHAssertEqualsWithAccuracy(hue, h/360.0f, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(sat, s/100.0f, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(light, l/100.0f, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(alpha, a/100.0f, kAccuracy, @"");
}

-(void) testLighten {
    
    CGFloat r = 0.3f, g = 0.6f, b = 0.2f, a = 1.0f;
    UIColor *color = $waf(g, a);
    CGFloat p = 0.2f;
    UIColor *lighter = [color lighten:p];
}

@end
