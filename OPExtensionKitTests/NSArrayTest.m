//
//  NSArrayTest.m
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 1/3/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "NSArray+Opetopic.h"
#import "NSDictionary+Opetopic.h"
#import "OPMacros.h"

@interface NSArrayTest : GHTestCase
@end

@implementation NSArrayTest

-(void) testAnyObject {
    
    NSArray *nonEmptyArray = $array(@"1",@"2",@"3");
    for (int i = 0; i < 10; i++)
        GHAssertNotNil([nonEmptyArray anyObject], nil);
    
    NSArray *emptyArray = [NSArray array];
    GHAssertNil([emptyArray anyObject], nil);
}

-(void) testAnyObjectExcept {
    
    id except = @"666";
    NSArray *nonEmpty = $array(@"1",@"2",except,@"3",@"4");
    for (int i = 0; i < 10; i++)
    {
        id obj = [nonEmpty anyObjectExcept:except];
        GHAssertNotNil(obj, nil);
        GHAssertNotEqualObjects(obj, except, nil);
    }
    
    NSArray *onlyExcept = $array(except);
    GHAssertNil([onlyExcept anyObjectExcept:except], nil);
    
    onlyExcept = $array(except, except);
    GHAssertNil([onlyExcept anyObjectExcept:except], nil);
}

-(void) testFirstObject {
    
    id first = @"1";
    NSArray *nonEmpty = $array(first, @"2");
    GHAssertEquals(first, [nonEmpty firstObject], nil);
    
    NSArray *empty = [NSArray array];
    GHAssertNil([empty firstObject], nil);
}

-(void) testSecondObject {
    
    id second = @"2";
    NSArray *nonEmpty = $array(@"1", second, @"3");
    GHAssertEquals(second, [nonEmpty secondObject], nil);
    
    NSArray *empty = [NSArray array];
    GHAssertNil([empty secondObject], nil);
    
    NSArray *singleton = $array(@"1");
    GHAssertNil([singleton secondObject], nil);
}

-(void) testArrayByPrependingObject {
    
    NSArray *original = $array(@"2",@"3",@"4");
    id obj = @"1";
    NSArray *result = $array(obj, @"2",@"3",@"4");
    
    GHAssertEqualObjects([original arrayByPrependingObject:obj], result, nil);
    
    NSArray *empty = [NSArray array];
    GHAssertEqualObjects([empty arrayByPrependingObject:obj], $array(obj), nil);
}

-(void) testContainsCaseInsensitiveString {
    
    NSArray *array = $array(@"1", @"asdf", @"Bob", @"MaGiCk");
    GHAssertTrue([array containsCaseInsensitiveString:@"1"], nil);
    GHAssertTrue([array containsCaseInsensitiveString:@"ASDF"], nil);
    GHAssertTrue([array containsCaseInsensitiveString:@"bob"], nil);
    GHAssertTrue([array containsCaseInsensitiveString:@"magick"], nil);
}

-(void) testContainsAnObjectIn {
    
    NSArray *array1 = $array(@"1",@"2",@"3",@"4");
    NSArray *array2 = $array(@"a",@"b",@"c",@"d");
    NSArray *array3 = $array(@"1",@"x",@"y",@"d");
    
    GHAssertFalse([array1 containsAnObjectIn:array2], nil);
    GHAssertTrue([array2 containsAnObjectIn:array3], nil);
    GHAssertTrue([array3 containsAnObjectIn:array1], nil);
}

-(void) testSortedArrayUsingDescriptor {
    
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 10; i++)
        [array addObject:$dict(@"key", NSInt(arc4random()%1000))];
    
    NSArray *sort1 = [array sortedArrayUsingDescriptor:[NSSortDescriptor sortDescriptorWithKey:@"key" ascending:YES]];
    NSArray *sort2 = [array sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"key" ascending:YES]]];
    
    GHAssertEqualObjects(sort1, sort2, nil);
}

-(void) testSynchronizeWith {
    
    NSArray *array1 = $array($dict(@"id",@"3"), 
                             $dict(@"id",@"2"), 
                             $dict(@"id",@"5"));
    
    NSArray *array2 = $array($dict(@"_id",@"2"), 
                             $dict(@"_id",@"1"), 
                             $dict(@"_id",@"6"));
    
    __block NSUInteger updateCount = 0;
    __block NSUInteger insertCount = 0;
    __block NSUInteger deleteCount = 0;
    
    [array1 synchronizeWith:array2 usingKeys:@"id" :@"_id" updateBlock:^(id obj1, id obj2) {
        updateCount++;
    } insertBlock:^(id obj) {
        insertCount++;
    } deleteBlock:^(id obj) {
        deleteCount++;
    }];
    
    GHAssertTrue(updateCount == 1, nil);
    GHAssertTrue(insertCount == 2, nil);
    GHAssertTrue(deleteCount == 2, nil);
}

@end
