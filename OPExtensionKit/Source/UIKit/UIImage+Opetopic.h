//
//  UIImage+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 7/3/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (Opetopic)

-(NSInteger) rightCapWidth;
-(NSInteger) bottomCapHeight;
-(BOOL) isStretchableImage;
+(UIImage*) imageFromColor:(UIColor*)color;
+(UIImage*) imageWithSize:(CGSize)size block:(void(^)(CGContextRef c, CGRect rect))block;
+(UIImage*) imageWithSize:(CGSize)size opaque:(BOOL)opaque scale:(CGFloat)scale block:(void(^)(CGContextRef c, CGRect rect))block;

/**
 Returns a decompressed image.
 */
+(instancetype) decompressedImageWithContentsOfFile:(NSString*)path;

@end
