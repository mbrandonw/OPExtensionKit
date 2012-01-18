//
//  NSObjectTest.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/17/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSObject+Opetopic.h"
#import "NSArray+Opetopic.h"

@interface NSObjectTest : GHTestCase

@end

@implementation NSObjectTest

-(void) testIn {
    
    NSArray *array = $array(@"asdf", @"foo", [NSNull null], [NSObject new]);
    
    GHAssertTrue([[NSNull null] in:array], @"");
    GHAssertFalse([[NSObject new] in:array], @"");
}

@end
