//
//  MFMailComposeViewController+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 1/24/13.
//  Copyright (c) 2013 Opetopic. All rights reserved.
//

#import "MFMailComposeViewController+Opetopic.h"
#import "NSString+Opetopic.h"

@implementation MFMailComposeViewController (Opetopic)

-(id) initWithMailToURL:(NSURL*)url {
    if (! (self = [self init]))
        return nil;
    
    NSUInteger queryIndex = MIN([url.absoluteString length], [url.absoluteString rangeOfString:@"?"].location);
    NSString *parameterString = [url.absoluteString substringFromIndex:MIN([url.absoluteString length], queryIndex+1)];
    NSDictionary *params = [parameterString queryParameters];
    NSString *to = [url.absoluteString substringFromIndex:[url.absoluteString rangeOfString:@":"].location+1
                                                       to:queryIndex];
    [self setToRecipients:@[ to ?: @"" ]];
    [self setSubject:params[@"subject"]];
    [self setMessageBody:params[@"body"] isHTML:NO];
    [self setCcRecipients:@[ params[@"cc"] ?: @"" ]];
    [self setBccRecipients:@[ params[@"bcc"] ?: @"" ]];
    
    return self;
}

@end
