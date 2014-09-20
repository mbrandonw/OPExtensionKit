//
//  NSString+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/4/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** NSString Extensions
 
 Lots of fancy NSString extensions!
 */

#import <UIKit/UIKit.h>
#import "NSArray+Opetopic.h"

#define $strfmt(...)    [NSString stringWithFormat:__VA_ARGS__]
#define $mstrfmt(...)   [NSMutableString stringWithFormat:__VA_ARGS__]
#define $keypath(...)   [$array(__VA_ARGS__) componentsJoinedByString:@"."]

#define $countstr(count,str) [NSString stringWithFormat:@"%i %@%@", count, str, count==1?@"":@"s"]

#define kNBSP @"\u00a0"

@interface NSString (Opetopic)

-(NSString*) asPlainText;

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
 Appends a query parameter to the string.
 */
-(NSString*) stringByAppendingQueryValue:(id)value forKey:(NSString*)key;
-(NSString*) stringByAppendingQueryKeyValues:(NSDictionary*)keyValues;

/**
 */
-(NSString*) normalizedString;

/**
 Returns the string reversed.
 */
-(NSString*) reversedString;

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
 @return An NSRange covering the whole string.
 */
-(NSRange) fullRange;


-(void) drawInRect:(CGRect)rect
          withFont:(UIFont*)font 
     lineBreakMode:(NSLineBreakMode)mode
         alignment:(NSTextAlignment)alignment
             color:(UIColor*)color
            shadow:(UIColor*)shadow
            offset:(CGSize)offset;

/**
 @return The dictionary formed by splitting on `outer` and then splitting the results on `inner`.
 */
-(NSDictionary*) dictionaryBySplitting:(NSString*)outer and:(NSString*)inner;

/**
 Interpreting the string as query parameters (i.e. key1=foo&key2=bar), converts it to a dictionary.
 */
-(NSDictionary*) queryParameters;

/**
 Returns a string with consecutive whitespaces replaced with a single space.
 */
-(NSString*) stringByNormalizingConsecutiveWhitespace;

/**
 Returns a string with all newlines removed, and any consecutive newlines bordered by non-white space are replaced with a space.
 */
-(NSString*) stringByNormalizingNewlines;

/**
 Get substring between two indices.
 */
-(NSString*) substringFromIndex:(NSUInteger)from to:(NSUInteger)to;

/**
 The indefinite article (a/an) for the word.
 */
-(NSString*) indefiniteArticle;

/**
 Turns html into plain text.
 */
-(NSString*) htmlToPlainText;

/**
 Adds the indefinite article to the string.
 */
-(NSString*) articlize;

/**
 */
-(NSString*) stringByRemovingPrefix:(NSString*)prefix;
-(NSString*) stringByRemovingSuffix:(NSString*)suffix;

/**
 */
-(NSString*) toCamelCase;
-(NSString*) toSnakeCase;

/**
 */
-(BOOL) matches:(NSRegularExpression*)regex;

/**
 */
-(id) JSONObject;
-(id) mutableJSONObject;

/**
 */
-(NSAttributedString*) attributedString;
-(NSMutableAttributedString*) mutableAttributedString;

/**
 Our own implementation of iOS deprecated methods.
 */
-(void) op_drawInRect:(CGRect)rect color:(UIColor*)color withFont:(UIFont*)font;
-(void) op_drawInRect:(CGRect)rect color:(UIColor*)color withFont:(UIFont*)font lineBreakMode:(NSLineBreakMode)lineBreakMode;
-(void) op_drawInRect:(CGRect)rect color:(UIColor*)color withFont:(UIFont*)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment;

-(CGSize) op_sizeWithFont:(UIFont*)font;
-(CGSize) op_sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size;
-(CGSize) op_sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
