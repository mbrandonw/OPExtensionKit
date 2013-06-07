//
//  NSTimeZone+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 6/7/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "NSTimeZone+Opetopic.h"

@implementation NSTimeZone (Opetopic)

+(instancetype) UTCTimeZone {
  static NSTimeZone *UTCTimeZone = nil;
  if (! UTCTimeZone) {
    @synchronized(self) {
      UTCTimeZone = [[self class] timeZoneWithAbbreviation:@"UTC"];
    }
  }
  return UTCTimeZone;
}

@end
