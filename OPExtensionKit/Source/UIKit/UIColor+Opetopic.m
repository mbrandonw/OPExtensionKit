//
//  UIColor+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "UIColor+Opetopic.h"
#import "OPMacros.h"

@implementation UIColor (Opetopic)

- (CGColorSpaceModel)colorSpaceModel {
    return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (BOOL)canProvideRGBComponents {
    switch (self.colorSpaceModel) {
        case kCGColorSpaceModelRGB:
        case kCGColorSpaceModelMonochrome:
            return YES;
        default:
            return NO;
    }
}

- (CGFloat)red {
    NSAssert(self.canProvideRGBComponents, @"Must be an RGB color to use -red");
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    return c[0];
}

- (CGFloat)green {
    NSAssert(self.canProvideRGBComponents, @"Must be an RGB color to use -green");
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if (self.colorSpaceModel == kCGColorSpaceModelMonochrome) return c[0];
    return c[1];
}

- (CGFloat)blue {
    NSAssert(self.canProvideRGBComponents, @"Must be an RGB color to use -blue");
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if (self.colorSpaceModel == kCGColorSpaceModelMonochrome) return c[0];
    return c[2];
}

- (CGFloat)white {
    NSAssert(self.colorSpaceModel == kCGColorSpaceModelMonochrome, @"Must be a Monochrome color to use -white");
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    return c[0];
}

- (CGFloat)alpha {
    return CGColorGetAlpha(self.CGColor);
}

-(BOOL) red:(CGFloat*)red green:(CGFloat*)green blue:(CGFloat*)blue alpha:(CGFloat*)alpha {
    
    CGFloat r,g,b,a;
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    switch (self.colorSpaceModel)
    {
        case kCGColorSpaceModelMonochrome:
            r = g = b = components[0];
            a = components[1];
            break;
        case kCGColorSpaceModelRGB:
            r = components[0];
            g = components[1];
            b = components[2];
            a = components[3];
            break;
        default: // We don't know how to handle this model
            return NO;
    }
    
    if (red)
        *red = r;
    if (green)
        *green = g;
    if (blue)
        *blue = b;
    if (alpha)
        *alpha = a;
    return YES;
}

-(BOOL) hue:(CGFloat*)hue saturation:(CGFloat*)saturation brightness:(CGFloat*)brightness alpha:(CGFloat*)alpha {
    
    if ([self respondsToSelector:@selector(getHue:saturation:brightness:alpha:)])
        return [self getHue:hue saturation:saturation brightness:brightness alpha:alpha];
    return NO;
}

-(BOOL) hue:(CGFloat*)hue saturation:(CGFloat*)saturation lightness:(CGFloat*)lightness alpha:(CGFloat*)alpha {
    
    CGFloat r, g, b;
    if (! [self red:&r green:&g blue:&b alpha:alpha])
        return NO;
    
    float h,s, l, v, m, vm, r2, g2, b2;
    
    h = 0;
    s = 0;
    l = 0;
    
    v = MAX(r, g);
    v = MAX(v, b);
    m = MIN(r, g);
    m = MIN(m, b);
    
    l = (m+v)/2.0f;
    
    if (l <= 0.0){
        if(hue)
            *hue = h;
        if(saturation)
            *saturation = s;
        if(lightness)
            *lightness = l;
        return YES;
    }
    
    vm = v - m;
    s = vm;
    
    if (s > 0.0f){
        s/= (l <= 0.5f) ? (v + m) : (2.0 - v - m); 
    }else{
        if(hue)
            *hue = h;
        if(saturation)
            *saturation = s;
        if(lightness)
            *lightness = l;
        return YES;
    }
    
    r2 = (v - r)/vm;
    g2 = (v - g)/vm;
    b2 = (v - b)/vm;
    
    if (r == v){
        h = (g == m ? 5.0f + b2 : 1.0f - g2);
    }else if (g == v){
        h = (b == m ? 1.0f + r2 : 3.0 - b2);
    }else{
        h = (r == m ? 3.0f + g2 : 5.0f - r2);
    }
    
    h/=6.0f;
    
    if(hue)
        *hue = h;
    if(saturation)
        *saturation = s;
    if(lightness)
        *lightness = l;
    
    return YES;
}

+(UIColor*) hex:(UInt32)hex {
    return [UIColor hex:hex alpha:1.0f];
}

+(UIColor*) hex:(UInt32)hex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hex & 0xff0000) >> 16)/255.0f
                           green:((hex & 0xff00) >> 8)/255.0f
                            blue:(hex & 0xff)/255.0f
                           alpha:alpha];
}

-(UInt32) hex {
    NSAssert(self.canProvideRGBComponents, @"Must be a RGB color to use rgbHex");
    
    CGFloat r,g,b,a;
    if (![self red:&r green:&g blue:&b alpha:&a])
        return 0;
    
    r = clip(self.red, 0.0f, 1.0f);
    g = clip(self.green, 0.0f, 1.0f);
    b = clip(self.blue, 0.0f, 1.0f);
    
    return (((int)roundf(r * 255)) << 16) | (((int)roundf(g * 255)) << 8) | (((int)roundf(b * 255)));
}

+(UIColor*) colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha {
    
    CGFloat temp1, temp2;
    CGFloat temp[3];
    NSUInteger i;
    
    // Check for saturation. If there isn't any just return the luminance value for each, which results in gray.
    if(saturation == 0.0)
        return $rgbaf(lightness, lightness, lightness, alpha);
    
    // Test for luminance and compute temporary values based on luminance and saturation 
    if(lightness < 0.5)
        temp2 = lightness * (1.0 + saturation);
    else
        temp2 = lightness + saturation - lightness * saturation;
    temp1 = 2.0 * lightness - temp2;
    
    // Compute intermediate values based on hue
    temp[0] = hue + 1.0 / 3.0;
    temp[1] = hue;
    temp[2] = hue - 1.0 / 3.0;
    
    for(i = 0; i < 3; ++i) {
        
        // Adjust the range
        if(temp[i] < 0.0)
            temp[i] += 1.0;
        if(temp[i] > 1.0)
            temp[i] -= 1.0;
        
        if(6.0 * temp[i] < 1.0)
            temp[i] = temp1 + (temp2 - temp1) * 6.0 * temp[i];
        else {
            if(2.0 * temp[i] < 1.0)
                temp[i] = temp2;
            else {
                if(3.0 * temp[i] < 2.0)
                    temp[i] = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - temp[i]) * 6.0;
                else
                    temp[i] = temp1;
            }
        }
    }
    
    return $rgbaf(temp[0], temp[1], temp[2], alpha);
}

-(UIColor*) lighten:(CGFloat)percent {
    
    CGFloat h, s, l, a;
    [self hue:&h saturation:&s lightness:&l alpha:&a];
    return [UIColor colorWithHue:h saturation:s lightness:(l + (1.0f - l) * percent) alpha:a];
}

-(UIColor*) darken:(CGFloat)percent {
    
    CGFloat h, s, l, a;
    [self hue:&h saturation:&s lightness:&l alpha:&a];
    return [UIColor colorWithHue:h saturation:s lightness:(l - l * percent) alpha:a];
}

-(UIColor*) mix:(UIColor*)color {
    return [self mix:color amount:0.5f];
}

-(UIColor*) mix:(UIColor*)color amount:(CGFloat)amount {
    
    CGFloat r1,g1,b1,a1, r2,g2,b2,a2;
    [self red:&r1 green:&g1 blue:&b1 alpha:&a1];
    [self red:&r2 green:&g2 blue:&b2 alpha:&a2];
    return [UIColor colorWithRed:(r1*amount + r2*(amount-1.0f))
                           green:(g1*amount + g2*(amount-1.0f))
                            blue:(b1*amount + b2*(amount-1.0f))
                           alpha:(a1*amount + a2*(amount-1.0f))];
}

+(UIColor*) veryLightGrayColor {
    return $waf(0.85f, 1.0f);
}

+(UIColor*) veryDarkGrayColor {
    return $waf(0.15f, 1.0f);
}

+(UIColor*) FacebookBlueColor {
    return $rgbi(59, 89, 182);
}

+(UIColor*) TwitterBlueColor {
    return $rgbi(64,153,255);
}

+(UIColor*) UIKitHighlightBlueTopColor {
    return $rgbi(5, 140, 245);
}

+(UIColor*) UIKitHighlightBlueBottomColor {
    return $rgbi(1, 95, 230);
}

@end
