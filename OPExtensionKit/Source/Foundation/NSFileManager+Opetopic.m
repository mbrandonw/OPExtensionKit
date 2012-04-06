//
//  NSFileManager+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/6/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSFileManager+Opetopic.h"

@implementation NSFileManager (Opetopic)

+(NSString*) cachesDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+(NSString*) libraryDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

+(NSString*) documentsDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+(NSString*) applicationSupportDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) lastObject];
}

@end