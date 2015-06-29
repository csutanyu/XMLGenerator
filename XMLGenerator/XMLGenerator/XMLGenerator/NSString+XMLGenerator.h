//
//  NSString+XMLGenerator.h
//  XMLGenerator
//
//  Created by arvin.tan on 6/29/15.
//  Copyright (c) 2015 tanyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XMLGenerator)

+ (NSString *)descriptionOfNSStringEncoding:(NSStringEncoding)encoding;

- (NSString *)stringWithEncoding:(NSStringEncoding)encoding;

@end
