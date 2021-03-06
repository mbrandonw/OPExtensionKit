//
//  NSDateFormatterTest.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/8/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "NSDateFormatter+Opetopic.h"
#import "NSArray+Opetopic.h"

@interface NSDateFormatterTest : GHTestCase

@end

@implementation NSDateFormatterTest

-(void) testMonthAndWeekdayMethods {
    
    GHAssertEqualObjects([NSDateFormatter monthSymbols], $array(@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"), @"");
    GHAssertEqualObjects([NSDateFormatter shortMonthSymbols], $array(@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"), @"");
    
    GHAssertEqualObjects([NSDateFormatter weekdaySymbols], $array(@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday"), @"");
    GHAssertEqualObjects([NSDateFormatter shortWeekdaySymbols], $array(@"Sun",@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat"), @"");
}

@end
