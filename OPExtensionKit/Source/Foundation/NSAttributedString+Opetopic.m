//
//  NSAttributedString+Opetopic.m
//  OPExtensionKit
//
//  Created by Brandon Williams on 4/6/12.
//  Copyright (c) 2012 Opetopic. All rights reserved.
//

#import "NSAttributedString+Opetopic.h"
#include <assert.h>
#include <AssertMacros.h>

CTFontDescriptorRef CreateFontDescriptorFromName(CFStringRef iPostScriptName, CGFloat iSize);
CTFontDescriptorRef CreateFontDescriptorFromFamilyAndTraits(CFStringRef iFamilyName, CTFontSymbolicTraits iTraits, CGFloat iSize);
CTFontRef CreateFont(CTFontDescriptorRef iFontDescriptor, CGFloat iSize);
CTFontRef CreateBoldFont(CTFontRef iFont, Boolean iMakeBold);
CFDataRef CreateFlattenedFontData(CTFontRef iFont);
CTFontRef CreateFontFromFlattenedFontData(CFDataRef iData);

@implementation NSAttributedString (Opetopic)

-(id) initWithData:(NSData*)data {
    return nil;
}

-(NSData*) convertToData {
    return nil;
}

+(void)encodeAttributedStringAttributes:(NSDictionary*)attributes withKeyedArchiver:(NSKeyedArchiver*)archiver     {
    
    NSString *key = nil;
    
    for(key in attributes)
    {
        if([key isEqualToString:(NSString*)kCTFontAttributeName]) {
            CTFontRef font = (CTFontRef)[attributes objectForKey:key];
            NSData* fontData = (NSData*)CreateFlattenedFontData(font);
            [archiver encodeObject:fontData forKey:key];
            [fontData release];
        }
        else if([key isEqualToString:(NSString*)kCTForegroundColorFromContextAttributeName]
                //                    || [key isEqualToString:(NSString*)kCTVerticalFormsAttributeName]     // IPHONE_NA
                ) {
            CFBooleanRef boolRef = (CFBooleanRef)[attributes objectForKey:key];
            [archiver encodeBool:((boolRef == kCFBooleanTrue) ? YES : NO)  forKey:key];
        }
        else if([key isEqualToString:(NSString*)kCTKernAttributeName]
                || [key isEqualToString:(NSString*)kCTStrokeWidthAttributeName]
                ) {
            CFNumberRef valueRef = (CFNumberRef)[attributes objectForKey:key];
            float floatValue;
            CFNumberGetValue(valueRef, kCFNumberFloatType, &floatValue);
            [archiver encodeFloat:floatValue forKey:key];
        }
        else if([key isEqualToString:(NSString*)kCTLigatureAttributeName]
                ||[key isEqualToString:(NSString*)kCTSuperscriptAttributeName]
                ) {
            CFNumberRef valueRef = (CFNumberRef)[attributes objectForKey:key];
            int value;
            CFNumberGetValue(valueRef, kCFNumberIntType, &value);
            [archiver encodeInteger:value forKey:key];
        }
        else if([key isEqualToString:(NSString*)kCTForegroundColorAttributeName]
                || [key isEqualToString:(NSString*)kCTStrokeColorAttributeName]
                || [key isEqualToString:(NSString*)kCTUnderlineColorAttributeName]
                ) {
            CGColorRef color = (CGColorRef)[attributes objectForKey:key];
            [archiver encodeObject:[UIColor colorWithCGColor:color]  forKey:key];
        }
        else if([key isEqualToString:(NSString*)kCTParagraphStyleAttributeName]) {
            // CTParagraphStyleRef
            // TODO: need to encode the paragraph style
        }
        else if([key isEqualToString:(NSString*)kCTUnderlineStyleAttributeName]) {
            // CFNumberRef bytes matter
            // TODO: need to encode the underline style
        }
        else if([key isEqualToString:(NSString*)kCTGlyphInfoAttributeName]) {
            // CTGlyphInfoRef
            // TODO: need to encode the Glyph Info
        }
        else if([key isEqualToString:(NSString*)kCTCharacterShapeAttributeName]) {
            // CFNumberRef see kCharacterShapeType selector in <ATS/SFNTLayoutTypes.h>
            // TODO: look into encoding the character shape attribute
        }
        else if([key isEqualToString:(NSString*)kCTRunDelegateAttributeName]) {
            // CTRunDelegateRef
            // probably won't encode and decode well
        }
    }
}



+(NSDictionary*)decodeAttributedStringAttriubtes:(NSKeyedUnarchiver*)decoder {
    NSMutableDictionary *attributes = [[[NSMutableDictionary alloc] initWithCapacity:1] autorelease];
    
    if([decoder containsValueForKey:(NSString *)kCTFontAttributeName]) {
        NSData *fontData = [decoder decodeObjectForKey:(NSString*)kCTFontAttributeName];
        if(fontData) {
            CTFontRef font = CreateFontFromFlattenedFontData((CFDataRef)fontData);
            [attributes setObject:(id)font forKey:(NSString*)kCTFontAttributeName];
            CFRelease(font);
        }
    }
    
    if([decoder containsValueForKey:(NSString *)kCTForegroundColorFromContextAttributeName]) {
        BOOL boolValue = [decoder decodeBoolForKey:(NSString *)kCTForegroundColorFromContextAttributeName];
        [attributes setObject:(id)(boolValue == YES ? kCFBooleanTrue : kCFBooleanFalse) forKey:(NSString*)kCTForegroundColorFromContextAttributeName];
    }
    
    //     IPHONE_NA     
    //     if([decoder containsValueForKey:(NSString *)kCTVerticalFormsAttributeName]) {
    //          BOOL boolValue = [decoder decodeBoolForKey:(NSString *)kCTVerticalFormsAttributeName];
    //          [attributes setObject:(id)(boolValue == YES ? kCFBooleanTrue : kCFBooleanFalse) forKey:(NSString*)kCTVerticalFormsAttributeName];
    //     }
    
    if([decoder containsValueForKey:(NSString*)kCTForegroundColorAttributeName]) {
        [attributes setObject:(id)((UIColor*)[decoder decodeObjectForKey:(NSString *)kCTForegroundColorAttributeName]).CGColor forKey:(NSString*)kCTForegroundColorAttributeName];
    }
    
    if([decoder containsValueForKey:(NSString*)kCTStrokeColorAttributeName]) {
        [attributes setObject:(id)((UIColor*)[decoder decodeObjectForKey:(NSString *)kCTStrokeColorAttributeName]).CGColor forKey:(NSString*)kCTStrokeColorAttributeName];
    }
    
    if([decoder containsValueForKey:(NSString*)kCTUnderlineColorAttributeName]) {
        [attributes setObject:(id)((UIColor*)[decoder decodeObjectForKey:(NSString *)kCTUnderlineColorAttributeName]).CGColor forKey:(NSString*)kCTUnderlineColorAttributeName];
    }
    
    if([decoder containsValueForKey:(NSString *)kCTKernAttributeName]) {
        float value = [decoder decodeFloatForKey:(NSString *)kCTKernAttributeName];
        CFNumberRef valueRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &value);
        [attributes setObject:(id)valueRef  forKey:(NSString*)kCTKernAttributeName];
        CFRelease(valueRef);
    }
    
    if([decoder containsValueForKey:(NSString *)kCTStrokeWidthAttributeName]) {
        float value = [decoder decodeFloatForKey:(NSString *)kCTStrokeWidthAttributeName];
        CFNumberRef valueRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &value);
        [attributes setObject:(id)valueRef  forKey:(NSString*)kCTStrokeWidthAttributeName];
        CFRelease(valueRef);
    }
    
    if([decoder containsValueForKey:(NSString *)kCTLigatureAttributeName]) {
        int value = [decoder decodeIntForKey:(NSString *)kCTLigatureAttributeName];
        CFNumberRef valueRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &value);
        [attributes setObject:(id)valueRef forKey:(NSString*)kCTLigatureAttributeName];
        CFRelease(valueRef);
    }
    
    if([decoder containsValueForKey:(NSString *)kCTSuperscriptAttributeName]) {
        int value = [decoder decodeIntForKey:(NSString *)kCTSuperscriptAttributeName];
        CFNumberRef valueRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &value);
        [attributes setObject:(id)valueRef forKey:(NSString*)kCTSuperscriptAttributeName];
        CFRelease(valueRef);
    }
    
    return attributes;
}


+(NSData*)encodeAttributedString:(NSAttributedString*)attributedString{
    if(attributedString == nil)
        return nil;
    
    NSMutableData *attributedStringData = [NSMutableData data];
    NSKeyedArchiver *coder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:attributedStringData];
    [coder encodeObject:attributedString.string forKey:@"keyString"];
    
    NSMutableArray *ranges = [[NSMutableArray alloc] initWithCapacity:1];
    NSInteger length = attributedString.length;
    NSInteger pos = 0;
    // walk the string and get the attributes     
    while (pos < length) {
        NSRange range;
        NSDictionary *attributes = [attributedString attributesAtIndex:pos effectiveRange:&range];
        NSMutableData *attributeData = [NSMutableData data];
        NSKeyedArchiver *attributeCoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:attributeData];
        [self encodeAttributedStringAttributes:attributes withKeyedArchiver:attributeCoder];
        [attributeCoder finishEncoding];
        [attributeCoder release];
        
        NSString *keyRange = NSStringFromRange(range);
        [coder encodeObject:attributeData forKey:keyRange];
        [ranges addObject:keyRange];
        
        
        pos += range.length;
    }
    
    [coder encodeObject:ranges forKey:@"keyRanges"];
    [ranges release];
    
    [coder finishEncoding];
    [coder release];
    
    return attributedStringData;
}

+(NSAttributedString*)decodeAttributedStringFromData:(NSData*)data {
    NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    NSString *string = [decoder decodeObjectForKey:@"keyString"];
    
    
    NSArray *ranges = [decoder decodeObjectForKey:@"keyRanges"];
    
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    
    for (NSString *keyRange in ranges) {
        NSData *aData = [(NSData*)[decoder decodeObjectForKey:keyRange] retain];
        NSKeyedUnarchiver *attributeDecoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:aData]; 
        [aData release];
        
        NSDictionary *attributes = [self decodeAttributedStringAttriubtes:attributeDecoder];
        [attributeDecoder finishDecoding];
        [attributeDecoder release];
        
        [attrString addAttributes:attributes range:NSRangeFromString(keyRange)];
    }
    
    [decoder finishDecoding];
    [decoder release];
    
    NSAttributedString *result = [[attrString copy] autorelease];
    
    [attrString release];
    
    return result;
}









#pragma mark -
#pragma mark ---------
#pragma mark -



CTFontDescriptorRef CreateFontDescriptorFromName(CFStringRef iPostScriptName, CGFloat iSize)
{
    assert(iPostScriptName != NULL);
    return CTFontDescriptorCreateWithNameAndSize(iPostScriptName, iSize);
}

CTFontDescriptorRef CreateFontDescriptorFromFamilyAndTraits(CFStringRef iFamilyName, CTFontSymbolicTraits iTraits, CGFloat iSize)
{
    CTFontDescriptorRef descriptor = NULL;
    CFMutableDictionaryRef attributes;
    
    assert(iFamilyName != NULL);
    
    
    // Create a mutable dictionary to hold our attributes.
    attributes = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    check(attributes != NULL);
    
    if (attributes != NULL) {
        CFMutableDictionaryRef traits;
        CFNumberRef symTraits;
        
        // Add a family name to our attributes.
        CFDictionaryAddValue(attributes, kCTFontFamilyNameAttribute, iFamilyName);
        
        // Create the traits dictionary.
        symTraits = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &iTraits);
        
        check(symTraits != NULL);
        
        if (symTraits != NULL) {
            // Create a dictionary to hold our traits values.
            traits = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            
            check(traits != NULL);
            
            if (traits != NULL) {
                // Add the symbolic traits value to the traits dictionary.
                CFDictionaryAddValue(traits, kCTFontSymbolicTrait, symTraits);
                
                // Add the traits attribute to our attributes.
                CFDictionaryAddValue(attributes, kCTFontTraitsAttribute, traits);
                
                CFRelease(traits);
            }
            
            CFRelease(symTraits);
        }
        
        // Create the font descriptor with our attributes and input size.
        descriptor = CTFontDescriptorCreateWithAttributes(attributes);
        check(descriptor != NULL);
        
        CFRelease(attributes);
    }
    
    // Return our font descriptor.
    return descriptor;
}

CTFontRef CreateFont(CTFontDescriptorRef iFontDescriptor, CGFloat iSize)
{
    check(iFontDescriptor != NULL);
    
    // Create the font from the font descriptor and input size. Pass
    // NULL for the matrix parameter to use the default matrix (identity).
    return CTFontCreateWithFontDescriptor(iFontDescriptor, iSize, NULL);
    
}

CTFontRef CreateBoldFont(CTFontRef iFont, Boolean iMakeBold)
{
    CTFontSymbolicTraits desiredTrait = 0;
    CTFontSymbolicTraits traitMask;
    
    // If we are trying to make the font bold, set the desired trait
    // to be bold.
    
    if (iMakeBold)
        desiredTrait = kCTFontBoldTrait;
    
    // Mask off the bold trait to indicate that it is the only trait
    // desired to be modified. As CTFontSymbolicTraits is a bit field,
    // we could choose to change multiple traits if we desired.
    traitMask = kCTFontBoldTrait;
    
    // Create a copy of the original font with the masked trait set to the
    // desired value. If the font family does not have the appropriate style,
    // this will return NULL.
    return CTFontCreateCopyWithSymbolicTraits(iFont, 0.0, NULL, desiredTrait, traitMask);
}

CFDataRef CreateFlattenedFontData(CTFontRef iFont)
{
    CFDataRef           result = NULL;
    CTFontDescriptorRef descriptor;
    CFDictionaryRef     attributes;
    
    check(iFont != NULL);
    
    
    // Get the font descriptor for the font.
    descriptor = CTFontCopyFontDescriptor(iFont);
    check(descriptor != NULL);
    
    if (descriptor != NULL) {
        // Get the font attributes from the descriptor. This should be enough
        // information to recreate the descriptor and the font later.
        attributes = CTFontDescriptorCopyAttributes(descriptor);
        check(attributes != NULL);
        
        if (attributes != NULL) {
            // If attributes are a valid property list, directly flatten
            // the property list. Otherwise we may need to analyze the attributes
            // and remove or manually convert them to serializable forms.
            // This is left as an exercise for the reader.
            if (CFPropertyListIsValid(attributes, kCFPropertyListXMLFormat_v1_0)) {
                result = CFPropertyListCreateXMLData(kCFAllocatorDefault, attributes);
                
                check(result != NULL);
            }
            CFRelease(attributes);
        }
        CFRelease(descriptor);
    }
    
    return result;
}


CTFontRef CreateFontFromFlattenedFontData(CFDataRef iData)
{
    CTFontRef           font = NULL;
    CFDictionaryRef     attributes;
    CTFontDescriptorRef descriptor;
    
    check(iData != NULL);
    
    // Create our font attributes from the property list. We will create
    // an immutable object for simplicity, but if you needed to massage
    // the attributes or convert certain attributes from their serializable
    // form to the Core Text usable form, you could do it here.
    
    attributes =
    (CFDictionaryRef)CFPropertyListCreateFromXMLData(kCFAllocatorDefault, iData, kCFPropertyListImmutable, NULL);
    
    check(attributes != NULL);
    
    if (attributes != NULL) {
        // Create the font descriptor from the attributes.
        descriptor = CTFontDescriptorCreateWithAttributes(attributes);
        check(descriptor != NULL);
        
        if (descriptor != NULL) {
            // Create the font from the font descriptor. We will use
            // 0.0 and NULL for the size and matrix parameters. This
            // causes the font to be created with the size and/or matrix
            // that exist in the descriptor, if present. Otherwise default
            // values are used.
            font = CTFontCreateWithFontDescriptor(descriptor, 0.0, NULL);
            check(font != NULL);
            
            CFRelease(descriptor);
        }
        
        
        CFRelease(attributes);
    }
    
    return font;
}


@end
