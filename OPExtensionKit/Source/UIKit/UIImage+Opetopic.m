//
//  UIImage+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 7/3/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "UIImage+Opetopic.h"
#import "NSCache+Opetopic.h"

@implementation UIImage (Opetopic)

-(CIImage*) op_CIImage {
  return [CIImage imageWithCGImage:self.CGImage];
}

-(NSInteger) rightCapWidth {
	return (NSInteger)self.size.width - self.leftCapWidth - 1;
}

-(NSInteger) bottomCapHeight {
	return (NSInteger)self.size.height - self.topCapHeight - 1;
}

-(BOOL) isStretchableImage {

  if ([self respondsToSelector:@selector(leftCapWidth)] && [self respondsToSelector:@selector(topCapHeight)] &&
      (self.leftCapWidth > 0.0f || self.rightCapWidth > 0.0f))
    return YES;

  if ([self respondsToSelector:@selector(capInsets)] && ! UIEdgeInsetsEqualToEdgeInsets(self.capInsets, UIEdgeInsetsZero))
    return YES;

  return NO;
}

+(UIImage*) imageFromColor:(UIColor *)color {
  return [[NSCache sharedCache] fetch:[color description] do:^id{

    CGRect rect = {0.0f, 0.0f, 1.0f, 1.0f};

    UIImage *retVal = nil;
    UIGraphicsBeginImageContext(rect.size);
    {
      [color setFill];
      CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
      retVal = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return retVal;

  }];
}

+(UIImage*) imageWithSize:(CGSize)size block:(void(^)(CGContextRef c, CGRect rect))block {
  return [[self class] imageWithSize:size opaque:NO scale:[[UIScreen mainScreen] scale] block:block];
}

+(UIImage*) imageWithSize:(CGSize)size opaque:(BOOL)opaque scale:(CGFloat)scale block:(void(^)(CGContextRef c, CGRect rect))block {

  CGRect rect = {0.0f, 0.0f, size};
  UIImage *retVal = nil;
  UIGraphicsBeginImageContextWithOptions(rect.size, opaque, scale);
  block(UIGraphicsGetCurrentContext(), rect);
  retVal = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return retVal;
}

+(instancetype) decompressedImageWithContentsOfFile:(NSString*)path {

  UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
  if (! image) {
    return nil;
  }
  
  CGImageRef imageRef = image.CGImage;
  CGRect rect = CGRectMake(0.f, 0.f, CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
  CGContextRef bitmapContext = CGBitmapContextCreate(NULL,
                                                     rect.size.width,
                                                     rect.size.height,
                                                     CGImageGetBitsPerComponent(imageRef),
                                                     CGImageGetBytesPerRow(imageRef),
                                                     CGImageGetColorSpace(imageRef),
                                                     CGImageGetBitmapInfo(imageRef)
                                                     );
  CGContextDrawImage(bitmapContext, rect, imageRef);
  CGImageRef decompressedImageRef = CGBitmapContextCreateImage(bitmapContext);
  UIImage *decompressedImage = [UIImage imageWithCGImage:decompressedImageRef];
  CGImageRelease(decompressedImageRef);
  CGContextRelease(bitmapContext);

  return decompressedImage;
}

@end
