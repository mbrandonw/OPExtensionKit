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

@end
