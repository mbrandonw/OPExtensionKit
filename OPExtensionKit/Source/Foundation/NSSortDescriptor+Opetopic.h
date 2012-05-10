//
//  NSSortDescriptor+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 5/10/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

#define $sort(key, asc)   [NSSortDescriptor sortDescriptorWithKey:key ascending:asc]

@interface NSSortDescriptor (Opetopic)

@end
