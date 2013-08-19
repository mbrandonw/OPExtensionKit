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

@end

@interface UIView (NSLayoutConstraint_Opetopic)

-(NSLayoutConstraint*) constraintWithWidthToProportionalToHeight:(CGFloat)factor;
-(NSLayoutConstraint*) constraintToCenterHorizontallyInSuperview;
-(NSLayoutConstraint*) constraintToCenterVerticallyInSuperview;

@end