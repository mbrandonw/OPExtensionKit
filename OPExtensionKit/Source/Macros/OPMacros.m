//
//  OPMacros.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "OPMacros.h"
#import "NSString+Opetopic.h"

static NSMutableDictionary *averagesByLabel;
static NSMutableDictionary *countsByLabel;

void OPProfile(NSString *label, void(^task)(void)) {
#if defined(DEBUG)
    if (!averagesByLabel && !countsByLabel) {
        averagesByLabel = [NSMutableDictionary new];
        countsByLabel = [NSMutableDictionary new];
    }
    
    NSTimeInterval average = [[averagesByLabel objectForKey:label] doubleValue];
    NSUInteger count = [[countsByLabel objectForKey:label] unsignedIntValue];
    
    NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
    task();
    NSTimeInterval elapsed = [NSDate timeIntervalSinceReferenceDate] - start;
    
    average = (average*count+elapsed)/(count+1.0f);
    [averagesByLabel setObject:[NSNumber numberWithDouble:average] forKey:label];
    [countsByLabel setObject:[NSNumber numberWithUnsignedInt:count+1] forKey:label];
    
    DLogMessage(nil, DLogLevelProfiling, @"PROFILING: %@\nRun time: %.4f seconds\nAvg time: %.4f seconds", label, elapsed, average);
#else
    task();
#endif
}
