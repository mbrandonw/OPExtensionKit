//
//  NSPredicateTest.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/8/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "NSPredicate+Opetopic.h"
#import "NSArray+Opetopic.h"
#import "NSDictionary+Opetopic.h"

@interface NSPredicateTest : GHTestCase
@end

@implementation NSPredicateTest

-(void) testSearchingPredicate {
    
    NSArray *array = ARRAY(
                          DICT(@"here's some foo", @"field1",
                                @"but nothing else", @"field2"),
                          DICT(@"nothing here", @"field1",
                                @"but some bar here", @"field2"),
                          DICT(@"here's some foo", @"field1",
                                @"and some bar", @"field2"),
                          DICT(@"nothin here", @"field1",
                                @"or here", @"field2")
                          );
    
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo" fields:ARRAY(@"field1")]] count] == 2, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"bar" fields:ARRAY(@"field1")]] count] == 0, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo" fields:ARRAY(@"field2")]] count] == 0, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"bar" fields:ARRAY(@"field2")]] count] == 2, @"");
    
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo" fields:ARRAY(@"field1",@"field2")]] count] == 2, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"bar" fields:ARRAY(@"field1",@"field2")]] count] == 2, @"");
    
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo bar" fields:ARRAY(@"field1")]] count] == 0, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo bar" fields:ARRAY(@"field2")]] count] == 0, @"");
    
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo bar" fields:ARRAY(@"field1",@"field2")]] count] == 1, @"");
}

@end
