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

id OPCoalescePrivate(int count, id __unsafe_unretained objs[]) {
    
    for (int i = 0; i < count; i++)
        if (objs[i])
            return objs[i];
    return nil;
}
