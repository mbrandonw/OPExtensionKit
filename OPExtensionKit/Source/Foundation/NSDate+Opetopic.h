//
//  NSDate+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 5/29/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

/** NSDate Extensions
 
 Lots of fancy NSDate extensions!
 */

#import <Foundation/Foundation.h>

#define NSDateSecondsInDays(d)  (60.0*60.0*24.0*d)
extern const NSTimeInterval OPFullDateThreshold;

@interface NSDate (Opetopic)

/**
 Number of seconds since epoch
 */
+(NSTimeInterval) timeIntervalSince1970;

/**
 */
+(NSTimeInterval) distanceFutureTimeInterval;

/**
 Pretty string of the date.
 
 @param shortText If YES, times will be abbreviated, i.e. mins instead of minutes, etc...
 @param threshold Dates this far into the past/future will be expanded to full dates.
 @param explain If YES, string with be prepended or appened with "in" or "ago", dependending
 on whether or not the date is in the future or past, i.e. in 1 day, 3 hrs ago
 @param modifier Customize the "in" or "ago" used when explaining.
 @return The formatted string
 */
-(NSString*) relativeDateInWords;
-(NSString*) relativeDateInWords:(BOOL)shortText;
-(NSString*) relativeDateInWords:(BOOL)shortText explain:(BOOL)explain;
-(NSString*) relativeDateInWords:(BOOL)shortText explain:(BOOL)explain threshold:(NSTimeInterval)threshold;

/**
 Pretty string of a date given as seconds since the epoch. Same as -prettyStringWithShortText:explain: 
 except a class method where you pass in the time interval.
 
 @return The formatted string
 */
+(NSString*) relativeDateInWords:(NSTimeInterval)interval;
+(NSString*) relativeDateInWords:(NSTimeInterval)interval shortText:(BOOL)shortText;
+(NSString*) relativeDateInWords:(NSTimeInterval)interval shortText:(BOOL)shortText explain:(BOOL)explain;
+(NSString*) relativeDateInWords:(NSTimeInterval)interval shortText:(BOOL)shortText explain:(BOOL)explain threshold:(NSTimeInterval)threshold;

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

/**
 Date representing the beginning of the date.
 */
-(NSDate*) startOfDay;

/**
 Dates reprensenting the beginning of today, this year, etc...
 */
+(NSDate*) startOfThisYear;
+(NSDate*) startOfToday;

/**
 */
+(NSDate*) today;
+(NSDate*) yesterday;

@end
