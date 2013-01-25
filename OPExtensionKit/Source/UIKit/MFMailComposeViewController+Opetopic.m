//
//  MFMailComposeViewController+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/24/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "MFMailComposeViewController+Opetopic.h"
#import "NSURL+Opetopic.h"

@implementation MFMailComposeViewController (Opetopic)

-(id) initWithMailToURL:(NSURL*)url {
    if (! (self = [self init]))
        return nil;
    
    NSDictionary *params = [url queryParameters];
    [self setSubject:params[@"subject"]];
    [self setMessageBody:params[@"body"] isHTML:NO];
    [self setToRecipients:@[ params[@"to"] ?: @"" ]];
    [self setCcRecipients:@[ params[@"cc"] ?: @"" ]];
    [self setBccRecipients:@[ params[@"bcc"] ?: @"" ]];
    
    return self;
}

@end
