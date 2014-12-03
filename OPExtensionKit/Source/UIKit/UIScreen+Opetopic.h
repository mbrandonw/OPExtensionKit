//
//  UIScreen+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/13/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Opetopic)

+(BOOL) isTall;

+(BOOL) isCompact;
+(BOOL) isVerticallyCompact;
+(BOOL) isHorizontallyCompact;
+(BOOL) isCompactPhone;

-(CGRect) normalizedBounds;

-(BOOL) isHighResolution;
-(CGFloat) aspectRatio;

@end
