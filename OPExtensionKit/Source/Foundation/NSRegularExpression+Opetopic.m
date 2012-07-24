//
//  NSRegularExpression+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 7/24/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSRegularExpression+Opetopic.h"

@implementation NSRegularExpression (Opetopic)

+(id) youtubeLinkRegularExpression:(NSError**)error {
    
    return [NSRegularExpression regularExpressionWithPattern:@"http(?:s?)://(?:www\\.)?youtu(?:be\\.com/watch\?v=|\\.be/)([\\w\\-]+)(&(amp;)?[\\w\?=‌​]*)?"
                                                     options:NSRegularExpressionCaseInsensitive
                                                       error:error];
}

@end
