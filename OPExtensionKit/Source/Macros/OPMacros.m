//
//  OPMacros.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "OPMacros.h"
#import "NSString+Opetopic.h"
#import <mach/mach_time.h>

static NSMutableDictionary *averagesByLabel;
static NSMutableDictionary *countsByLabel;

void OPProfile(NSString *label, void(^task)(void)) {
#if defined(DEBUG)
    if (!averagesByLabel && !countsByLabel) {
        averagesByLabel = [NSMutableDictionary new];
        countsByLabel = [NSMutableDictionary new];
    }
    
    CGFloat average = [[averagesByLabel objectForKey:label] floatValue];
    NSUInteger count = [[countsByLabel objectForKey:label] unsignedIntValue];
    
    mach_timebase_info_data_t info;
    mach_timebase_info(&info);
    uint64_t start = mach_absolute_time();
    task();
    CGFloat elapsed = ((CGFloat)((mach_absolute_time() - start) * info.numer / info.denom)) / NSEC_PER_SEC;
    
    average = (average*count+elapsed)/(count+1.0f);
    [averagesByLabel setObject:[NSNumber numberWithFloat:average] forKey:label];
    [countsByLabel setObject:[NSNumber numberWithUnsignedInt:count+1] forKey:label];
    
    DLogMessage(nil, DLogLevelProfiling, @"PROFILING: %@\nRun time: %.6f seconds\nAvg time: %.6f seconds%@", 
                label, elapsed, average, [NSThread isMainThread] && elapsed >= 1/30.0f ? @"\n******* Dropped a frame! *******" : @"");
#else
    task();
#endif
}

void DLogSimple(NSString *fmt, ...) {
    va_list argList;
    va_start (argList, fmt);
    
    NSString *message = [[NSString alloc] initWithFormat:fmt arguments:argList];
    va_end (argList);
    
    fprintf (stderr, "%s\n", [message UTF8String]);
}
