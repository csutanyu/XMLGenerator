//
//  XMLDocument.m
//  XMLGenerator
//
//  Created by arvin.tan on 6/29/15.
//  Copyright (c) 2015 tanyu. All rights reserved.
//

#import "XMLDocument.h"
#import "NSString+XMLGenerator.h"

NSString *const XMLGeneratorDefaultVersion = @"1.0";
NSStringEncoding const XMLGeneratorDefaultEncoding = NSUTF8StringEncoding;

@implementation XMLDocument

- (instancetype)initWithRootNode:(XMLNode *)node {
    return [self initWithRootNode:node version:XMLGeneratorDefaultVersion encoding:NSUTF8StringEncoding];
}

- (instancetype)initWithRootNode:(XMLNode *)node encoding:(NSStringEncoding)encoding {
    return [self initWithRootNode:node version:XMLGeneratorDefaultVersion encoding:encoding];
}

- (instancetype)initWithRootNode:(XMLNode *)node version:(NSString *)version encoding:(NSStringEncoding)encoding {
    self = [super init];
    if (self) {
        _rootNode = node;
        _version = version;
        _encoding = encoding;
    }
    return self;
}

- (NSString *)getXMLContent {
    NSString *rootNodeString = self.rootNode.outputNodeToString;
    if (![rootNodeString canBeConvertedToEncoding:self.encoding]) {
        self.encoding = NSUTF8StringEncoding;
    }
    
    NSString *str = [NSString stringWithFormat:@"<?xml version=\"%@\" encoding=\"%@\"?> %@", self.version, [NSString descriptionOfNSStringEncoding:self.encoding], self.rootNode.outputNodeToString];
    return [str stringWithEncoding:self.encoding];
}

@end
