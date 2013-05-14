//
//  GCD+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/27/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Calls the passed block immediately if we are already executing on the main queue, 
 otherwise it dispatches async to the main queue.
 */
void dispatch_asap_main_queue(dispatch_block_t block);

/**
 Calls the passed block immediately if we are already executing on the supplied queue,
 otherwise it dispatches async it to the queue.
 */
void dispatch_asap_queue(dispatch_queue_t queue, dispatch_block_t block);

/**
 Calls the passed block on the next runloop iteration.
 */
void dispatch_next_runloop(dispatch_block_t block);

/**
 Calls the passed block on the current queue after the specified amount of time.
 */
void dispatch_after_delay(double delay, dispatch_block_t block);

void dispatch_serially_after_delay(double delay, dispatch_block_t block);
