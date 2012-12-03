//
//  NSURLRequest+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/25/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

#define $request(string)    [NSURLRequest requestWithString:string]

@interface NSURLRequest (Opetopic)

+(id) requestWithString:(NSString*)string;
-(NSString*) HTTPBodyAsString;

@end
