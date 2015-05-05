//
//  NSLocale+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 10/31/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "NSLocale+Opetopic.h"
#import "NSString+Opetopic.h"
#import "NSCache+Opetopic.h"

@implementation NSLocale (Opetopic)

+(NSArray*) countryList {
    static NSString *CacheKey = @"NSLocale/Opetopic/countryList";
    
    NSMutableArray *retVal = [[NSCache sharedCache] objectForKey:CacheKey];
    
    if (! retVal)
    {
        NSArray *codes = [NSLocale ISOCountryCodes];
        retVal = [NSMutableArray arrayWithCapacity:[codes count]];
        for (id code in codes)
            [retVal addObject:[[NSLocale currentLocale] displayNameForKey:NSLocaleCountryCode value:code]];
        
        [[NSCache sharedCache] setObject:retVal forKey:CacheKey];
    }
    
    return retVal;
}

+(NSArray*) countryListSortedByName {
    static NSString *CacheKey = @"NSLocale/Opetopic/countryListSortedByName";
    
    NSArray *retVal = [[NSCache sharedCache] objectForKey:CacheKey];
    
    if (! retVal)
    {
        retVal = [[self countryList] sortedArrayUsingSelector:@selector(compare:)];
        if (retVal)
            [[NSCache sharedCache] setObject:retVal forKey:CacheKey];
    }
    
    return retVal;
}

+(NSArray*) countryListGroupedByLetter {
    static NSString *CacheKey = @"NSLocale/Opetopic/countryListGroupedByLetter";
    
    NSMutableArray *retVal = [[NSCache sharedCache] objectForKey:CacheKey];
    
    if (! retVal)
    {
        retVal = [NSMutableArray arrayWithCapacity:26];
        __block NSString *previousFirstLetter = nil;
        
        [[self countryListSortedByName] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            NSString *firstLetter = [[[obj substringToIndex:1] normalizedString] uppercaseString];
            
            if (! [firstLetter isEqualToString:previousFirstLetter])
                [retVal addObject:[NSMutableArray array]];
            
            [[retVal lastObject] addObject:obj];
            
            previousFirstLetter = firstLetter;
        }];
        
        [[NSCache sharedCache] setObject:retVal forKey:CacheKey];
    }
    
    return retVal;
}

-(NSString*) languageCode {
  return [self objectForKey:NSLocaleLanguageCode];
}

@end
