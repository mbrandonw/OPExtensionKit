//
//  GCD+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/27/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Calls the passed block on the next runloop of the main queue.
 */
void dispatch_next_runloop(dispatch_block_t block);

/**
 Calls the passed block on the main queue after the specified amount of time.
 */
void __attribute__((overloadable)) dispatch_after_delay(double delay, dispatch_block_t block);
void __attribute__((overloadable)) dispatch_after_delay(double delay, dispatch_queue_t queue, dispatch_block_t block);

void dispatch_serially_after_delay(double delay, dispatch_block_t block);
