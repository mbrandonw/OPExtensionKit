//
//  NSString+Opetopic.h
//  //  OPExtensionKit
//
//  Created by Brandon Williams on 12/4/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** NSString Extensions
 
 Lots of fancy NSString extensions!
 */

#import <UIKit/UIKit.h>

#define STRINGFMT(...)   [NSString stringWithFormat:__VA_ARGS__]
#define MSTRINGFMT(...)  [NSMutableString stringWithFormat:__VA_ARGS__]

@interface NSString (Opetopic)

/**
 @return The MD5 hash of the string.
 */
-(NSString*) md5;

/**
 @return Assuming the string presents a phone number, returns a nicely formatted version of the number.
 */
-(NSString*) prettyPhoneNumber;


/**
 Strips all characters from string that are not 0-9.
 */
-(NSString*) stripNonNumericCharacters;

/**
 Strips all characers from string that are not 0-9 or +.
 */
-(NSString*) stripNonTelephonyCharacters;

/** 
 Strips all non-alphanumeric characters.
 */
-(NSString*) stripNonAlphanumericCharacters;

/**
 Removes whitespace from beginning and end of string.
 */
-(NSString*) trim;


/**
 Truncates the string to be at most `length` characters, and appends a '...' if necessary.
 */
-(NSString*) truncateToLength:(NSUInteger)length;

/**
 Truncates the string to be at most `length` characters, and appends the string `continued` if necessary.
 */
-(NSString*) truncateToLength:(NSUInteger)length continued:(NSString*)continued;

/**
 Substitutes keys with values in a string.
 */
-(NSString*) stringBySubstituting:(NSDictionary*)substitutions;

/**
 */
-(NSString*) normalizedString;

/**
 URL encodes the string.
 */
- (NSString *)URLEncodedString;

/**
 URL decodes the string.
 */
- (NSString *)URLDecodedString;

/**
 URL represpentation of string.
 */
-(NSURL*) asURL;

/**
 URL request representation of string.
 */
-(NSURLRequest*) asURLRequest;

/**
 Very basic detection of phone number.
 */
-(BOOL) isPhoneNumber;

/** 
 Very basic detection of email.
 */
-(BOOL) isEmail;

/**
 @return YES if the string has at least one non-whitespace character.
 */
-(BOOL) isPresent;

/**
 @return An NSRange covering the whole string.
 */
-(NSRange) fullRange;


//-(void) drawInRect:(CGRect)rect withFont:(UIFont*)font lineBreakMode:(UILineBreakMode)mode alignment:(UITextAlignment)alignment color:(UIColor*)color shadow:(UIColor*)shadow offset:(CGSize)offset;

/**
 @return The dictionary formed by splitting on `outer` and then splitting the results on `inner`.
 */
-(NSDictionary*) dictionaryBySplitting:(NSString*)outer and:(NSString*)inner;

/**
 Interpreting the string as query parameters (i.e. key1=foo&key2=bar), converts it to a dictionary.
 */
-(NSDictionary*) queryParameters;

@end
