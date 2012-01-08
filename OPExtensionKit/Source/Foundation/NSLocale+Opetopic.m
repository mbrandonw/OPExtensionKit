//
//  NSLocale+Opetopic.m
//  OPKit
//
//  Created by Brandon Williams on 10/31/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "NSLocale+Opetopic.h"
#import "BlocksKit.h"
#import "NSString+Opetopic.h"
#import "NSCache+Opetopic.h"

@implementation NSLocale (Opetopic)

+(NSArray*) countryList {
    
    return [[NSCache sharedCache] objectForKey:@"NSLocale/countryList" withGetter:^id(void){
        
        return [[NSLocale ISOCountryCodes] map:^id(id obj) {
            return [[NSLocale currentLocale] displayNameForKey:NSLocaleCountryCode value:obj];
        }];
    }];
}

+(NSArray*) countryListSortedByName {
    
    return [[NSCache sharedCache] objectForKey:@"NSLocale/countryListSortedByLetter" withGetter:^id(void){
        
        return [[self countryList] sortedArrayUsingSelector:@selector(compare:)];
    }];
}

+(NSArray*) countryListGroupedByLetter {
    
    return [[NSCache sharedCache] objectForKey:@"NSLocale/countryListGroupedByLetter" withGetter:^id(void){
        
        NSMutableDictionary *letterGroups = [NSMutableDictionary dictionaryWithCapacity:26];
        [[self countryListSortedByName] each:^(id sender) {
            NSString *key = [[[sender substringToIndex:1] normalizedString] uppercaseString];
            if (! [letterGroups objectForKey:key])
                [letterGroups setObject:[NSMutableArray array] forKey:key];
            [[letterGroups objectForKey:key] addObject:sender];
        }];
        
        return [[[letterGroups allKeys] sortedArrayUsingSelector:@selector(compare:)] map:^id(id obj) {
            return [letterGroups objectForKey:obj];
        }];
    }];
}

@end
