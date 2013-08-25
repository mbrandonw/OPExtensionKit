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
#if __IPHONE_7_0
  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleHeadline;
  }
#endif
  return nil;
}

NSString* OPFontTextStyleBody(void) {
#if __IPHONE_7_0
  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleBody;
  }
#endif
  return nil;
}

NSString* OPFontTextStyleSubheadline(void) {
#if __IPHONE_7_0
  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleSubheadline;
  }
#endif
  return nil;
}

NSString* OPFontTextStyleFootnote(void) {
#if __IPHONE_7_0
  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleFootnote;
  }
#endif
  return nil;
}

NSString* OPFontTextStyleCaption1(void) {
#if __IPHONE_7_0
  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleCaption1;
  }
#endif
  return nil;
}

NSString* OPFontTextStyleCaption2(void) {
#if __IPHONE_7_0
  if ([UIDevice isiOS7OrLater]) {
    return UIFontTextStyleCaption2;
  }
#endif
  return nil;
}

CGFloat OPPreferredSizeWithStyle(NSString *style) {
#if __IPHONE_7_0
  if (style && NSClassFromString(@"UIFontDescriptor")) {
    return [[[[UIFontDescriptor preferredFontDescriptorWithTextStyle:style] fontAttributes]
             objectForKey:UIFontDescriptorSizeAttribute] floatValue];
  }
#endif
  return 0.0f;
}
