//
//  NSLayoutConstraint+Opetopic.h
//  Kickstarter
//
//  Created by Brandon Williams on 6/15/13.
//  Copyright (c) 2013 Kickstarter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Opetopic)

+(NSArray*) constraintsWithVisualFormats:(NSArray*)formats bindings:(NSDictionary*)bindings;
+(NSArray*) constraintsWithVisualFormats:(NSArray*)formats options:(NSLayoutFormatOptions)options bindings:(NSDictionary*)bindings;

+ (id)constraintsWithItems:(NSArray*)items attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

@end

@interface UIView (NSLayoutConstraint_Opetopic)

-(NSLayoutConstraint*) constraintWithWidthProportionalToHeight:(CGFloat)factor;
-(NSArray*) constraintsToCenterWithin:(UIView*)view;
-(NSLayoutConstraint*) constraintToCenterHorizontallyWithin:(UIView*)view;
-(NSLayoutConstraint*) constraintToCenterVerticallyWithin:(UIView*)view;

@end