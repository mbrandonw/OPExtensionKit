//
//  NSLocale+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 10/31/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

/** NSLocale Extensions
 
 Lots of fancy NSLocale extensions!
 */

#import <Foundation/Foundation.h>

@interface NSLocale (Opetopic)

/**
 An array of country names.
 */
+(NSArray*) countryList;

/**
 @return An array of countries sorted by name;
 */
+(NSArray*) countryListSortedByName;

/**
 @return An array of arrays that groups countries by their first letter.
 */
+(NSArray*) countryListGroupedByLetter;

@end
