//
//  NSJSONSerialization+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 5/30/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "NSJSONSerialization+Opetopic.h"

@implementation NSJSONSerialization (Opetopic)

+(id) JSONObjectWithString:(NSString*)string {
  return [[self class] JSONObjectWithString:string options:0 error:NULL];
}

+(id) mutableJSONObjectWithString:(NSString*)string {
  return [[self class] JSONObjectWithString:string options:NSJSONReadingMutableContainers error:NULL];
}

+(id) JSONObjectWithString:(NSString*)string options:(NSJSONReadingOptions)options error:(NSError *__autoreleasing *)error {
  return [[self class] JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:options error:error];
}

+(NSString*) stringWithJSONObject:(id)object {
  return [[self class] stringWithJSONObject:object options:0 error:NULL];
}

+(NSString*) stringWithJSONObject:(id)object options:(NSJSONWritingOptions)options error:(NSError *__autoreleasing *)error {
  return [[NSString alloc] initWithData:[[self class] dataWithJSONObject:object options:options error:error]
                               encoding:NSUTF8StringEncoding];
}

@end
