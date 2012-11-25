//
//  NSMutableURLRequest+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/7/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (Opetopic)

-(void) addBasicHTTPAuthWithUsername:(NSString *)username password:(NSString *)password;
-(void) setHTTPBodyAsString:(NSString*)body;

@end
