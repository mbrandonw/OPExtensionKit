//
//  NSCache+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/2/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OPMacros.h"

@interface NSCache (Opetopic)

OP_SINGLETON_HEADER_FOR(NSCache, sharedCache);

-(id) fetch:(id)key do:(id(^)(void))block;

@end
