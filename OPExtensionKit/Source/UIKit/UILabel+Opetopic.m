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

+(instancetype) ssStandardLabelWithSymbol:(NSString*)symbol size:(CGFloat)size {
  return [[self class] ssStandardLabelWithSymbol:symbol size:size color:[UIColor blackColor]];
}

+(instancetype) ssStandardLabelWithSymbol:(NSString*)symbol size:(CGFloat)size color:(UIColor*)color {

  UILabel *label = [[self class] new];
  label.text = [UIFont ssStandardSymbolForString:symbol];
  label.font = [UIFont ssStandardFontWithSize:size];
  label.textColor = color;
  [label sizeToFit];
  return label;
}

@end
