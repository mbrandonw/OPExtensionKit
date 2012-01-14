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

static NSDateFormatter *__formatters[NSDateFormatterFullStyle][NSDateFormatterFullStyle];

@implementation NSDateFormatter (Opetopic)

+(NSDateFormatter*) formatterWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
    @synchronized(self) 
    {
        if (! __formatters[dateStyle][timeStyle]) {
			__formatters[dateStyle][timeStyle] = [[NSDateFormatter alloc] init];
			[__formatters[dateStyle][timeStyle] setDateStyle:dateStyle];
			[__formatters[dateStyle][timeStyle] setTimeStyle:timeStyle];
		}
        return __formatters[dateStyle][timeStyle];
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
