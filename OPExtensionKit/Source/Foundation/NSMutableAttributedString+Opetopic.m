//
//  NSMutableAttributedString+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 6/30/14.
//  Copyright (c) 2014 Opetopic. All rights reserved.
//

#import "NSMutableAttributedString+Opetopic.h"

@implementation NSMutableAttributedString (Opetopic)

-(void) appendString:(NSString*)string attributes:(NSDictionary*)attributes {
  [self appendAttributedString:[[NSAttributedString alloc] initWithString:string attributes:attributes]];
}

@end
