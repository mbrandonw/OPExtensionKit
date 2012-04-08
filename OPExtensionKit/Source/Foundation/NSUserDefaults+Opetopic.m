//
//  NSUserDefaults+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 2/8/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSUserDefaults+Opetopic.h"

@implementation NSUserDefaults (Opetopic)

-(void) removeObjectsForKeysWithPrefix:(NSString*)prefix {
    
    NSDictionary *defaults = [[self dictionaryRepresentation] copy];
    for (NSString *key in defaults)
        if ([key isKindOfClass:[NSString class]] && [key hasPrefix:prefix])
            [self removeObjectForKey:key];
}

-(void) removeAllObjects {
    [self removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
}

@end
