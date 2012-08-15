//
//  NSBundle+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 8/15/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSBundle+Opetopic.h"

@implementation NSBundle (Opetopic)

+(NSString*) bundleIdentifier {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+(NSString*) bundleShortVersionString {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+(NSString*) bundleVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

@end
