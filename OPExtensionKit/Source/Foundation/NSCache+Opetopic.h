//
//  NSCache+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCache (Opetopic)

+(id) sharedCache;
-(id) fetch:(id)key do:(id(^)(void))block;

@end
