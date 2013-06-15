//
//  NSLayoutConstraint+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 6/15/13.
//  Copyright (c) 2013 Kickstarter. All rights reserved.
//

#import "NSLayoutConstraint+Opetopic.h"
#import "NSObject+Opetopic.h"
#import "OPEnumerable.h"

@implementation NSLayoutConstraint (Opetopic)

+(NSArray*) constraintsWithVisualFormats:(NSArray*)formats bindings:(NSDictionary*)bindings {

  return [[NSMutableArray new] tap:^(NSMutableArray *constraints) {

    for (NSString *format in formats) {
      NSDictionary *metrics = [bindings filter:^BOOL(id obj) {
        return [obj isKindOfClass:[NSNumber class]];
      }];
      [constraints addObject:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:metrics views:bindings]];
    }
  }];
}

@end
