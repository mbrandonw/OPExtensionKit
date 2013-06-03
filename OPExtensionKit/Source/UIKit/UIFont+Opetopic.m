//
//  UIFont+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 8/15/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "UIFont+Opetopic.h"

@implementation UIFont (Opetopic)

+(NSDictionary*) installedFontsByFamily {
    
    NSMutableDictionary *retVal = [NSMutableDictionary new];
    
    for (NSString *familyName in [UIFont familyNames])
        [retVal setObject:[UIFont fontNamesForFamilyName:familyName] forKey:familyName];
    
    return retVal;
}

+(UIFont*) symbolsetFontWithSize:(CGFloat)size {
  return [UIFont fontWithName:@"SS Standard" size:size];
}

@end
