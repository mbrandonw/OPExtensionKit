//
//  NSObject+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/24/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSObject+Opetopic.h"
#import <objc/runtime.h>

#define OPAssertEnumerable  NSAssert([self conformsToProtocol:@protocol(NSFastEnumeration)], @"Object isn't enumerable.");

@implementation NSObject (Opetopic)

-(BOOL) in:(NSArray*)array {
    return [array containsObject:self];
}

-(void) performSelector:(SEL)aSelector withEachObjectIn:(id<NSFastEnumeration>)objects {
#pragma clang diagnostic push 
#pragma clang diagnostic ignored "-Warc-performSelector-leaks" 
    for (id object in objects)
    {
        [self performSelector:aSelector withObject:object]; 
    }
#pragma clang diagnostic pop 
}

+(void) performBlockNextRunloop:(void(^)(void))block {
    if (block)
        dispatch_async(dispatch_get_current_queue(), block);
}

-(id) tap:(void(^)(id obj))tap {
    tap(self);
    return self;
}

-(NSString*) toString {
    return [NSString stringWithFormat:@"%@", self];
}

-(id) map:(id(^)(id))mapper {
    OPAssertEnumerable
    
    BOOL isDictionary = [[self class] isSubclassOfClass:[NSDictionary class]];
    id retVal = isDictionary ? [NSMutableDictionary new] : [[[self class] new] mutableCopy];
    
    for (id obj in (id<NSFastEnumeration>)self)
    {
        if (isDictionary)
            [retVal setObject:mapper(obj) forKey:obj];
        else
            [retVal addObject:mapper(obj)];
    }
    return retVal;
}

-(id) findAll:(BOOL(^)(id))finder {
    OPAssertEnumerable
    
    BOOL isDictionary = [[self class] isSubclassOfClass:[NSDictionary class]];
    id retVal = isDictionary ? [NSMutableDictionary new] : [[[self class] new] mutableCopy];
    
    for (id obj in (id<NSFastEnumeration>)self)
    {
        if (finder(obj))
        {
            if (isDictionary)
                [retVal setObject:obj forKey:obj];
            else
                [retVal addObject:obj];
        }
    }
    return retVal;
}

-(id) select:(BOOL(^)(id))selector {
    return [self findAll:selector];
}

-(id) find:(BOOL(^)(id))finder {
    OPAssertEnumerable
    
    for (id obj in (id<NSFastEnumeration>)self)
        if (finder(obj))
            return obj;
    
    return nil;
}

-(id) detect:(BOOL (^)(id))detector {
    return [self find:detector];
}

+(void) op_swizzleSelector:(SEL)oldSel withSelector:(SEL)newSel {
    
    Method oldMethod = class_getInstanceMethod(self, oldSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    Class c = [self class];
    
    if(class_addMethod(c, oldSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, newSel, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
    else
        method_exchangeImplementations(oldMethod, newMethod);
}

+(NSArray*) superclasses {
    
    NSMutableArray *retVal = [NSMutableArray new];
    Class class = [self superclass];
    while (class)
    {
        [retVal addObject:class];
        class = [class superclass];
    }
    return retVal;
}

@end
