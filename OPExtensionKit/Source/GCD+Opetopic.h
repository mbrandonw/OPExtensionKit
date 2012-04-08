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
 otherwise it dispatches to the main queue.
 */
void dispatch_asap_main_queue(dispatch_block_t block);

/**
 Calls the passed block immediately if we are already executing on the supplied queue,
 otherwise it dispatches it to the queue.
 */
void dispatch_asap_queue(dispatch_queue_t queue, dispatch_block_t block);
