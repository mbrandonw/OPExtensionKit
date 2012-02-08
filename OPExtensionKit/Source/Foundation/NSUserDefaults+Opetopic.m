//
//  NSUserDefaults+Opetopic.m
//  Kickstarter
//
//  Created by Brandon Williams on 2/8/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import "NSUserDefaults+Opetopic.h"

@implementation NSUserDefaults (Opetopic)

-(void) removeObjectsForKeysWithPrefix:(NSString*)prefix {
    
    NSDictionary *defaults = [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] copy];
    for (NSString *key in defaults)
    {
        if ([key isKindOfClass:[NSString class]] && [key hasPrefix:prefix])
        {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        }
    }
}

@end
