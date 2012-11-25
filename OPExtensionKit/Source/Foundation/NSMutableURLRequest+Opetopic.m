//
//  NSMutableURLRequest+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/7/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSMutableURLRequest+Opetopic.h"
#import "NSString+Opetopic.h"
#import "NSData+Opetopic.h"

@implementation NSMutableURLRequest (Opetopic)

-(void) addBasicHTTPAuthWithUsername:(NSString *)username password:(NSString *)password {
    
    NSString *authString = $strfmt(@"%@:%@", username, password);
    NSData *authData = [authString dataUsingEncoding:NSASCIIStringEncoding];
    NSString *authValue = $strfmt(@"Basic %@", [authData base64EncodedString]);
    [self setValue:authValue forHTTPHeaderField:@"Authorization"];
}

-(void) setHTTPBodyAsString:(NSString*)body {
    [self setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
