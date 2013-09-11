//
//  NSObject+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/24/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSObject Extensions
 
 Lots of fancy NSObject extensions!
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#define $m(obj)     [obj mutableCopy]

#define OPAssociatedObject(getterName, setterName, associationPolicy, getterBlock, setterBlock) \
static char __OP_AssociatedObject_##getterName; \
\
-(void) setterName:(id)obj { \
    objc_setAssociatedObject(self, &__OP_AssociatedObject_##getterName, obj, associationPolicy); \
    void(^_setterBlock)(id obj) = setterBlock; \
    if (_setterBlock) { \
        _setterBlock(obj); \
    } \
} \
-(id) getterName { \
    void(^_getterBlock)(id obj) = getterBlock; \
    id obj = objc_getAssociatedObject(self, &__OP_AssociatedObject_##getterName); \
    if (_getterBlock) { \
        _getterBlock(obj); \
    } \
    return obj; \
}

#define OPTypedAs(obj, className)   (className*)[obj typedAs:[className class]]

@interface NSObject (Opetopic)

/**
 Determines if the object is in the array `array`.
 */
-(BOOL) in:(NSArray*)array;

/**
 Performs the selector `aSelector` on the caller and passes each object in `objects`.
 */
-(void) performSelector:(SEL)aSelector withEachObjectIn:(id<NSFastEnumeration>)objects;

/**
 Tappity tap
 */
-(id) tap:(void(^)(id obj))tap;

/**
 Turn any object into a string, lickity-split.
 */
-(NSString*) toString;

/**
 Swizzle selectors.
 */
+(void) op_swizzleSelector:(SEL)oldSel withSelector:(SEL)newSel;

/**
 Array of this class' superclasses, ordered by decreasing specificity, i.e. the first object in 
 the array is the direct parent superclass, and the last object is the root class.
 */
+(NSArray*) superclasses;

/**
 */
-(void) copyValuesForKeys:(NSArray*)keys fromObject:(NSObject*)other;
-(void) copyValuesForKeyPaths:(NSArray*)keyPaths fromObject:(NSObject*)other;

/**
 */
-(id) typedAs:(Class)type;

/**
 */
-(BOOL) isPresent;
-(id) presence;

/**
 */
-(NSString*) JSONString;

/**
 */
-(BOOL) isAfter:(NSObject*)obj;
-(BOOL) isBefore:(NSObject*)obj;

/**
 Check if we directly implement a selector, and not just the superclass' implementation.
 */
-(BOOL) implementsSelector:(SEL)selector;
+(BOOL) implementsSelector:(SEL)selector;
+(BOOL) instancesImplementSelector:(SEL)selector;

/**
 Performs selector if object responds to it.
 */
-(id) try:(SEL)selector;

@end
