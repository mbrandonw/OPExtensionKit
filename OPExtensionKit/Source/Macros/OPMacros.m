//
//  OPMacros.m
//  OPKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "OPMacros.h"


void OPProfile(NSString *label, void(^task)(void)) {
    
    NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
    
    if (task)
        task();
    
    DLog(@"============ PROFILING ============");
    DLog(@"%@: %.4f seconds", label, [NSDate timeIntervalSinceReferenceDate] - start);
    DLog(@"=========== /PROFILING ============");
}

id OPCoalesce(NSUInteger count, ...) {
    
    va_list args;
    va_start(args, count);
    
    id obj;
    
    for (int i = 0; i < count; i++)
    {
        obj = va_arg(args, id);
        if (obj)
            return obj;
    }
    
    return nil;
}
