//
//  NSDate+Opetopic.h
//  OPKit
//
//  Created by Brandon Williams on 5/29/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSDate Extensions
 
 Lots of fancy NSDate extensions!
 */

#import <Foundation/Foundation.h>

@interface NSDate (Opetopic)

/**
 Number of seconds since epoch (Jan 1, 1970)
 */
+(NSTimeInterval) timeIntervalSince1970;

/**
 Pretty string of the date.
 
 @param shortText If YES, times will be abbreviated, i.e. mins instead of minutes, etc...
 @param explain If YES, string with be prepended or appened with "in" or "ago", dependending
 on whether or not the date is in the future or past, i.e. in 1 day, 3 hrs ago
 @return The formatted string
 */
-(NSString*) prettyStringWithShortText:(BOOL)shortText explain:(BOOL)explain;

/**
 Pretty string of a date given as seconds since the epoch. Same as -prettyStringWithShortText:explain: 
 except a class method where you pass in the time interval.
 
 @return The formatted string
 */
+(NSString*) prettyString:(NSTimeInterval)timeInterval shortText:(BOOL)shortText explain:(BOOL)explain;


/** 
 */
-(NSString*) formattedStringWithStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/** 
 */
+(NSDate*) dateFromTwitterDateString:(NSString*)string;

/** 
 */
+(NSDate*) dateWithDaysFromNow:(CGFloat)days;

/** 
 */
+(NSDate*) dateWithWeeksFromNow:(CGFloat)weeks;

/** 
 */
+(NSDate*) dateWithYearsFromNow:(CGFloat)years;

@end
