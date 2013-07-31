//
//  NSURL+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/1/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "NSURL+Opetopic.h"
#import "NSString+Opetopic.h"

@implementation NSURL (Opetopic)

-(NSDictionary*) queryParameters {
    return [[self query] queryParameters];
}

-(BOOL) isSecure {
    return [self.absoluteString rangeOfString:@"https://"].location != NSNotFound;
}

-(NSString*) fullpath {
    if ([self query]) {
        return [NSString stringWithFormat:@"%@?%@", [self path], [self query]];
    }
    return [self path];
}

-(NSURL*) URLByAddingQueryValue:(id)value forKey:(NSString*)key {
  return $url([self.absoluteString stringByAppendingQueryValue:value forKey:key]);
}

@end
