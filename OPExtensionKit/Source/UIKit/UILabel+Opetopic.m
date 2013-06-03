//
//  UILabel+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 6/2/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "UILabel+Opetopic.h"
#import "UIFont+Opetopic.h"

@implementation UILabel (Opetopic)

+(instancetype) symbolsetFontWithSymbol:(NSString*)symbol size:(CGFloat)size {
  return [[self class] symbolsetFontWithSymbol:symbol size:size color:[UIColor blackColor]];
}

+(instancetype) symbolsetFontWithSymbol:(NSString*)symbol size:(CGFloat)size color:(UIColor*)color {

  UILabel *label = [[self class] new];
  label.text = symbol;
  label.font = [UIFont symbolsetFontWithSize:size];
  label.textColor = color;
  return label;
}

@end
