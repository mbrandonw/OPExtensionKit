//
//  NSURLRequest+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/25/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSURLRequest+Opetopic.h"

@implementation NSURLRequest (Opetopic)

+(id) requestWithString:(NSString*)string {
    return [[self class] requestWithURL:[NSURL URLWithString:string]];
}

-(NSString*) HTTPBodyAsString {
    return [[NSString alloc] initWithData:[self HTTPBody] encoding:NSUTF8StringEncoding]; 
}

@end
