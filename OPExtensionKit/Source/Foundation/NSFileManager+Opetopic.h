//
//  NSFileManager+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/6/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Opetopic)

+(NSString*) cachesDirectoryPath;
+(NSString*) libraryDirectoryPath;
+(NSString*) documentsDirectoryPath;
+(NSString*) applicationSupportDirectoryPath;

-(void) touchFileAtPath:(NSString*)path;
-(BOOL) touchFileAtPath:(NSString*)path error:(NSError**)error;

@end
