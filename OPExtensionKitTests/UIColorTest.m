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
    
    UIColor *color = $RGBAf(r,g,b,a);
    GHAssertTrue(color.redf == r, @"");
    GHAssertTrue(color.greenf == g, @"");
    GHAssertTrue(color.bluef == b, @"");
    GHAssertTrue(color.alphaf == a, @"");
    
    [color RGBAf:&r :&g :&b :&a];
    GHAssertTrue(color.redf == r, @"");
    GHAssertTrue(color.greenf == g, @"");
    GHAssertTrue(color.bluef == b, @"");
    GHAssertTrue(color.alphaf == a, @"");
    
    color = $WAf(w,a);
    GHAssertTrue(color.whitef == w, @"");
    GHAssertTrue(color.redf == w, @"");
    GHAssertTrue(color.greenf == w, @"");
    GHAssertTrue(color.bluef == w, @"");
    GHAssertTrue(color.alphaf == a, @"");
}

-(void) testHex {
    
    CGFloat r = 50.0f/255.0f, g = 249.0f/255.0f, b = 173.0f/255.0f, a = 0.6666666f;
    UInt32 hex = 0x32f9ad;
    UIColor *color = [UIColor colorWithHex:hex alpha:a];
    
    GHAssertEqualsWithAccuracy(r, color.redf, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(g, color.greenf, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(b, color.bluef, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(a, color.alphaf, kAccuracy, @"");
    GHAssertEquals(color.hex, hex, @"");
}

-(void) testHSL {
    
    NSUInteger r = 23, g = 120, b = 200, a = 65;
    NSUInteger h = 207, s = 79, l = 44;
    UIColor *rgb = $RGBAi(r, g, b, a);
    UIColor *hsl = $HSLAi(h, s, l, a);
    
    GHAssertEqualsWithAccuracy(rgb.redf, hsl.redf, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(rgb.bluef, hsl.bluef, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(rgb.greenf, hsl.greenf, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(rgb.alphaf, hsl.alphaf, kAccuracy, @"");
    
    CGFloat hue, sat, light, alpha;
    [hsl HSLAf:&hue :&sat :&light :&alpha];
    GHAssertEqualsWithAccuracy(hue, h/360.0f, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(sat, s/100.0f, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(light, l/100.0f, kAccuracy, @"");
    GHAssertEqualsWithAccuracy(alpha, a/100.0f, kAccuracy, @"");
}

-(void) testGettingColorComponentsWithNullPoints {
    
    CGFloat r = 0.3f, g = 0.5f, b = 0.8f, a = 0.4f;
    UIColor *color = $RGBAf(r, g, b, a);
    
    GHAssertNoThrow([color RGBAf:NULL :NULL :NULL :NULL], @"");
    GHAssertNoThrow([color HSLAf:NULL :NULL :NULL :NULL], @"");
    GHAssertNoThrow([color HSBAf:NULL :NULL :NULL :NULL], @"");
    GHAssertNoThrow([color RGBAi:NULL :NULL :NULL :NULL], @"");
    GHAssertNoThrow([color HSLAi:NULL :NULL :NULL :NULL], @"");
    GHAssertNoThrow([color HSBAi:NULL :NULL :NULL :NULL], @"");
}

@end
