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
  return [[self class] constraintsWithVisualFormats:formats options:0 bindings:bindings];
}

+(NSArray*) constraintsWithVisualFormats:(NSArray*)formats options:(NSLayoutFormatOptions)options bindings:(NSDictionary*)bindings {

  return [[NSMutableArray new] tap:^(NSMutableArray *constraints) {

    NSDictionary *metrics = [bindings filter:^BOOL(id key) {
      return [bindings[key] isKindOfClass:[NSNumber class]];
    }];
    NSDictionary *views = [bindings filter:^BOOL(id key) {
      return [bindings[key] isKindOfClass:[UIView class]];
    }];

    for (NSString *format in formats) {
      [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:format options:options metrics:metrics views:views]];
    }
  }];
}

@end
