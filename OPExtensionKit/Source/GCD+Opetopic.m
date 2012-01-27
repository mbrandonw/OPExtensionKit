//
//  GCD+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 1/27/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "GCD+Opetopic.h"

void dispatch_asap_main_queue(dispatch_block_t block) {
    dispatch_asap_queue(dispatch_get_main_queue(), block);
}

void dispatch_asap_queue(dispatch_queue_t queue, dispatch_block_t block) {
    if (dispatch_get_current_queue() == queue)
        block();
    else
        dispatch_async(queue, block);
}
