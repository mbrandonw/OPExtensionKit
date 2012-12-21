//
//  NSBundle+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 8/15/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSBundle+Opetopic.h"

@implementation NSBundle (Opetopic)

-(NSString*) bundleIdentifier {
    return [[self infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

-(NSString*) bundleShortVersionString {
    return [[self infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

-(NSString*) bundleVersion {
    return [[self infoDictionary] objectForKey:@"CFBundleVersion"];
}

@end
