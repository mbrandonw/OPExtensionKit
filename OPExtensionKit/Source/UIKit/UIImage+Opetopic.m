//
//  UIImage+Opetopic.m
//  OPKit
//
//  Created by Brandon Williams on 7/3/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "UIImage+Opetopic.h"

@implementation UIImage (Opetopic)

-(NSInteger) rightCapWidth {
	return (NSInteger)self.size.width - self.leftCapWidth - 1;
}

-(NSInteger) bottomCapHeight {
	return (NSInteger)self.size.height - self.topCapHeight - 1;
}

@end
