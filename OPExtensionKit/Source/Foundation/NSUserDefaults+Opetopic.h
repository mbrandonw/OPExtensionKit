//
//  NSUserDefaults+Opetopic.h
//  Kickstarter
//
//  Created by Brandon Williams on 2/8/12.
//  Copyright (c) 2012 Kickstarter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Opetopic)

-(void) removeObjectsForKeysWithPrefix:(NSString*)prefix;

@end
