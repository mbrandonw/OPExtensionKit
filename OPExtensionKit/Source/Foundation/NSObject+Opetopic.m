//
//  NSObject+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/24/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSObject+Opetopic.h"
#import "NSString+Opetopic.h"
#import "NSJSONSerialization+Opetopic.h"
#import <objc/runtime.h>

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

-(void) copyValuesForKeys:(NSArray*)keys fromObject:(NSObject*)other {
    for (id key in keys) {
        if ([self conformsToProtocol:@protocol(NSFastEnumeration)]) {
            for (id obj in (id<NSFastEnumeration>)self) {
              [obj setValue:[other valueForKey:key] forKey:key];
            }
        } else {
            [self setValue:[other valueForKey:key] forKey:key];
        }
    }
}

-(void) copyValuesForKeyPaths:(NSArray*)keyPaths fromObject:(NSObject*)other {
  for (id keyPath in keyPaths) {
      if ([self conformsToProtocol:@protocol(NSFastEnumeration)]) {
          for (id obj in (id<NSFastEnumeration>)self) {
              [obj setValue:[other valueForKeyPath:keyPath] forKeyPath:keyPath];
          }
      } else {
          [self setValue:[other valueForKeyPath:keyPath] forKeyPath:keyPath];
      }
  }
}

-(id) typedAs:(Class)type {
    return [self isKindOfClass:type] ? self : nil;
}

-(BOOL) isPresent {
    if (self == [NSNull null]) {
        return NO;
    }
    if ([self isKindOfClass:[NSString class]]) {
        return [[(NSString*)self trim] length] > 0;
    }
    if ([self isKindOfClass:[NSData class]]) {
        return [(NSData*)self length] > 0;
    }
    if ([self respondsToSelector:@selector(count)]) {
        return [self performSelector:@selector(count)] > 0;
    }
    return YES;
}

-(id) presence {
    return [self isPresent] ? self : nil;
}

-(NSString*) JSONString {
  return [NSJSONSerialization stringWithJSONObject:self];
}

-(BOOL) isAfter:(NSObject*)obj {
  if ([self respondsToSelector:@selector(compare:)] && [obj respondsToSelector:@selector(compare:)]) {
    return (NSInteger)[self performSelector:@selector(compare:) withObject:obj] == NSOrderedDescending;
  }
  return NO;
}

-(BOOL) isBefore:(NSObject*)obj {
  if ([self respondsToSelector:@selector(compare:)] && [obj respondsToSelector:@selector(compare:)]) {
    return (NSInteger)[self performSelector:@selector(compare:) withObject:obj] == NSOrderedAscending;
  }
  return NO;
}

-(BOOL) implementsSelector:(SEL)selector {
  return [self methodForSelector:selector] != [[self superclass] instanceMethodForSelector:selector];
}

+(BOOL) implementsSelector:(SEL)selector {
  return [[self class] methodForSelector:selector] != [[[self class] superclass] methodForSelector:selector];
}

+(BOOL) instancesImplementSelector:(SEL)selector {
  return [[self class] instanceMethodForSelector:selector] != [[[self class] superclass] instanceMethodForSelector:selector];
}

-(id) try:(SEL)selector {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  return [self respondsToSelector:selector] ? [self performSelector:selector] : nil;
#pragma clang diagnostic pop
}

-(void) performSelector:(SEL)selector multiplicity:(NSUInteger)count {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  for (NSUInteger index = 0; index < count; index++) {
    [self performSelector:selector];
  }
#pragma clang diagnostic pop
}

-(void) performSelector:(SEL)selector withObject:(id)object multiplicity:(NSUInteger)count {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
  for (NSUInteger index = 0; index < count; index++) {
    [self performSelector:selector withObject:object];
  }
#pragma clang diagnostic pop
}

-(void) :(NSUInteger)times timesDo:(void(^)(void))block {
  for (NSUInteger index = 0; index < times; index++) {
    block();
  }
}

-(NSString*) asString {
  return [self typedAs:NSString.class];
}

-(NSArray*) asArray {
  return [self typedAs:NSArray.class];
}

-(NSMutableArray*) asMutableArray {
  return [self typedAs:NSMutableArray.class];
}

-(NSDictionary*) asDictionary {
  return [self typedAs:NSDictionary.class];
}

-(NSMutableDictionary*) asMutableDictionary {
  return [self typedAs:NSMutableDictionary.class];
}

@end
