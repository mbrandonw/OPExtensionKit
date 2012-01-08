//
//  NSDateFormatter+Opetopic.h
//  OPKit
//
//  Created by Brandon Williams on 12/22/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

/** NSDateFormatter Extensions
 
 Lots of fancy NSDateFormatter extensions!
 */

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Opetopic)

/** 
 A date formatter with specific styling.
 
 @return A date formatter with the prescribed styling. The formatters are cached, so they should be treated as readonly. 
 Use only for basic date formatting.
 */
+(NSDateFormatter*) formatterWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/**
 */
+(NSArray*) monthSymbols;
+(NSArray*) shortMonthSymbols;
+(NSArray*) weekdaySymbols;
+(NSArray*) shortWeekdaySymbols;

@end
