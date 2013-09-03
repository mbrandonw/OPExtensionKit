//
//  NSHTTPCookieStorage+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 9/3/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "NSHTTPCookieStorage+Opetopic.h"

@implementation NSHTTPCookieStorage (Opetopic)

-(void) setCookieWithProperties:(NSDictionary*)properties {
  [self setCookie:[NSHTTPCookie cookieWithProperties:properties]];
}

@end
