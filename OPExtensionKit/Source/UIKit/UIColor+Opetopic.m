//
//  UIColor+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "UIColor+Opetopic.h"
#import "OPMacros.h"
#import "OPCache.h"
#import "NSCache+Opetopic.h"

@implementation UIColor (Opetopic)

- (CGFloat)redf {
    NSAssert(self.canProvideRGBComponents, @"Must be an RGB color to use -red");
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    return c[0];
}

-(UInt8) redi {
    return (UInt8)roundf(self.redf * 255.0f);
}

- (CGFloat)greenf {
    NSAssert(self.canProvideRGBComponents, @"Must be an RGB color to use -green");
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if (self.colorSpaceModel == kCGColorSpaceModelMonochrome) return c[0];
    return c[1];
}

-(UInt8) greeni {
    return (UInt8)roundf(self.greenf * 255.0f);
}

- (CGFloat)bluef {
    NSAssert(self.canProvideRGBComponents, @"Must be an RGB color to use -blue");
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    if (self.colorSpaceModel == kCGColorSpaceModelMonochrome) return c[0];
    return c[2];
}

-(UInt8) bluei {
    return (UInt8)roundf(self.bluef * 255.0f);
}

- (CGFloat)whitef {
    NSAssert(self.colorSpaceModel == kCGColorSpaceModelMonochrome, @"Must be a Monochrome color to use -white");
    const CGFloat *c = CGColorGetComponents(self.CGColor);
    return c[0];
}

-(UInt8) whitei {
    return (UInt8)roundf(self.whitef * 100.0f);
}

- (CGFloat)alphaf {
    return CGColorGetAlpha(self.CGColor);
}

-(UInt8) alphai {
    return (UInt8)roundf(self.alphaf * 100.0f);
}

-(BOOL) RGBAf:(CGFloat*)red :(CGFloat*)green :(CGFloat*)blue :(CGFloat*)alpha {
    
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

-(BOOL) RGBAi:(UInt8*)red :(UInt8*)green :(UInt8*)blue :(UInt8*)alpha {
    
    CGFloat r,g,b,a;
    if (! [self RGBAf:&r :&g :&b :&a])
        return NO;
    
    if (red)
        *red = (UInt8)roundf(r * 255.0f);
    if (green)
        *green = (UInt8)roundf(g * 255.0f);
    if (blue)
        *blue = (UInt8)roundf(b * 255.0f);
    if (alpha)
        *alpha = (UInt8)roundf(a * 255.0f);
    
    return YES;
}

-(BOOL) HSBAf:(CGFloat*)hue :(CGFloat*)saturation :(CGFloat*)brightness :(CGFloat*)alpha {
    
    if ([self respondsToSelector:@selector(getHue:saturation:brightness:alpha:)])
        return [self getHue:hue saturation:saturation brightness:brightness alpha:alpha];
    return NO;
}

-(BOOL) HSBAi:(UInt16 *)hue :(UInt8 *)saturation :(UInt8 *)brightness :(UInt8 *)alpha {
    
    CGFloat h, s, b, a;
    if (! [self HSBAf:&h :&s :&b :&a])
        return NO;
    
    if (hue)
        *hue = (UInt16)roundf(h * 360.0f);
    if (saturation)
        *saturation = (UInt8)roundf(s * 100.0f);
    if (brightness)
        *brightness = (UInt8)roundf(b * 100.0f);
    if (alpha)
        *alpha = (UInt8)roundf(a * 100.0f);
    
    return YES;
}

-(BOOL) HSLAf:(CGFloat*)hue :(CGFloat*)saturation :(CGFloat*)lightness :(CGFloat*)alpha {
    
    CGFloat r, g, b;
    if (! [self RGBAf:&r :&g :&b :alpha])
        return NO;
    
    float h = 0, s = 0, l = 0, v, m, vm, r2, g2, b2;
     
    v = MAX(r, g);
    v = MAX(v, b);
    m = MIN(r, g);
    m = MIN(m, b);
    
    l = (m+v)/2.0f;
    
    if (l <= 0.0)
    {
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
    
    if (s > 0.0f)
    {
        s /= (l <= 0.5f) ? (v + m) : (2.0 - v - m); 
    }
    else
    {
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
    
    if (r == v)
        h = (g == m ? 5.0f + b2 : 1.0f - g2);
    else if (g == v)
        h = (b == m ? 1.0f + r2 : 3.0 - b2);
    else
        h = (r == m ? 3.0f + g2 : 5.0f - r2);
    
    h /= 6.0f;
    
    if(hue)
        *hue = h;
    if(saturation)
        *saturation = s;
    if(lightness)
        *lightness = l;
    
    return YES;
}

-(BOOL) HSLAi:(UInt16 *)hue :(UInt8 *)saturation :(UInt8 *)lightness :(UInt8 *)alpha {
    
    CGFloat h, s, l, a;
    if (! [self HSLAf:&h :&s :&l :&a])
        return NO;
    
    if (hue)
        *hue = (UInt16)roundf(h * 360.0f);
    if (saturation)
        *saturation = (UInt8)roundf(s * 100.0f);
    if (lightness)
        *lightness = (UInt8)roundf(l * 100.0f);
    if (alpha)
        *alpha = (UInt8)roundf(a * 100.0f);
    
    return YES;
}

+(UIColor*) colorWithHex:(UInt64)hex {
    return [UIColor colorWithHex:hex alpha:0xff];
}

+(UIColor*) colorWithHex:(UInt32)hex alpha:(UInt8)alpha {
    
    return [UIColor colorWithRed:((hex >> 16) & 0xff) / 255.0f
                           green:((hex >>  8) & 0xff) / 255.0f
                            blue:((hex >>  0) & 0xff) / 255.0f
                           alpha:alpha / 255.0f];
}

-(UInt32) hex {
    NSAssert(self.canProvideRGBComponents, @"Must be a RGB color to use hex");
    
    CGFloat r,g,b,a;
    if (![self RGBAf:&r :&g :&b :&a])
        return 0;
    
    return (((UInt32)roundf(r * 255)) << 16) | (((UInt32)roundf(g * 255)) << 8) | (((UInt32)roundf(b * 255)));
}

-(UInt64) hexa {
    NSAssert(self.canProvideRGBComponents, @"Must be a RGB color to use hex");
    
    CGFloat r,g,b,a;
    if (![self RGBAf:&r :&g :&b :&a])
        return 0;
    
    return 
    (((UInt64)roundf(r * 255)) << 24) | 
    (((UInt64)roundf(g * 255)) << 16) | 
    (((UInt64)roundf(b * 255)) <<  8) |
    (((UInt64)roundf(b * 255)) <<  0);
}

+(UIColor*) colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha {
    
    CGFloat temp1, temp2;
    CGFloat temp[3];
    NSUInteger i;
    
    // Check for saturation. If there isn't any just return the luminance value for each, which results in gray.
    if(saturation == 0.0)
        return $RGBAf(lightness, lightness, lightness, alpha);
    
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
    
    return $RGBAf(temp[0], temp[1], temp[2], alpha);
}

-(UIColor*) lighten:(CGFloat)percent {
    
    CGFloat h = 0.0f, s = 0.0f, l = 0.0f, a = 0.0f;
    [self HSLAf:&h :&s :&l :&a];
    return [UIColor colorWithHue:h saturation:s lightness:(l + (1.0f - l) * percent) alpha:a];
}

-(UIColor*) darken:(CGFloat)percent {
    
    CGFloat h = 0.0f, s = 0.0f, l = 0.0f, a = 0.0f;
    [self HSLAf:&h :&s :&l :&a];
    return [UIColor colorWithHue:h saturation:s lightness:(l - l * percent) alpha:a];
}

-(UIColor*) saturate:(CGFloat)percent {
    
    CGFloat h = 0.0f, s = 0.0f, l = 0.0f, a = 0.0f;
    [self HSLAf:&h :&s :&l :&a];
    return [UIColor colorWithHue:h saturation:(s+(1.0f-s)*percent) lightness:l alpha:a];
}

-(UIColor*) desaturate {
    
    CGFloat h = 0.0f, s = 0.0f, l = 0.0f, a = 0.0f;
    [self HSLAf:&h :&s :&l :&a];
    return [UIColor colorWithHue:h saturation:0.0f lightness:l alpha:a];
}

-(UIColor*) mix:(UIColor*)color {
    return [self mix:color amount:0.5f];
}

-(UIColor*) mix:(UIColor*)color amount:(CGFloat)amount {
    
    CGFloat r1 = 0.0f,g1 = 0.0f,b1 = 0.0f,a1 = 0.0f, r2 = 0.0f,g2 = 0.0f,b2 = 0.0f,a2 = 0.0f;
    [self RGBAf:&r1 :&g1 :&b1 :&a1];
    [self RGBAf:&r2 :&g2 :&b2 :&a2];
    return [UIColor colorWithRed:(r1*amount + r2*(amount-1.0f))
                           green:(g1*amount + g2*(amount-1.0f))
                            blue:(b1*amount + b2*(amount-1.0f))
                           alpha:(a1*amount + a2*(amount-1.0f))];
}

+(UIColor*) veryLightGrayColor {
    return [[OPCache sharedCache] fetch:@"UIColor/Opetopic/veryLightGrayColor" :^id{
        return $WAf(0.85f, 1.0f);
    }];
}

+(UIColor*) veryDarkGrayColor {
    return [[OPCache sharedCache] fetch:@"UIColor/Opetopic/veryDarkGrayColor" :^id{
        return $WAf(0.15f, 1.0f);
    }];
}

+(UIColor*) facebookBlue {
    return [[OPCache sharedCache] fetch:@"UIColor/Opetopic/facebookBlue" :^id{
        return $hex(0x3b5998);
    }];
}

+(UIColor*) facebookBlueHover {
  return [[OPCache sharedCache] fetch:@"UIColor/Opetopic/facebookBlueHover" :^id{
    return $hex(0x30487b);
  }];
}

+(UIColor*) TwitterBlueColor {
    return [[OPCache sharedCache] fetch:@"UIColor/Opetopic/TwitterBlueColor" :^id{
        return $RGBi(64,153,255);
    }];
}

+(UIColor*) UIKitHighlightBlueTopColor {
    return [[OPCache sharedCache] fetch:@"UIColor/Opetopic/UIKitHighlightBlueTopColor" :^id{
        return $RGBi(5, 140, 245);
    }];
}

+(UIColor*) UIKitHighlightBlueBottomColor {
    return [[OPCache sharedCache] fetch:@"UIColor/Opetopic/UIKitHighlightBlueBottomColor" :^id{
        return $RGBi(1, 95, 230);
    }];
}

+(UIColor*) darkBlueColor {
    return [[OPCache sharedCache] fetch:@"UIColor/Opetopic/darkBlueColor" :^id{
        return $RGBi(81, 102, 145);
    }];
}

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

@end
