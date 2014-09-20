//
//  NSDateFormatter+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/22/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "NSDateFormatter+Opetopic.h"
#import "NSCache+Opetopic.h"

@interface NSDateFormatter (Opetopic_Private)
+(NSArray*) _symbolProxy:(SEL)selector;
@end

static NSMutableDictionary *__formatters;

@implementation NSDateFormatter (Opetopic)

+(NSDateFormatter*) formatterWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
  @synchronized(self) {
    __formatters = __formatters ?: [NSMutableDictionary new];
    NSString *key = $strfmt(@"%lu_%lu", (unsigned long)dateStyle, (unsigned long)timeStyle);
    if (! __formatters[key]) {
      __formatters[key] = [NSDateFormatter new];
      [__formatters[key] setDateStyle:dateStyle];
			[__formatters[key] setTimeStyle:timeStyle];
    }
    return __formatters[key];
	}
}

+(NSArray*) monthSymbols {
    return [[self class] _symbolProxy:_cmd];
}

+(NSArray*) shortMonthSymbols {
    return [[self class] _symbolProxy:_cmd];
}

+(NSArray*) weekdaySymbols {
    return [[self class] _symbolProxy:_cmd];
}

+(NSArray*) shortWeekdaySymbols {
    return [[self class] _symbolProxy:_cmd];
}

+(NSArray*) _symbolProxy:(SEL)selector {
    
    NSString *cacheKey = [NSString stringWithFormat:@"NSDateFormatter/Opetopic/%@", NSStringFromSelector(selector)];
    
    NSArray *retVal = [[NSCache sharedCache] objectForKey:cacheKey];
    
    if (! retVal)
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        retVal = [[NSDateFormatter formatterWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterNoStyle] performSelector:selector];
#pragma clang diagnostic pop
        
        if (retVal)
            [[NSCache sharedCache] setObject:retVal forKey:cacheKey];
    }
    
    return retVal;
}

@end
