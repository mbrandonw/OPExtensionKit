//
//  NSNumber+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/14/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

#define $bool(val)      [NSNumber numberWithBool:(val)]
#define $char(val)      [NSNumber numberWithChar:(val)]
#define $double(val)    [NSNumber numberWithDouble:(val)]
#define $float(val)     [NSNumber numberWithFloat:(val)]
#define $int(val)       [NSNumber numberWithInt:(val)]
#define $integer(val)   [NSNumber numberWithInteger:(val)]
#define $long(val)      [NSNumber numberWithLong:(val)]
#define $longlong(val)  [NSNumber numberWithLongLong:(val)]
#define $short(val)     [NSNumber numberWithShort:(val)]
#define $uchar(val)     [NSNumber numberWithUnsignedChar:(val)]
#define $uint(val)      [NSNumber numberWithUnsignedInt:(val)]
#define $uinteger(val)  [NSNumber numberWithUnsignedInteger:(val)]
#define $ulong(val)     [NSNumber numberWithUnsignedLong:(val)]
#define $ulonglong(val) [NSNumber numberWithUnsignedLongLong:(val)]
#define $ushort(val)    [NSNumber numberWithUnsignedShort:(val)]

@interface NSNumber (Opetopic)

@end
