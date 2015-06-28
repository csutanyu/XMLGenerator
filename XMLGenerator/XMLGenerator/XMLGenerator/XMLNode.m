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
    return [self initWithName:name attributes:nil];
}

- (instancetype)initWithName:(NSString *)name attributes:(NSDictionary *)attributes {
    self = [super init];
    if (self) {
        _name = name;
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

- (XMLNode *)addChild:(XMLNode *)node {
    [_childNodes setObject:node forKey:node.name];
    return node;
}

- (XMLNode *)addChildWithName:(NSString *)nodeName {
    return [self addChildWithName:nodeName attributes:nil];
}

- (XMLNode *)addChildWithName:(NSString *)nodeName attributes:(NSDictionary *)attributes {
    XMLNode *node = [[XMLNode alloc] initWithName:nodeName attributes:attributes];
    return [self addChild:node];
}

- (void)removeChildWithName:(NSString *)nodeName {
    [_childNodes removeObjectForKey:nodeName];
}

- (void)removeChildNode:(XMLNode *)node {
    [_childNodes removeObjectForKey:node.name];
}

@end
