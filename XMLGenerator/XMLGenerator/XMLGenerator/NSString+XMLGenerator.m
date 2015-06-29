//
//  NSString+XMLGenerator.m
//  XMLGenerator
//
//  Created by arvin.tan on 6/29/15.
//  Copyright (c) 2015 tanyu. All rights reserved.
//

#import "NSString+XMLGenerator.h"

@implementation NSString (XMLGenerator)

+ (NSString *)descriptionOfNSStringEncoding:(NSStringEncoding)encoding {
    CFStringEncoding cfEncoding = CFStringConvertNSStringEncodingToEncoding(encoding);
    if (kCFStringEncodingInvalidId != cfEncoding) {
        return (__bridge_transfer NSString *)CFStringConvertEncodingToIANACharSetName(cfEncoding);
    } else {
        return @"utf-8";
    }
}

- (NSString *)stringWithEncoding:(NSStringEncoding)encoding {
    if (![self canBeConvertedToEncoding:encoding]) {
        return nil;
    }
    
    NSData *data = [self dataUsingEncoding:encoding];
    return [[NSString alloc] initWithData:data encoding:encoding];
}

@end
