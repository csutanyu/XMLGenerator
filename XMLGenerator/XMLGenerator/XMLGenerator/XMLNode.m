//
//  XMLNode.m
//  XMLGenerator
//
//  Created by tanyu on 6/28/15.
//  Copyright (c) 2015 tanyu. All rights reserved.
//

#import "XMLNode.h"

@interface XMLNode () {
    NSMutableDictionary *_childNodes;
    NSMutableDictionary *_attributes;
}

@end

@implementation XMLNode
@synthesize attributes = _attributes;

- (NSArray *)childNodes {
    return [_childNodes allValues];
}

- (instancetype)initWithName:(NSString *)name {
    return [self initWithName:name content:nil attributes:nil];
}

- (instancetype)initWithName:(NSString *)name content:(NSString *)content {
    return [self initWithName:name content:content attributes:nil];
}

- (instancetype)initWithName:(NSString *)name content:(NSString *)content attributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        _childNodes = [NSMutableDictionary dictionary];
        _attributes = [NSMutableDictionary dictionary];
        _name = name;
        _content = content;
        if (attributes) {
            [self addAttributes:attributes];
        }
    }
    return self;
}

- (void)addAttributes:(NSDictionary *)attributes {
    [_attributes addEntriesFromDictionary:attributes];
}

- (void)addAttributesWithValue:(NSString *)value forKey:(NSString *)key {
    [_attributes setValue:value forKey:key];
}

- (NSString *)attriguteForKey:(NSString *)key {
    return _attributes[key];
}

- (XMLNode *)addChild:(XMLNode *)node {
    [_childNodes setObject:node forKey:node.name];
    node.parentNode = self;
    return node;
}

- (XMLNode *)addChildWithName:(NSString *)nodeName {
    return [self addChildWithName:nodeName content:nil attributes:nil];
}

- (XMLNode *)addChildWithName:(NSString *)nodeName content:(NSString *)content {
    return [self addChildWithName:nodeName content:content attributes:nil];
}

- (XMLNode *)addChildWithName:(NSString *)nodeName attributes:(NSDictionary *)attributes {
    return [self addChildWithName:nodeName content:nil attributes:attributes];
}

- (XMLNode *)addChildWithName:(NSString *)nodeName content:(NSString *)content attributes:(NSDictionary *)attributes {
    XMLNode *node = [[XMLNode alloc] initWithName:nodeName content:content attributes:attributes];
    return [self addChild:node];
}

- (void)removeChildWithName:(NSString *)nodeName {
    [_childNodes removeObjectForKey:nodeName];
}

- (void)removeChildNode:(XMLNode *)node {
    [_childNodes removeObjectForKey:node.name];
}

- (NSMutableString *)outputNodeToString {
    NSMutableString *str = [NSMutableString string];
    [self outputNodeToString:str];
    return str;
}

- (void)outputNodeToString:(NSMutableString *)prefix {
    [prefix appendFormat:@"\n<%@", self.name];
    for (NSString *key in _attributes) {
        [prefix appendFormat:@" %@=\"%@\"", key, _attributes[key]];
    }
    [prefix appendString:@">"];
    if (self.content) {
        [prefix appendFormat:@" %@ ",self.content];
    }
    
    for (XMLNode *node in _childNodes.allValues) {
        [node outputNodeToString:prefix];
    }
    if (_childNodes.count) {
        [prefix appendString:@"\n"];
    }
    [prefix appendFormat:@"</%@>", self.name];
}

@end
