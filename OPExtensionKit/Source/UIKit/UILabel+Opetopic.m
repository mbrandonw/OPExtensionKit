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

//  UILabel *label = [[self class] new];
//  label.text = [UIFont ssStandardSymbolForString:symbol];
//  label.font = [UIFont ssStandardFontWithSize:size];
//  label.textColor = color;
//  [label sizeToFit];
//  return label;
  return nil;
}

-(BOOL) isTruncating {
  CGSize perfectSize = [self.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName: self.font}
                                               context:nil].size;
  if (perfectSize.height > self.bounds.size.height) {
    return YES;
  }
  return NO;
}

-(void) transitionTextColorTo:(UIColor*)color {
  [self transitionTextColorTo:color duration:0.0];
}

-(void) transitionTextColorTo:(UIColor*)color duration:(NSTimeInterval)duration {
  [UIView transitionWithView:self duration:duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
    self.textColor = color;
  } completion:nil];
}

@end
