//
//  NSUserDefaults+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 2/8/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Opetopic)

-(void) removeObjectsForKeysWithPrefix:(NSString*)prefix;
-(void) removeAllObjects;

@end
