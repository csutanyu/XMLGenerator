//
//  XMLDocument.h
//  XMLGenerator
//
//  Created by arvin.tan on 6/29/15.
//  Copyright (c) 2015 tanyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLNode.h"

extern NSString *const XMLGeneratorDefaultVersion;
extern NSStringEncoding const XMLGeneratorDefaultEncoding;

@interface XMLDocument : NSObject

@property (nonatomic) NSStringEncoding encoding;
@property (copy, nonatomic) NSString * version;
@property (strong, nonatomic) XMLNode *rootNode;

- (instancetype)initWithRootNode:(XMLNode *)node;
- (instancetype)initWithRootNode:(XMLNode *)node encoding:(NSStringEncoding)encoding;
- (instancetype)initWithRootNode:(XMLNode *)node version:(NSString *)version encoding:(NSStringEncoding)encoding;


- (NSString *)getXMLContent;

@end
