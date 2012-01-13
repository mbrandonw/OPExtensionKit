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
    
    NSArray *array = $array(
                            $dict(@"field1", @"here's some foo",
                                  @"field2", @"but nothing else"),
                            $dict(@"field1", @"nothing here",
                                  @"field2", @"but some bar here"),
                            $dict(@"field1", @"here's some foo",
                                  @"field2", @"and some bar"),
                            $dict(@"field1", @"nothin here",
                                  @"field2", @"or here"));
    
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo" fields:$array(@"field1")]] count] == 2, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"bar" fields:$array(@"field1")]] count] == 0, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo" fields:$array(@"field2")]] count] == 0, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"bar" fields:$array(@"field2")]] count] == 2, @"");
    
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo" fields:$array(@"field1",@"field2")]] count] == 2, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"bar" fields:$array(@"field1",@"field2")]] count] == 2, @"");
    
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo bar" fields:$array(@"field1")]] count] == 0, @"");
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo bar" fields:$array(@"field2")]] count] == 0, @"");
    
    GHAssertTrue([[array filteredArrayUsingPredicate:[NSPredicate predicateForSearching:@"foo bar" fields:$array(@"field1",@"field2")]] count] == 1, @"");
}

@end
