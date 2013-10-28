//
//  UIWebView+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/9/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIWebView (Opetopic)

-(NSString*) documentTitle;

-(void) clearCookies;
-(void) removeBackgroundGradients;
-(NSString*) rawHTML;

@end
