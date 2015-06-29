//
//  XMLNode.h
//  XMLGenerator
//
//  Created by tanyu on 6/28/15.
//  Copyright (c) 2015 tanyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLNode : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *content;
@property (weak, nonatomic, getter=getParent) XMLNode * parentNode;
@property (strong, nonatomic, readonly) NSArray *childNodes;
@property (strong, nonatomic, readonly) NSDictionary * attributes;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name content:(NSString *)content;
- (instancetype)initWithName:(NSString *)name content:(NSString *)content attributes:(NSDictionary *)attributes;

- (void)addAttributes:(NSDictionary *)attributes;
- (void)addAttributesWithValue:(NSString *)value forKey:(NSString *)key;
- (NSString *)attriguteForKey:(NSString *)key;

- (XMLNode *)addChild:(XMLNode *)node;
- (XMLNode *)addChildWithName:(NSString *)nodeName;
- (XMLNode *)addChildWithName:(NSString *)nodeName content:(NSString *)content;
- (XMLNode *)addChildWithName:(NSString *)nodeName attributes:(NSDictionary *)attributes;
- (XMLNode *)addChildWithName:(NSString *)nodeName content:(NSString *)content attributes:(NSDictionary *)attributes;
- (void)removeChildWithName:(NSString *)nodeName;
- (void)removeChildNode:(XMLNode *)node;

- (NSMutableString *)outputNodeToString;

@end
