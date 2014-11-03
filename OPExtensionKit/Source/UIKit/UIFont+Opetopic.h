//
//  UIFont+Opetopic.h
//  Kickstarter
//
//  Created by Brandon Williams on 8/15/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Opetopic)

+(instancetype) preferredBodyFont;
+(instancetype) preferredHeadlineFont;
+(instancetype) preferredSubheadlineFont;
+(instancetype) preferredFootnoteFont;
+(instancetype) preferredCaption1Font;
+(instancetype) preferredCaption2Font;

+(NSDictionary*) installedFontsByFamily;

+(void) printPreferredFontSizes;

@end
