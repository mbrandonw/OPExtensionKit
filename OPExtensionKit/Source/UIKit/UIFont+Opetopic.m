//
//  UIFont+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 8/15/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "UIFont+Opetopic.h"
#import "OPMacros.h"

@implementation UIFont (Opetopic)

+(instancetype) preferredBodyFont {
  return [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

+(instancetype) preferredHeadlineFont {
  return [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

+(instancetype) preferredSubheadlineFont {
  return [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

+(instancetype) preferredFootnoteFont {
  return [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
}

+(instancetype) preferredCaption1Font {
  return [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
}

+(instancetype) preferredCaption2Font {
  return [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
}

+(NSDictionary*) installedFontsByFamily {
    
    NSMutableDictionary *retVal = [NSMutableDictionary new];
    
    for (NSString *familyName in [UIFont familyNames])
        [retVal setObject:[UIFont fontNamesForFamilyName:familyName] forKey:familyName];
    
    return retVal;
}

+(void) printPreferredFontSizes {
  
  NSArray *styles = @[
                      UIFontTextStyleFootnote,
                      UIFontTextStyleCaption2,
                      UIFontTextStyleCaption1,
                      UIFontTextStyleBody,
                      UIFontTextStyleSubheadline,
                      UIFontTextStyleHeadline,
                      ];
  for (NSString *style in styles) {
    DLog(@"%@: %f", style, [UIFont preferredFontForTextStyle:style].pointSize);
  }
}

@end
