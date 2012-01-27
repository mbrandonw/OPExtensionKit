//
//  GCD+Opetopic.h
//  Kickstarter
//
//  Created by Brandon Williams on 1/27/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import <Foundation/Foundation.h>

void dispatch_asap_main_queue(dispatch_block_t block);
void dispatch_asap_queue(dispatch_queue_t queue, dispatch_block_t block);
