//
//  NSURLRequest+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 1/25/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "NSURLRequest+Opetopic.h"

@implementation NSURLRequest (Opetopic)

+(id) requestWithString:(NSString*)string {
    return [[self class] requestWithURL:[NSURL URLWithString:string]];
}

@end
