//
//  GCD+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/27/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "GCD+Opetopic.h"

void dispatch_next_runloop(dispatch_block_t block) {
  dispatch_async(dispatch_get_main_queue(), block);
}

void dispatch_sync_or_immediately_main_queue(dispatch_block_t block) {
  if ([NSThread isMainThread]) {
    block();
  } else {
    dispatch_sync(dispatch_get_main_queue(), block);
  }
}

void __attribute__((overloadable)) dispatch_after_delay(double delay, dispatch_block_t block) {
  dispatch_after_delay(delay, dispatch_get_main_queue(), block);
}

void __attribute__((overloadable)) dispatch_after_delay(double delay, dispatch_queue_t queue, dispatch_block_t block) {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), queue, block);
}

void dispatch_serially_after_delay(double delay, dispatch_block_t block) {
  static double lastTime = 0.0;
  if (lastTime == 0.0) {
    lastTime = [NSDate timeIntervalSinceReferenceDate];
  }

  double nextTime = MAX(lastTime + delay, [NSDate timeIntervalSinceReferenceDate]);
  double delta = MAX(0.0, nextTime - [NSDate timeIntervalSinceReferenceDate]);
  dispatch_after_delay(delta, block);
  lastTime = nextTime;
}
