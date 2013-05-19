//
//  NSRegularExpression+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 7/24/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSRegularExpression+Opetopic.h"
#import "NSString+Opetopic.h"

@implementation NSRegularExpression (Opetopic)

+(instancetype) regularExpressionWithPattern:(NSString*)pattern {
    return [[self class] regularExpressionWithPattern:pattern options:0 error:NULL];
}

+(id) youtubeLinkRegularExpression:(NSError**)error {
    return [NSRegularExpression regularExpressionWithPattern:@"http(?:s?)://(?:www\\.)?youtu(?:be\\.com/watch\?v=|\\.be/)([\\w\\-]+)(&(amp;)?[\\w\?=‌​]*)?"
                                                     options:NSRegularExpressionCaseInsensitive
                                                       error:error];
}

-(NSArray*) matchesInString:(NSString*)string options:(NSMatchingOptions)options {
    return [self matchesInString:string options:options range:[string fullRange]];
}

@end
