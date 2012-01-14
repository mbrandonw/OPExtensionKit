//
//  UIColor+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

#define $rgbi(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define $rgbai(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)/100.0f]

#define $rgbf(r,g,b)    [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:1.0f]
#define $rgbaf(r,g,b,a) [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:(a)]

#define $wai(w,a)       [UIColor colorWithWhite:(w)/255.0f alpha:(a)/100.0f]
#define $waf(w,a)       [UIColor colorWithWhite:(w) alpha:(a)]

#define $hsli(h,s,l)    [UIColor colorWithHue:(h)/360.0f saturation:(s)/100.0f lightness:(l)/100.0f alpha:1.0f]
#define $hslai(h,s,l,a) [UIColor colorWithHue:(h)/360.0f saturation:(s)/100.0f lightness:(l)/100.0f alpha:(a)/100.0f]
#define $hslf(h,s,l)    [UIColor colorWithHue:(h)/360.0f saturation:(s)/100.0f lightness:(l)/100.0f alpha:1.0f]
#define $hslaf(h,s,l,a) [UIColor colorWithHue:(h) saturation:(s) lightness:(l) alpha:(a)]

@interface UIColor (Opetopic)

/**
 Accessing color model info easily.
 */
-(CGColorSpaceModel) colorSpaceModel;
-(BOOL) canProvideRGBComponents;

/**
 Accessing color components easily.
 */
-(CGFloat) red;    // Only valid if canProvideRGBComponents is YES
-(CGFloat) green;  // Only valid if canProvideRGBComponents is YES
-(CGFloat) blue;   // Only valid if canProvideRGBComponents is YES
-(CGFloat) white;  // Only valid if colorSpaceModel == kCGColorSpaceModelMonochrome
-(CGFloat) alpha;
-(BOOL) red:(CGFloat*)red green:(CGFloat*)green blue:(CGFloat*)blue alpha:(CGFloat*)alpha;
-(BOOL) hue:(CGFloat*)hue saturation:(CGFloat*)saturation brightness:(CGFloat*)brightness alpha:(CGFloat*)alpha;
-(BOOL) hue:(CGFloat*)hue saturation:(CGFloat*)saturation lightness:(CGFloat*)lightness alpha:(CGFloat*)alpha;

/**
 Creating colors from hex values.
 */
+(UIColor*) hex:(UInt32)hex;
+(UIColor*) hex:(UInt32)hex alpha:(CGFloat)alpha;
-(UInt32) hex;

/**
 Creating colors from HSL
 */
+(UIColor*) colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;

/**
 Color palette.
 */
+(UIColor*) veryLightGrayColor;
+(UIColor*) veryDarkGrayColor;
+(UIColor*) FacebookBlueColor;
+(UIColor*) TwitterBlueColor;
+(UIColor*) UIKitHighlightBlueTopColor;
+(UIColor*) UIKitHighlightBlueBottomColor;


@end
