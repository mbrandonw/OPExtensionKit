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

+ (id)constraintsWithItems:(NSArray*)items attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant {

  NSMutableArray *retVal = [NSMutableArray new];
  for (id item in items) {
    [retVal addObject:[[self class] constraintWithItem:item attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:constant]];
  }
  return retVal;
}

@end

@implementation UIView (NSLayoutConstraint_Opetopic)

-(NSLayoutConstraint*) constraintWithWidthProportionalToHeight:(CGFloat)factor {

  return [NSLayoutConstraint constraintWithItem:self
                                      attribute:NSLayoutAttributeWidth
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:self
                                      attribute:NSLayoutAttributeHeight
                                     multiplier:factor
                                       constant:0.0f];
}

-(NSArray*) constraintsToCenterWithin:(UIView *)view {
  return @[
           [self constraintToCenterHorizontallyWithin:view],
           [self constraintToCenterVerticallyWithin:view],
           ];
}

-(NSLayoutConstraint*) constraintToCenterHorizontallyWithin:(UIView *)view {
  return [NSLayoutConstraint constraintWithItem:self
                                      attribute:NSLayoutAttributeCenterX
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:view
                                      attribute:NSLayoutAttributeCenterX
                                     multiplier:1.0f
                                       constant:0.0f];
}

-(NSLayoutConstraint*) constraintToCenterVerticallyWithin:(UIView *)view {
  return [NSLayoutConstraint constraintWithItem:self
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:view
                                      attribute:NSLayoutAttributeCenterY
                                     multiplier:1.0f
                                       constant:0.0f];
}

@end