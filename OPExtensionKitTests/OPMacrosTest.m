//
//  OPMacrosTest.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/8/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "OPMacros.h"

@interface OPMacrosTest : GHTestCase
@end

@implementation OPMacrosTest

-(void) testSignMacro {
    
    GHAssertTrue(signf(-2.0f) == -1.0f, @"");
    GHAssertTrue(signf(-1.0f) == -1.0f, @"");
    GHAssertTrue(signf(0.0f) == 0.0f, @"");
    GHAssertTrue(signf(1.0f) == 1.0f, @"");
    GHAssertTrue(signf(2.0f) == 1.0f, @"");
}

-(void) testRandomMacros {
    
    for (int i = 0; i < 1000; i++)
    {
        int ri = randi(100, 200);
        GHAssertTrue(ri >= 100 && ri < 200, @"");
        
        float rf = randf(100.0f, 200.0f);
        GHAssertTrue(rf >= 100.0f && rf < 200.0f, @"");
        
        double rd = randd(100.0f, 200.0f);
        GHAssertTrue(rd >= 100.0f && rd < 200.0f, @"");
    }
}

-(void) testCoalesce {
    
    GHAssertEqualObjects(OPCoalesce(nil, @""), @"", @"");
    GHAssertEqualObjects(OPCoalesce(nil, [NSNull null]), [NSNull null], @"");
    GHAssertEqualObjects(OPCoalesce(@"a", @"b"), @"a", @"");
    GHAssertEqualObjects(OPCoalesce(@"a", nil), @"a", @"");
    GHAssertEqualObjects(OPCoalesce([NSNull null], nil), [NSNull null], @"");
    
    GHAssertEqualObjects(OPCoalesce(nil, nil, nil), nil, @"");
    GHAssertEqualObjects(OPCoalesce(nil, nil, nil, @""), @"", @"");
    GHAssertEqualObjects(OPCoalesce(nil, nil, nil, @"a", @"b"), @"a", @"");
}

@end
