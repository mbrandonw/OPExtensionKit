//
//  NSPredicate+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/22/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSPredicate Extensions
 
 Lots of fancy NSPredicate extensions!
 */

#import <Foundation/Foundation.h>

@interface NSPredicate (Opetopic)

/**
 Compiles a nice search predicate on a bunch of fields.
 */
+(NSPredicate*) predicateForSearching:(NSString*)text fields:(NSArray*)fields;

/**
 Compounds an `and` predicate.
 */
-(NSPredicate*) and:(NSPredicate*)predicate;

/**
 Compounds an `or` predicate.
 */
-(NSPredicate*) or:(NSPredicate*)predicate;

@end
