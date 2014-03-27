//
//  NSString+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/4/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

#import "NSString+Opetopic.h"
#import <CommonCrypto/CommonHMAC.h>
#import "NSDictionary+Opetopic.h"
#import "NSJSONSerialization+Opetopic.h"

@implementation NSString (Opetopic)

-(NSString*) md5 {
    
	const char *cStr = [self UTF8String];
	unsigned char result[16];
	CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
	return  [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			 result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],result[8], 
			 result[9], result[10], result[11],result[12], result[13], result[14], result[15]];
}

-(NSString*) prettyPhoneNumber {
	
    NSString *s = [self stripNonNumericCharacters];
    
	switch ([s length]) {
		case 1:
		case 2:
		case 3:
			return [NSString stringWithFormat:@"(%@", s];
		case 4:
		case 5:
		case 6:
			return [NSString stringWithFormat:@"(%@) %@",
					[s substringToIndex:3], [s substringFromIndex:3]];
		case 7:
		case 8:
		case 9:
		case 10:
			return [NSString stringWithFormat:@"(%@) %@-%@", 
					[s substringToIndex:3], [s substringWithRange:NSMakeRange(3, 3)], [s substringFromIndex:6]];
		case 11:
			return [NSString stringWithFormat:@"%@ (%@) %@-%@", 
					[s substringToIndex:1],
                    [s substringWithRange:NSMakeRange(1, 3)], 
                    [s substringWithRange:NSMakeRange(4, 3)], 
                    [s substringFromIndex:7]];
	}
	
	return self;
}

-(NSString*) stripNonNumericCharacters {
	
	return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet]]
			componentsJoinedByString:@""];
}

-(NSString*) stripNonTelephonyCharacters {
    
	return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"+1234567890"] invertedSet]]
			componentsJoinedByString:@""];
}

-(NSString*) stripNonAlphanumericCharacters {
    
    return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]] 
            componentsJoinedByString:@""];
}

-(NSString*) trim {
	
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

-(NSString*) truncateToLength:(NSUInteger)length {
    
    return [self truncateToLength:length continued:@"..."];
}

-(NSString*) truncateToLength:(NSUInteger)length continued:(NSString*)continued {
    
    if ([self length] <= length)
        return self;
    
    return [NSString stringWithFormat:@"%@%@", [[self substringToIndex:length] trim], continued];
}

-(NSString*) stringBySubstituting:(NSDictionary*)substitutions {
    
    NSString *retVal = self;
    for (NSString *key in substitutions)
        retVal = [retVal stringByReplacingOccurrencesOfString:key withString:[substitutions stringForKey:key]];
    
    return retVal;
}

-(NSString*) stringByAppendingQueryValue:(id)value forKey:(NSString*)key {
    
    return [self stringByAppendingFormat:@"%@%@=%@", [self rangeOfString:@"?"].location == NSNotFound ? @"?" : @"&", key, value];
}

-(NSString*) stringByAppendingQueryKeyValues:(NSDictionary*)keyValues {
    
    NSString *retVal = self;
    for (id key in keyValues) {
        retVal = [retVal stringByAppendingQueryValue:keyValues[key] forKey:key];
    }
    return retVal;
}

-(NSString*) normalizedString {
    
	NSMutableString *result = [NSMutableString stringWithString:self];
	CFStringNormalize((__bridge CFMutableStringRef)result, kCFStringNormalizationFormD);
	CFStringFold((__bridge CFMutableStringRef)result, kCFCompareCaseInsensitive | kCFCompareDiacriticInsensitive | kCFCompareWidthInsensitive, NULL);
	return result;	
}

-(NSString*) reversedString {
    
    char *chars = (char *)[self cStringUsingEncoding:NSUTF8StringEncoding];
    NSUInteger length = [self length] - 1;
    char temp;
    
    for (NSUInteger i = 0; i <= length/2; i++) {
        if (chars[i] != chars[length - i]) {
            temp = chars[i];
            chars[i] = chars[length - i];
            chars[length - i] = temp;
        }
    }
    
    return @((const char *)chars);
}

- (NSString *)URLEncodedString  
{
    NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (__bridge CFStringRef)self,
                                                                           NULL,
																		   CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                           kCFStringEncodingUTF8);
	return result;
}

- (NSString*)URLDecodedString {
	
	NSString *result = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
																						   (__bridge CFStringRef)self,
																						   CFSTR(""),
																						   kCFStringEncodingUTF8);
	return result;	
}

-(NSURL*) asURL {
    return [NSURL URLWithString:self];
}

-(NSURLRequest*) asURLRequest {
    return [NSURLRequest requestWithURL:[self asURL]];
}

-(BOOL) isPhoneNumber {
	
	NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[0-9+ ()\\-+#*]{10,20}"];
	return [regExPredicate evaluateWithObject:self]; 
}

-(BOOL) isEmail {
    
	NSString *emailRegEx =
    @"(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-"
    @"zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
	
	return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx] evaluateWithObject:self];
}

-(NSRange) fullRange {
    return NSMakeRange(0, [self length]);
}

-(void) drawInRect:(CGRect)rect
          withFont:(UIFont*)font
     lineBreakMode:(NSLineBreakMode)mode
         alignment:(NSTextAlignment)alignment
             color:(UIColor*)color
            shadow:(UIColor*)shadow
            offset:(CGSize)offset {
    
    [shadow set];
    CGRect shadowRect = CGRectOffset(rect, offset.width, offset.height);
    [self drawInRect:shadowRect withFont:font lineBreakMode:mode alignment:alignment];
    
    [color set];
    [self drawInRect:rect withFont:font lineBreakMode:mode alignment:alignment];
}

-(NSDictionary*) dictionaryBySplitting:(NSString*)outer and:(NSString*)inner {
    
    NSArray *pieces = [self componentsSeparatedByString:outer];
    NSMutableDictionary *retVal = [NSMutableDictionary dictionaryWithCapacity:[pieces count]];
    
    for (NSString *piece in pieces)
    {
        NSRange equalsRange = [piece rangeOfString:inner];
        if (equalsRange.location != NSNotFound) {
            NSString *key = [piece substringToIndex:equalsRange.location];
            NSString *value = [piece substringFromIndex:equalsRange.location+1];
            retVal[key] = value;
        }
    }
    
    return retVal;
}

-(NSDictionary*) queryParameters {
    
    NSMutableDictionary *retVal = [[self dictionaryBySplitting:@"&" and:@"="] mutableCopy];
    NSArray *keys = [retVal allKeys];
    for (id key in keys) {
        [retVal setObject:[[retVal objectForKey:key] URLDecodedString] forKey:key];
    }
    return retVal;
}

-(NSString*) stringByNormalizingConsecutiveWhitespace {
    
    // we'll construct a C-string with the normalized value
    unichar *retChars = calloc([self length], sizeof(unichar));
    [self getCharacters:retChars range:NSMakeRange(0, [self length])];
    
    NSInteger retLength = 0;
    BOOL previousCharWasWhitespace = NO;
    NSCharacterSet *whitespaceCharacterSet = [NSCharacterSet whitespaceCharacterSet];
    
    // we output to the same buffer as the input was
    for (NSInteger i = 0; i < [self length]; i++)
    {
        unichar aChar = retChars[i];
        if ([whitespaceCharacterSet characterIsMember:aChar])
        {
            // preserve only the first whitespace character in a consecutive sequence
            if (! previousCharWasWhitespace) {
                retChars[retLength] = ' ';
                retLength++;
                previousCharWasWhitespace = YES;
            }
        }
        else
        {
            // all other characters we simply copy
            retChars[retLength] = aChar;
            retLength++;
            previousCharWasWhitespace = NO;
        }
    }
    
    // create NSString from character buffer
    NSString *retString = [NSString stringWithCharacters:retChars length:retLength];
    
    // clean up memory
    free(retChars);
    
    return retString;
}

-(NSString*) stringByNormalizingNewlines {
    
    // we'll construct a C-string with the normalized value
    unichar *retChars = calloc([self length], sizeof(unichar));
    [self getCharacters:retChars range:NSMakeRange(0, [self length])];
    
    NSInteger retLength = 0;
    NSCharacterSet *whitespaceCharacterSet = [NSCharacterSet whitespaceCharacterSet];
    NSCharacterSet *newlineCharacterSet = [NSCharacterSet newlineCharacterSet];
    
    // we output to the same buffer as the input was
    for (NSInteger i = 0; i < [self length]; i++)
    {
        unichar aChar = retChars[i];
        if ([newlineCharacterSet characterIsMember:aChar])
        {
            // remove all newlines
            
            if (i < [self length] - 1 && i > 0 && ![whitespaceCharacterSet characterIsMember:retChars[i+1]] && ![whitespaceCharacterSet characterIsMember:retChars[i-1]])
            {
                retChars[retLength] = ' ';
                retLength++;
            }
        }
        else
        {
            // all other characters we simply copy
            retChars[retLength] = aChar;
            retLength++;
        }
    }
    
    // create NSString from character buffer
    NSString *retString = [NSString stringWithCharacters:retChars length:retLength];
    
    // clean up memory
    free(retChars);
    
    return retString;
}

-(NSString*) substringFromIndex:(NSUInteger)from to:(NSUInteger)to {
    return [self substringWithRange:NSMakeRange(from, to-from)];
}

-(NSString*) indefiniteArticle {
    NSString *lower = [self lowercaseString];
    return [lower hasPrefix:@"a"] || [lower hasPrefix:@"e"] || [lower hasPrefix:@"i"] || [lower hasPrefix:@"o"] || [lower hasPrefix:@"u"] ? @"an" : @"a";
}

-(NSString*) htmlToPlainText {
    
    NSString *retVal = self;
    NSScanner *scanner = [NSScanner scannerWithString:retVal];
    while (! [scanner isAtEnd])
    {
        NSString *text = nil;
        [scanner scanUpToString:@"<" intoString:NULL] ;
        [scanner scanUpToString:@">" intoString:&text] ;
        retVal = [retVal stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@" "];
    }
    retVal = [retVal trim];
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:@"\\s\\s+" options:0 error:NULL];
    retVal = [regexp stringByReplacingMatchesInString:retVal options:0 range:[retVal fullRange] withTemplate:@" "];
    return retVal;
}

-(NSString*) articlize {
    NSString *article = [@[@"a", @"e", @"i", @"o", @"u"] containsObject:[[self substringToIndex:1] lowercaseString]] ? @"an" : @"a";
    return [NSString stringWithFormat:@"%@ %@", article, self];
}

-(NSString*) stringByRemovingPrefix:(NSString*)prefix {
    if ([self hasPrefix:prefix]) {
        return [self substringFromIndex:[prefix length]];
    }
    return self;
}

-(NSString*) stringByRemovingSuffix:(NSString*)suffix {
    if ([self hasSuffix:suffix]) {
        return [self substringToIndex:[self length] - [suffix length]];
    }
    return self;
}

-(NSString*) toCamelCase {
    NSArray *components = [self componentsSeparatedByString:@"_"];
    NSMutableString *output = [NSMutableString string];
    
    for (NSUInteger i = 0; i < components.count; i++) {
        if (i == 0) {
            [output appendString:components[i]];
        } else {
            [output appendString:[components[i] capitalizedString]];
        }
    }
    
    return [NSString stringWithString:output];
}

-(NSString*) toSnakeCase {
    NSScanner *scanner = [[NSScanner alloc] initWithString:self];
    scanner.caseSensitive = YES;
    
    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet *lowercase = [NSCharacterSet lowercaseLetterCharacterSet];
    
    NSString *buffer = nil;
    NSMutableString *output = [NSMutableString new];
    
    while (scanner.isAtEnd == NO) {
        if ([scanner scanCharactersFromSet:uppercase intoString:&buffer]) {
            [output appendString:[buffer lowercaseString]];
        }
        if ([scanner scanCharactersFromSet:lowercase intoString:&buffer]) {
            [output appendString:buffer];
            if (!scanner.isAtEnd) {
                [output appendString:@"_"];
            }
        }
    }
    
    return [NSString stringWithString:output];
}

-(BOOL) matches:(NSRegularExpression*)regex {
    return [[regex matchesInString:self options:0] count] > 0;
}

-(id) JSONObject {
  return [NSJSONSerialization JSONObjectWithString:self];
}

-(id) mutableJSONObject {
  return [NSJSONSerialization mutableJSONObjectWithString:self];
}

-(NSAttributedString*) attributedString {
  return [[NSAttributedString alloc] initWithString:self];
}

-(NSMutableAttributedString*) mutableAttributedString {
  return [[NSMutableAttributedString alloc] initWithString:self];
}

@end
