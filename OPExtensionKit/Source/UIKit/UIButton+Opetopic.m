//
//  UIButton+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 6/8/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "UIButton+Opetopic.h"
#import "UIView+Opetopic.h"

@implementation UIButton (Opetopic)

-(void) centerTitleAndImageWithSpacing:(CGFloat)spacing {

  if (self.imageView.image) {
    CGSize imageSize = self.imageView.size;
    CGSize titleSize = self.titleLabel.size;

    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(imageSize.height + spacing), 0.0);
    self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
  }
}

@end
