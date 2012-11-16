//
//  NSDate+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 5/29/11.
//  Copyright 2011 Opetopic. All rights reserved.
//

#import "NSDate+Opetopic.h"
#import "NSDateFormatter+Opetopic.h"

const CGFloat OPFullDateThreshold = 60.0f * 60.0f * 24.0f * 30.0f;

@implementation NSDate (Opetopic)

+(NSTimeInterval) timeIntervalSince1970 {
	return [[NSDate date] timeIntervalSince1970];
}

-(NSString*) prettyStringWithShortText:(BOOL)shortText explain:(BOOL)explain {
	
    NSTimeInterval secondsDiff = [NSDate timeIntervalSince1970] - [self timeIntervalSince1970];
	NSTimeInterval daysDiff = floor(secondsDiff / 86400);
    
    NSString *agoString = @"";
    NSString *inString = @"";
	if (secondsDiff < 0 && explain)
        inString = @"in ";
    if (secondsDiff > 0 && explain)
        agoString = @" ago";
    
    if (secondsDiff < 0)
        secondsDiff *= -1.0f, daysDiff *= -1.0f;
	
    if (secondsDiff < 60) 
	{
        return @"just now";
    }
	else if (secondsDiff < 3600)
	{
		NSTimeInterval minutesDiff = floor(secondsDiff / 60);
		if (minutesDiff == 1)
		{
			if (shortText)	return [NSString stringWithFormat:@"%@1 min%@", inString, agoString];
			else			return [NSString stringWithFormat:@"%@1 minute%@", inString, agoString];
		}
		else
		{
			if (shortText)	return [NSString stringWithFormat:@"%@%.0f mins%@", inString, minutesDiff, agoString];
			else			return [NSString stringWithFormat:@"%@%.0f minutes%@", inString, minutesDiff, agoString];
		}
	}
	else if (secondsDiff < 86400)
	{
		NSTimeInterval hoursDiff = floor(secondsDiff / 60 / 60);
		if (hoursDiff == 1)
		{
			if (shortText)	return [NSString stringWithFormat:@"%@1 hr%@", inString, agoString];
			else			return [NSString stringWithFormat:@"%@1 hour%@", inString, agoString];
		}
		else
		{
			if (shortText)	return [NSString stringWithFormat:@"%@%.0f hrs%@", inString, hoursDiff, agoString];
			else			return [NSString stringWithFormat:@"%@%.0f hours%@", inString, hoursDiff, agoString];
		}
	}
	else if (daysDiff == 1)
	{
		return @"yesterday";
	}
	else if (secondsDiff < OPFullDateThreshold)
	{
		if (shortText)	return [NSString stringWithFormat:@"%@%.0f days%@", inString, daysDiff, agoString];
		else			return [NSString stringWithFormat:@"%@%.0f days%@", inString, daysDiff, agoString];
    }
	else
	{
		return [self formattedStringWithStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    }
	
	return @"";
}

+(NSString*) prettyString:(NSTimeInterval)timeInterval shortText:(BOOL)shortText explain:(BOOL)explain {
	
	return [[NSDate dateWithTimeIntervalSince1970:timeInterval] prettyStringWithShortText:shortText explain:explain];
}

-(NSString*) formattedStringWithStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
	
	return [[NSDateFormatter formatterWithDateStyle:dateStyle timeStyle:timeStyle] stringFromDate:self];
}

+(NSDate*) dateFromTwitterDateString:(NSString*)string {
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    return [formatter dateFromString:string];
}

+(NSDate*) dateWithDaysFromNow:(CGFloat)days {
    return [NSDate dateWithTimeIntervalSinceNow:60.0f*60.0f*24.0f*days];
}

+(NSDate*) dateWithWeeksFromNow:(CGFloat)weeks {
    return [NSDate dateWithTimeIntervalSinceNow:60.0f*60.0f*24.0f*7.0f*weeks];
}

+(NSDate*) dateWithYearsFromNow:(CGFloat)years {
    return [NSDate dateWithTimeIntervalSinceNow:60.0f*60.0f*24.0f*7.0f*365.0f*years];
}

-(NSDate*) startOfDay {
    return [NSDate dateWithTimeIntervalSince1970:floor([self timeIntervalSince1970]/NSDateSecondsInDays(1))*NSDateSecondsInDays(1)];
}

+(NSDate*) startOfThisYear {
    return [NSDate dateWithTimeIntervalSince1970:floor([[self class] timeIntervalSince1970]/NSDateSecondsInDays(365.25))*NSDateSecondsInDays(365.25)];
}

+(NSDate*) startOfToday {
    return [NSDate dateWithTimeIntervalSince1970:floor([[self class] timeIntervalSince1970]/NSDateSecondsInDays(1.0))*NSDateSecondsInDays(1.0)];
}

+(NSDate*) today {
    return [[NSDate date] startOfDay];
}

@end
