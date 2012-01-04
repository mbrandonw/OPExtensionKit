//
//  NSURL+Opetopic.m
//  OPKit
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

@end
