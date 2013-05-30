//
//  NSJSONSerialization+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 5/30/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (Opetopic)

+(id) JSONObjectWithString:(NSString*)string;
+(id) mutableJSONObjectWithString:(NSString*)string;
+(id) JSONObjectWithString:(NSString*)string options:(NSJSONReadingOptions)options error:(NSError *__autoreleasing *)error;

+(NSString*) stringWithJSONObject:(id)object;
+(NSString*) stringWithJSONObject:(id)object options:(NSJSONWritingOptions)options error:(NSError *__autoreleasing *)error;

@end
