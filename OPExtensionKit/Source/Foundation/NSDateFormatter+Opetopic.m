//
//  NSDateFormatter+Opetopic.m
//  OPKit
//
//  Created by Brandon Williams on 12/22/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "NSDateFormatter+Opetopic.h"

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

@end
