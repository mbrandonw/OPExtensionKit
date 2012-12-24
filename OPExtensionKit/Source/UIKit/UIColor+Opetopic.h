//
//  UIColor+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Macro for creating RGBA colors, with values in range 0<=R,G,B<=255, 0<=A<=100
 */
#define $RGBi(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define $RGBAi(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)/100.0f]

/**
 Macro for creating RGBA colors, with values in range 0<=R,G,B<=1, 0<=A<=1
 */
#define $RGBf(r,g,b)    [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:1.0f]
#define $RGBAf(r,g,b,a) [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:(a)]

/**
 Macro for creating (White,Alpha) colors, with values in range 0<=W,A<=100
 */
#define $WAi(w,a)       [UIColor colorWithWhite:(w)/255.0f alpha:(a)/100.0f]

/**
 Macro for creating (White,Alpha) colors, with values in range 0<=W,A<=1
 */
#define $WAf(w,a)       [UIColor colorWithWhite:(w) alpha:(a)]

/**
 Macro for creating HSBA colors, with values in range 0<=H,S,B,A<=1
 */
#define $HSBf(h,s,b)    [UIColor colorWithHue:(h) saturation:(s) brightness:(b) alpha:1.0f]
#define $HSBAf(h,s,b,a) [UIColor colorWithHue:(h) saturation:(s) brightness:(b) alpha:(a)]

/**
 Macro for creating HSBA colors, with values in range 0<=H<=360, 0<=S,B,A<=100
 */
#define $HSBi(h,s,b)    [UIColor colorWithHue:(h)/360.0f saturation:(s)/100.0f brightness:(b)/100.0f alpha:1.0f]
#define $HSBAi(h,s,b,a) [UIColor colorWithHue:(h)/360.0f saturation:(s)/100.0f brightness:(b)/100.0f alpha:(a)/100.0f]

/**
 Macro for creating HSLA colors, with values in range 0<=H<=360, 0<=S,L,A<=100
 */
#define $HSLi(h,s,l)    [UIColor colorWithHue:(h)/360.0f saturation:(s)/100.0f lightness:(l)/100.0f alpha:1.0f]
#define $HSLAi(h,s,l,a) [UIColor colorWithHue:(h)/360.0f saturation:(s)/100.0f lightness:(l)/100.0f alpha:(a)/100.0f]

/**
 Macro for creating HSLA colors, with values in range 0<=H,S,L,A<=1
 */
#define $HSLf(h,s,l)    [UIColor colorWithHue:(h)/360.0f saturation:(s)/100.0f lightness:(l)/100.0f alpha:1.0f]
#define $HSLAf(h,s,l,a) [UIColor colorWithHue:(h) saturation:(s) lightness:(l) alpha:(a)]

/* Macro for creating colors from hex values.
 */
#define $hex(h)     [UIColor colorWithHex:(h)]
#define $hexa(h,a)  [UIColor colorWithHex:(h) alpha:(a)]

@interface UIColor (Opetopic)

/**
 Accessing color components easily.
 */
-(CGFloat) redf;    // red component, between 0 and 1
-(UInt8) redi;      // red component, between 0 and 255
-(CGFloat) greenf;  // green component, between 0 and 1
-(UInt8) greeni;    // green component, between 0 and 255
-(CGFloat) bluef;   // blue component, between 0 and 1
-(UInt8) bluei;     // blue component, between 0 and 255
-(CGFloat) whitef;  // white component, between 0 and 1
-(UInt8) whitei;    // white component, between 0 and 100
-(CGFloat) alphaf;  // alpha component, between 0 and 1
-(UInt8) alphai;    // alpha component, between 0 and 100

/**
 Get all RGBA components at once
 */
-(BOOL) RGBAf:(CGFloat*)red :(CGFloat*)green :(CGFloat*)blue :(CGFloat*)alpha;
-(BOOL) RGBAi:(UInt8*)red :(UInt8*)green :(UInt8*)blue :(UInt8*)alpha;

/**
 Get all HSBA components at once
 */
-(BOOL) HSBAf:(CGFloat*)hue :(CGFloat*)saturation :(CGFloat*)brightness :(CGFloat*)alpha;
-(BOOL) HSBAi:(UInt16*)hue :(UInt8*)saturation :(UInt8*)brightness :(UInt8*)alpha;

/**
 Get all HSLA components at once
 */
-(BOOL) HSLAf:(CGFloat*)hue :(CGFloat*)saturation :(CGFloat*)lightness :(CGFloat*)alpha;
-(BOOL) HSLAi:(UInt16*)hue :(UInt8*)saturation :(UInt8*)lightness :(UInt8*)alpha;

/**
 Creating colors from hex values.
 */
+(UIColor*) colorWithHex:(UInt64)hex;
+(UIColor*) colorWithHex:(UInt32)hex alpha:(UInt8)alpha;
-(UInt32) hex;
-(UInt64) hexa;

/**
 Creating colors from HSL
 */
+(UIColor*) colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;

/**
 Creating new colors by applying effects.
 */
-(UIColor*) lighten:(CGFloat)percent;
-(UIColor*) darken:(CGFloat)percent;
-(UIColor*) saturate:(CGFloat)percent;
-(UIColor*) desaturate;
-(UIColor*) mix:(UIColor*)color;
-(UIColor*) mix:(UIColor*)color amount:(CGFloat)amount;

/**
 Color palette.
 */
+(UIColor*) veryLightGrayColor;
+(UIColor*) veryDarkGrayColor;
+(UIColor*) FacebookBlueColor;
+(UIColor*) TwitterBlueColor;
+(UIColor*) UIKitHighlightBlueTopColor;
+(UIColor*) UIKitHighlightBlueBottomColor;
+(UIColor*) darkBlueColor;

/**
 Accessing color model info easily.
 */
-(CGColorSpaceModel) colorSpaceModel;
-(BOOL) canProvideRGBComponents;

@end
