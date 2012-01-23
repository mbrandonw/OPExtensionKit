//
//  NSObject+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/24/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSObject+Opetopic.h"
#import <objc/runtime.h>

@implementation NSObject (Opetopic)

-(BOOL) in:(NSArray*)array {
    return [array containsObject:self];
}

-(void) performSelector:(SEL)aSelector withEachObjectIn:(id<NSFastEnumeration>)objects {
    
    for (id object in objects)
    {
#pragma clang diagnostic push 
#pragma clang diagnostic ignored "-Warc-performSelector-leaks" 
        [self performSelector:aSelector withObject:object]; 
#pragma clang diagnostic pop 
    }
}

+(void) performBlockNextRunloop:(void(^)(void))block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0), dispatch_get_main_queue(), ^(void){
        if (block)
            block();
    });
}

-(id) tap:(void(^)(id obj))tap {
    tap(self);
    return self;
}

-(NSString*) toString {
    return [NSString stringWithFormat:@"%@", self];
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
