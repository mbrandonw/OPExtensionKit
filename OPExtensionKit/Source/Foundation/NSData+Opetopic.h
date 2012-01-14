//
//  NSData+Opetopic.h
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 12/4/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** NSData Extensions
 
 Lots of fancy NSData extensions!
 */

#import <Foundation/Foundation.h>


@interface NSData (Opetopic)

/**
 The MD5 hash of the string
 */
-(NSString*) md5;

/**
 The NSData object from the base64 encoding of the data.
 */
+(NSData*) dataFromBase64String:(NSString *)aString;

/**
 The base64 encoding of the data.
 */
-(NSString*) base64EncodedString;

@end
