//
//  UIFontDescriptor+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 8/5/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "UIFontDescriptor+Opetopic.h"
#import "UIDevice+Opetopic.h"

NSString* OPFontTextStyleHeadline(void) {

  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleHeadline;
  }
  return nil;
}

NSString* OPFontTextStyleBody(void) {

  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleBody;
  }
  return nil;
}

NSString* OPFontTextStyleSubheadline(void) {

  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleSubheadline;
  }
  return nil;
}

NSString* OPFontTextStyleFootnote(void) {

  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleFootnote;
  }
  return nil;
}

NSString* OPFontTextStyleCaption1(void) {

  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleCaption1;
  }
  return nil;
}

NSString* OPFontTextStyleCaption2(void) {

  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleCaption2;
  }
  return nil;
}

CGFloat OPPreferredSizeWithStyle(NSString *style) {

  if (style && NSClassFromString(@"UIFontDescriptor")) {
    return [[[[UIFontDescriptor preferredFontDescriptorWithTextStyle:style] fontAttributes]
             objectForKey:UIFontDescriptorSizeAttribute] floatValue];
  }
  return 0.0f;
}
