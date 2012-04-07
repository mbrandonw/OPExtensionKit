//
//  NSAttributedString+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/6/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Opetopic)

+(id) attributedStringWithData:(NSData*)data;
-(NSData*) convertToData; // stupid method name just so that we don't accidentally conflict with a future `-data` method.

+(void)encodeAttributedStringAttributes:(NSDictionary*)attributes withKeyedArchiver:(NSKeyedArchiver*)archiver;
+(NSDictionary*)decodeAttributedStringAttriubtes:(NSKeyedUnarchiver*)decoder;
+(NSData*)encodeAttributedString:(NSAttributedString*)attributedString;
+(NSAttributedString*)decodeAttributedStringFromData:(NSData*)data;

@end
