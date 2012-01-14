//
//  UIApplication+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/1/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import "UIApplication+Opetopic.h"
#import "NSString+Opetopic.h"

@implementation UIApplication (Opetopic)

-(void) performBackgroundTask:(void(^)(void))task completion:(void(^)(void))completion expiration:(void(^)(void))expiration {
    
    if (task)
    {
        UIBackgroundTaskIdentifier identifier = [self beginBackgroundTaskWithExpirationHandler:expiration];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            task();
            if (completion)
                completion();
            [self endBackgroundTask:identifier];
        });
    }
}

-(void) preventDeviceFromIdlingWhile:(void (^)(void))task {
    
    BOOL previousValue = [UIApplication sharedApplication].idleTimerDisabled;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].idleTimerDisabled = YES;
    });
    
    if (task)
        task();
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].idleTimerDisabled = previousValue;
    });
}

+(void) call:(NSString*)number {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", [number stripNonTelephonyCharacters]]]];
}

+(void) facetime:(NSString*)number {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"facetime://%@", [number stripNonTelephonyCharacters]]]];
}

+(void) openMaps:(NSString *)address {
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:
      [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", [address URLEncodedString]]]];
}

+(void) openMapsWithDirectionsTo:(NSString *)address {
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:
      [NSString stringWithFormat:@"http://maps.google.com/maps?daddr=Current%%20Location&saddr=%@", [address URLEncodedString]]]];
}

@end
