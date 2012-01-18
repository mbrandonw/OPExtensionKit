//
//  NSNotificationCenterTest.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/17/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSNotificationCenter+Opetopic.h"

@interface NSNotificationCenterTest : GHTestCase
@end

@implementation NSNotificationCenterTest

-(void) testPostNotificationOnMainThread {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(confirmOnMainThread) name:@"post" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationOnMainThreadName:@"post" object:nil];
}

-(void) confirmOnMainThread {
    GHAssertTrue([NSThread isMainThread], @"");
}

@end
