//
//  NSRegularExpression+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 7/24/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSRegularExpression (Opetopic)

+(id) youtubeLinkRegularExpression:(NSError**)error;
-(NSArray*) matchesInString:(NSString*)string options:(NSMatchingOptions)options;

@end
