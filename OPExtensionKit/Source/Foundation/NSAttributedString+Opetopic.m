//
//  NSAttributedString+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/6/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSAttributedString+Opetopic.h"
#import "NSDictionary+Opetopic.h"
#import "NSNumber+Opetopic.h"

const struct NSAttributedStringArchiveKeys {
    __unsafe_unretained NSString *rootString;
    __unsafe_unretained NSString *attributes;
    __unsafe_unretained NSString *attributeDictionary;
    __unsafe_unretained NSString *attributeRange;

    struct {
        __unsafe_unretained NSString *alignment;
        __unsafe_unretained NSString *firstLineIndent;
        __unsafe_unretained NSString *headIndent;
        __unsafe_unretained NSString *tailIndent;
        __unsafe_unretained NSString *tabStops;
        __unsafe_unretained NSString *defaultTabInterval;
        __unsafe_unretained NSString *linebreakMode;
        __unsafe_unretained NSString *lineHeightMultiple;
        __unsafe_unretained NSString *maximumLineHeight;
        __unsafe_unretained NSString *minimumLineHeight;
        __unsafe_unretained NSString *lineSpacing;
        __unsafe_unretained NSString *paragraphSpacing;
        __unsafe_unretained NSString *paragraphSpacingBefore;
        __unsafe_unretained NSString *baseWritingDirection;
    } paragraphStyle;
} NSAttributedStringArchiveKeys;

const struct NSAttributedStringArchiveKeys NSAttributedStringArchiveKeys = {
    .rootString = @"rootString",
    .attributes = @"attributes",
    .attributeDictionary = @"attributeDictionary",
    .attributeRange = @"attributeRange",
    .paragraphStyle = {
        .alignment = @"alignment",
        .firstLineIndent = @"firstLineIndent",
        .headIndent = @"headIndent",
        .tailIndent = @"tailIndent",
        .tabStops = @"tabStops",
        .defaultTabInterval = @"defaultTabInterval",
        .linebreakMode = @"linebreakMode",
        .lineHeightMultiple = @"lineHeightMultiple",
        .maximumLineHeight = @"maximumLineHeight",
        .minimumLineHeight = @"minimumLineHeight",
        .lineSpacing = @"lineSpacing",
        .paragraphSpacing = @"paragraphSpacing",
        .paragraphSpacingBefore = @"paragraphSpacingBefore",
        .baseWritingDirection = @"baseWritingDirection",
    },
};

//CFDataRef CreateFlattenedFontData(CTFontRef iFont);
//CTFontRef CreateFontFromFlattenedFontData(CFDataRef iData);

@interface NSAttributedString (Opetopic_Private)
-(NSDictionary*) dictionaryRepresentation;
+(id) attributedStringWithDictionaryRepresentation:(NSDictionary*)dictionary;
+(NSDictionary*) dictionaryRepresentationOfFont:(CTFontRef)fontRef;
+(CTFontRef) fontFromDictionaryRepresentation:(NSDictionary*)dictionary;
@end

@implementation NSAttributedString (Opetopic)

+(id) attributedStringWithData:(NSData*)data {
    return [self attributedStringWithDictionaryRepresentation:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
}

-(NSData*) convertToData {
    return [NSKeyedArchiver archivedDataWithRootObject:[self dictionaryRepresentation]];
}

//+(void)encodeAttributedStringAttributes:(NSDictionary*)attributes withKeyedArchiver:(NSKeyedArchiver*)archiver     {
//    
//    NSString *key = nil;
//    
//    for(key in attributes)
//    {
//        if([key isEqualToString:(NSString*)kCTFontAttributeName]) {
//            CTFontRef font = (CTFontRef)[attributes objectForKey:key];
//            NSData* fontData = (NSData*)CreateFlattenedFontData(font);
//            [archiver encodeObject:fontData forKey:key];
//            [fontData release];
//        }
//        else if([key isEqualToString:(NSString*)kCTForegroundColorFromContextAttributeName]
//                //                    || [key isEqualToString:(NSString*)kCTVerticalFormsAttributeName]     // IPHONE_NA
//                ) {
//            CFBooleanRef boolRef = (CFBooleanRef)[attributes objectForKey:key];
//            [archiver encodeBool:((boolRef == kCFBooleanTrue) ? YES : NO)  forKey:key];
//        }
//        else if([key isEqualToString:(NSString*)kCTKernAttributeName]
//                || [key isEqualToString:(NSString*)kCTStrokeWidthAttributeName]
//                ) {
//            CFNumberRef valueRef = (CFNumberRef)[attributes objectForKey:key];
//            float floatValue;
//            CFNumberGetValue(valueRef, kCFNumberFloatType, &floatValue);
//            [archiver encodeFloat:floatValue forKey:key];
//        }
//        else if([key isEqualToString:(NSString*)kCTLigatureAttributeName]
//                ||[key isEqualToString:(NSString*)kCTSuperscriptAttributeName]
//                ) {
//            CFNumberRef valueRef = (CFNumberRef)[attributes objectForKey:key];
//            int value;
//            CFNumberGetValue(valueRef, kCFNumberIntType, &value);
//            [archiver encodeInteger:value forKey:key];
//        }
//        else if([key isEqualToString:(NSString*)kCTForegroundColorAttributeName]
//                || [key isEqualToString:(NSString*)kCTStrokeColorAttributeName]
//                || [key isEqualToString:(NSString*)kCTUnderlineColorAttributeName]
//                ) {
//            CGColorRef color = (CGColorRef)[attributes objectForKey:key];
//            [archiver encodeObject:[UIColor colorWithCGColor:color]  forKey:key];
//        }
//        else if([key isEqualToString:(NSString*)kCTParagraphStyleAttributeName]) {
//            // CTParagraphStyleRef
//            // TODO: need to encode the paragraph style
//        }
//        else if([key isEqualToString:(NSString*)kCTUnderlineStyleAttributeName]) {
//            // CFNumberRef bytes matter
//            // TODO: need to encode the underline style
//        }
//        else if([key isEqualToString:(NSString*)kCTGlyphInfoAttributeName]) {
//            // CTGlyphInfoRef
//            // TODO: need to encode the Glyph Info
//        }
//        else if([key isEqualToString:(NSString*)kCTCharacterShapeAttributeName]) {
//            // CFNumberRef see kCharacterShapeType selector in <ATS/SFNTLayoutTypes.h>
//            // TODO: look into encoding the character shape attribute
//        }
//        else if([key isEqualToString:(NSString*)kCTRunDelegateAttributeName]) {
//            // CTRunDelegateRef
//            // probably won't encode and decode well
//        }
//    }
//}
//
//
//
//+(NSDictionary*)decodeAttributedStringAttriubtes:(NSKeyedUnarchiver*)decoder {
//    NSMutableDictionary *attributes = [[[NSMutableDictionary alloc] initWithCapacity:1] autorelease];
//    
//    if([decoder containsValueForKey:(NSString *)kCTFontAttributeName]) {
//        NSData *fontData = [decoder decodeObjectForKey:(NSString*)kCTFontAttributeName];
//        if(fontData) {
//            CTFontRef font = CreateFontFromFlattenedFontData((CFDataRef)fontData);
//            [attributes setObject:(id)font forKey:(NSString*)kCTFontAttributeName];
//            CFRelease(font);
//        }
//    }
//    
//    if([decoder containsValueForKey:(NSString *)kCTForegroundColorFromContextAttributeName]) {
//        BOOL boolValue = [decoder decodeBoolForKey:(NSString *)kCTForegroundColorFromContextAttributeName];
//        [attributes setObject:(id)(boolValue == YES ? kCFBooleanTrue : kCFBooleanFalse) forKey:(NSString*)kCTForegroundColorFromContextAttributeName];
//    }
//    
//    //     IPHONE_NA     
//    //     if([decoder containsValueForKey:(NSString *)kCTVerticalFormsAttributeName]) {
//    //          BOOL boolValue = [decoder decodeBoolForKey:(NSString *)kCTVerticalFormsAttributeName];
//    //          [attributes setObject:(id)(boolValue == YES ? kCFBooleanTrue : kCFBooleanFalse) forKey:(NSString*)kCTVerticalFormsAttributeName];
//    //     }
//    
//    if([decoder containsValueForKey:(NSString*)kCTForegroundColorAttributeName]) {
//        [attributes setObject:(id)((UIColor*)[decoder decodeObjectForKey:(NSString *)kCTForegroundColorAttributeName]).CGColor forKey:(NSString*)kCTForegroundColorAttributeName];
//    }
//    
//    if([decoder containsValueForKey:(NSString*)kCTStrokeColorAttributeName]) {
//        [attributes setObject:(id)((UIColor*)[decoder decodeObjectForKey:(NSString *)kCTStrokeColorAttributeName]).CGColor forKey:(NSString*)kCTStrokeColorAttributeName];
//    }
//    
//    if([decoder containsValueForKey:(NSString*)kCTUnderlineColorAttributeName]) {
//        [attributes setObject:(id)((UIColor*)[decoder decodeObjectForKey:(NSString *)kCTUnderlineColorAttributeName]).CGColor forKey:(NSString*)kCTUnderlineColorAttributeName];
//    }
//    
//    if([decoder containsValueForKey:(NSString *)kCTKernAttributeName]) {
//        float value = [decoder decodeFloatForKey:(NSString *)kCTKernAttributeName];
//        CFNumberRef valueRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &value);
//        [attributes setObject:(id)valueRef  forKey:(NSString*)kCTKernAttributeName];
//        CFRelease(valueRef);
//    }
//    
//    if([decoder containsValueForKey:(NSString *)kCTStrokeWidthAttributeName]) {
//        float value = [decoder decodeFloatForKey:(NSString *)kCTStrokeWidthAttributeName];
//        CFNumberRef valueRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &value);
//        [attributes setObject:(id)valueRef  forKey:(NSString*)kCTStrokeWidthAttributeName];
//        CFRelease(valueRef);
//    }
//    
//    if([decoder containsValueForKey:(NSString *)kCTLigatureAttributeName]) {
//        int value = [decoder decodeIntForKey:(NSString *)kCTLigatureAttributeName];
//        CFNumberRef valueRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &value);
//        [attributes setObject:(id)valueRef forKey:(NSString*)kCTLigatureAttributeName];
//        CFRelease(valueRef);
//    }
//    
//    if([decoder containsValueForKey:(NSString *)kCTSuperscriptAttributeName]) {
//        int value = [decoder decodeIntForKey:(NSString *)kCTSuperscriptAttributeName];
//        CFNumberRef valueRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &value);
//        [attributes setObject:(id)valueRef forKey:(NSString*)kCTSuperscriptAttributeName];
//        CFRelease(valueRef);
//    }
//    
//    return attributes;
//}
//
//
//+(NSData*)encodeAttributedString:(NSAttributedString*)attributedString{
//    if(attributedString == nil)
//        return nil;
//    
//    NSMutableData *attributedStringData = [NSMutableData data];
//    NSKeyedArchiver *coder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:attributedStringData];
//    [coder encodeObject:attributedString.string forKey:@"keyString"];
//    
//    NSMutableArray *ranges = [[NSMutableArray alloc] initWithCapacity:1];
//    NSInteger length = attributedString.length;
//    NSInteger pos = 0;
//    // walk the string and get the attributes     
//    while (pos < length) {
//        NSRange range;
//        NSDictionary *attributes = [attributedString attributesAtIndex:pos effectiveRange:&range];
//        NSMutableData *attributeData = [NSMutableData data];
//        NSKeyedArchiver *attributeCoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:attributeData];
//        [self encodeAttributedStringAttributes:attributes withKeyedArchiver:attributeCoder];
//        [attributeCoder finishEncoding];
//        [attributeCoder release];
//        
//        NSString *keyRange = NSStringFromRange(range);
//        [coder encodeObject:attributeData forKey:keyRange];
//        [ranges addObject:keyRange];
//        
//        
//        pos += range.length;
//    }
//    
//    [coder encodeObject:ranges forKey:@"keyRanges"];
//    [ranges release];
//    
//    [coder finishEncoding];
//    [coder release];
//    
//    return attributedStringData;
//}
//
//+(NSAttributedString*)decodeAttributedStringFromData:(NSData*)data {
//    NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//    
//    NSString *string = [decoder decodeObjectForKey:@"keyString"];
//    
//    
//    NSArray *ranges = [decoder decodeObjectForKey:@"keyRanges"];
//    
//    
//    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
//    
//    for (NSString *keyRange in ranges) {
//        NSData *aData = [(NSData*)[decoder decodeObjectForKey:keyRange] retain];
//        NSKeyedUnarchiver *attributeDecoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:aData]; 
//        [aData release];
//        
//        NSDictionary *attributes = [self decodeAttributedStringAttriubtes:attributeDecoder];
//        [attributeDecoder finishDecoding];
//        [attributeDecoder release];
//        
//        [attrString addAttributes:attributes range:NSRangeFromString(keyRange)];
//    }
//    
//    [decoder finishDecoding];
//    [decoder release];
//    
//    NSAttributedString *result = [[attrString copy] autorelease];
//    
//    [attrString release];
//    
//    return result;
//}

@end


@implementation NSAttributedString (Opetopic_Private)

+(id) attributedStringWithDictionaryRepresentation:(NSDictionary*)dictionary {
    
    NSString *string = [dictionary stringForKey:NSAttributedStringArchiveKeys.rootString];
    NSMutableAttributedString *retVal = [[NSMutableAttributedString alloc] initWithString:string];
    
    [[dictionary arrayForKey:NSAttributedStringArchiveKeys.attributes] enumerateObjectsUsingBlock:^(NSDictionary *attribute, NSUInteger idx, BOOL *stop) {
        
        NSDictionary *attributeDictionary = [attribute dictionaryForKey:NSAttributedStringArchiveKeys.attributeDictionary];
        NSRange range = NSRangeFromString([attribute stringForKey:NSAttributedStringArchiveKeys.attributeRange]);
        
        [attributeDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id attr, BOOL *stop) {
            
            if ([key isEqual:(NSString*)kCTFontAttributeName])
            {
                CTFontRef fontRef = [[self class] fontFromDictionaryRepresentation:attr];
                [retVal addAttribute:key value:(id)fontRef range:range];
            }
            else if([key isEqualToString:(NSString*)kCTForegroundColorFromContextAttributeName] ||
                    [key isEqualToString:(NSString*)kCTKernAttributeName] ||
                    [key isEqualToString:(NSString*)kCTStrokeWidthAttributeName] ||
                    [key isEqualToString:(NSString*)kCTLigatureAttributeName] ||
                    [key isEqualToString:(NSString*)kCTSuperscriptAttributeName] ||
                    [key isEqualToString:(NSString*)kCTUnderlineStyleAttributeName] ||
                    [key isEqualToString:(NSString*)kCTCharacterShapeAttributeName])
            {
                [retVal addAttribute:key value:attr range:range];
            }
            else if([key isEqualToString:(NSString*)kCTForegroundColorAttributeName] ||
                    [key isEqualToString:(NSString*)kCTStrokeColorAttributeName] ||
                    [key isEqualToString:(NSString*)kCTUnderlineColorAttributeName])
            {
                [retVal addAttribute:key value:(id)[attr CGColor] range:range];
            }
            else if([key isEqualToString:(NSString*)kCTParagraphStyleAttributeName])
            {
                // TODO
            }
            else if([key isEqualToString:(NSString*)kCTGlyphInfoAttributeName])
            {
                // TODO
            }
            else if([key isEqualToString:(NSString*)kCTRunDelegateAttributeName])
            {
                // TODO
            }
            
        }];
        
    }];
    
    return retVal;
}

-(NSDictionary*) dictionaryRepresentation {
    
    NSMutableDictionary *retVal = [NSMutableDictionary new];
    
    [retVal setObject:[self string] forKey:NSAttributedStringArchiveKeys.rootString];
    
    NSMutableArray *attributes = [NSMutableArray new];
    [retVal setObject:attributes forKey:NSAttributedStringArchiveKeys.attributes];
    
    [self enumerateAttributesInRange:NSMakeRange(0, [self length]) options:0 usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop) {
        
        NSMutableDictionary *attribute = [NSMutableDictionary new];
        [attributes addObject:attribute];
        
        [attribute setObject:NSStringFromRange(range) forKey:NSAttributedStringArchiveKeys.attributeRange];
        NSMutableDictionary *attributeDictionary = [NSMutableDictionary new];
        [attribute setObject:attributeDictionary forKey:NSAttributedStringArchiveKeys.attributeDictionary];
        
        [attrs enumerateKeysAndObjectsUsingBlock:^(id key, id attr, BOOL *stop) {
            
            if ([key isEqual:(NSString*)kCTFontAttributeName])
            {
                [attributeDictionary setObject:[[self class] dictionaryRepresentationOfFont:(CTFontRef)attr] forKey:key];
            }
            else if([key isEqualToString:(NSString*)kCTForegroundColorFromContextAttributeName] ||
                    [key isEqualToString:(NSString*)kCTKernAttributeName] ||
                    [key isEqualToString:(NSString*)kCTStrokeWidthAttributeName] ||
                    [key isEqualToString:(NSString*)kCTLigatureAttributeName] ||
                    [key isEqualToString:(NSString*)kCTSuperscriptAttributeName] ||
                    [key isEqualToString:(NSString*)kCTUnderlineStyleAttributeName] ||
                    [key isEqualToString:(NSString*)kCTCharacterShapeAttributeName])
            {
                [attributeDictionary setObject:attr forKey:key];
            }
            else if([key isEqualToString:(NSString*)kCTForegroundColorAttributeName] ||
                    [key isEqualToString:(NSString*)kCTStrokeColorAttributeName] ||
                    [key isEqualToString:(NSString*)kCTUnderlineColorAttributeName])
            {
                [attributeDictionary setObject:[UIColor colorWithCGColor:(CGColorRef)attr] forKey:key];
            }
            else if([key isEqualToString:(NSString*)kCTParagraphStyleAttributeName])
            {
                
#define SPECIFIER_VALUE(specifier, container) CTParagraphStyleGetValueForSpecifier((CTParagraphStyleRef)attr, specifier, sizeof(container), &container)
                
                uint8_t alignment;
                CGFloat firstLineHeadIndent;
                CGFloat headIndent;
                CGFloat tailIndent;
                CGFloat defaultTabInterval;
                uint8_t linebreakMode;
                CGFloat lineHeightMultiple;
                CGFloat maximumLineHeight;
                CGFloat minimumLineHeight;
                CGFloat lineSpacing;
                CGFloat paragraphSpacing;
                CGFloat paragraphSpacingBefore;
                int8_t baseWritingDirection;
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierAlignment, alignment);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierFirstLineHeadIndent, firstLineHeadIndent);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierHeadIndent, headIndent);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierTailIndent, tailIndent);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierDefaultTabInterval, defaultTabInterval);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierLineBreakMode, linebreakMode);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierLineHeightMultiple, lineHeightMultiple);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierMaximumLineHeight, maximumLineHeight);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierMinimumLineHeight, minimumLineHeight);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierLineSpacing, lineSpacing);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierParagraphSpacing, paragraphSpacing);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierParagraphSpacingBefore, paragraphSpacingBefore);
                SPECIFIER_VALUE(kCTParagraphStyleSpecifierBaseWritingDirection, baseWritingDirection);
                NSMutableDictionary *paragraphDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                            $int(alignment), NSAttributedStringArchiveKeys.paragraphStyle.alignment,
                                                            $float(firstLineHeadIndent), NSAttributedStringArchiveKeys.paragraphStyle.firstLineIndent,
                                                            $float(headIndent), NSAttributedStringArchiveKeys.paragraphStyle.headIndent,
                                                            $float(tailIndent), NSAttributedStringArchiveKeys.paragraphStyle.tailIndent,
                                                            $float(defaultTabInterval), NSAttributedStringArchiveKeys.paragraphStyle.defaultTabInterval,
                                                            $int(linebreakMode), NSAttributedStringArchiveKeys.paragraphStyle.linebreakMode,
                                                            $float(lineHeightMultiple), NSAttributedStringArchiveKeys.paragraphStyle.lineHeightMultiple,
                                                            $float(maximumLineHeight), NSAttributedStringArchiveKeys.paragraphStyle.maximumLineHeight,
                                                            $float(minimumLineHeight), NSAttributedStringArchiveKeys.paragraphStyle.minimumLineHeight,
                                                            $float(lineSpacing), NSAttributedStringArchiveKeys.paragraphStyle.lineSpacing,
                                                            $float(paragraphSpacing), NSAttributedStringArchiveKeys.paragraphStyle.paragraphSpacing,
                                                            $float(paragraphSpacingBefore), NSAttributedStringArchiveKeys.paragraphStyle.paragraphSpacingBefore,
                                                            $int(baseWritingDirection), NSAttributedStringArchiveKeys.paragraphStyle.baseWritingDirection,
                                                            nil];
                [attributeDictionary setObject:paragraphDictionary forKey:key];
            }
            else if([key isEqualToString:(NSString*)kCTGlyphInfoAttributeName])
            {
                // TODO
            }
            else if([key isEqualToString:(NSString*)kCTRunDelegateAttributeName])
            {
                // TODO
            }
            
        }];
        
    }];
    
    return retVal;
}

+(NSDictionary*) dictionaryRepresentationOfFont:(CTFontRef)fontRef {
    
    NSDictionary *retVal = nil;
    CTFontDescriptorRef descriptorRef = CTFontCopyFontDescriptor(fontRef);
    CFDictionaryRef attributesRef = CTFontDescriptorCopyAttributes(descriptorRef);
    retVal = (NSDictionary*)attributesRef;
    CFRelease(attributesRef);
    CFRelease(descriptorRef);
    return retVal;
}

+(CTFontRef) fontFromDictionaryRepresentation:(NSDictionary*)dictionary {
    
    CTFontRef retVal = NULL;
    CTFontDescriptorRef descriptorRef = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)dictionary);
    retVal = CTFontCreateWithFontDescriptor(descriptorRef, 0.0f, NULL);
    CFRelease(descriptorRef);
    return retVal;
}

@end

//
//
//
//CTFontRef CreateFontFromFlattenedFontData(CFDataRef iData)
//{
//    CTFontRef           font = NULL;
//    CFDictionaryRef     attributes;
//    CTFontDescriptorRef descriptor;
//    
//    check(iData != NULL);
//    
//    // Create our font attributes from the property list. We will create
//    // an immutable object for simplicity, but if you needed to massage
//    // the attributes or convert certain attributes from their serializable
//    // form to the Core Text usable form, you could do it here.
//    
//    attributes =
//    (CFDictionaryRef)CFPropertyListCreateFromXMLData(kCFAllocatorDefault, iData, kCFPropertyListImmutable, NULL);
//    
//    check(attributes != NULL);
//    
//    if (attributes != NULL) {
//        // Create the font descriptor from the attributes.
//        descriptor = CTFontDescriptorCreateWithAttributes(attributes);
//        check(descriptor != NULL);
//        
//        if (descriptor != NULL) {
//            // Create the font from the font descriptor. We will use
//            // 0.0 and NULL for the size and matrix parameters. This
//            // causes the font to be created with the size and/or matrix
//            // that exist in the descriptor, if present. Otherwise default
//            // values are used.
//            font = CTFontCreateWithFontDescriptor(descriptor, 0.0, NULL);
//            check(font != NULL);
//            
//            CFRelease(descriptor);
//        }
//        
//        
//        CFRelease(attributes);
//    }
//    
//    return font;
//}
//
//
//
//CFDataRef CreateFlattenedFontData(CTFontRef iFont)
//{
//    CFDataRef           result = NULL;
//    CTFontDescriptorRef descriptor;
//    CFDictionaryRef     attributes;
//    
//    check(iFont != NULL);
//    
//    
//    // Get the font descriptor for the font.
//    descriptor = CTFontCopyFontDescriptor(iFont);
//    check(descriptor != NULL);
//    
//    if (descriptor != NULL) {
//        // Get the font attributes from the descriptor. This should be enough
//        // information to recreate the descriptor and the font later.
//        attributes = CTFontDescriptorCopyAttributes(descriptor);
//        check(attributes != NULL);
//        
//        if (attributes != NULL) {
//            // If attributes are a valid property list, directly flatten
//            // the property list. Otherwise we may need to analyze the attributes
//            // and remove or manually convert them to serializable forms.
//            // This is left as an exercise for the reader.
//            if (CFPropertyListIsValid(attributes, kCFPropertyListXMLFormat_v1_0)) {
//                result = CFPropertyListCreateXMLData(kCFAllocatorDefault, attributes);
//                
//                check(result != NULL);
//            }
//            CFRelease(attributes);
//        }
//        CFRelease(descriptor);
//    }
//    
//    return result;
//}
//
