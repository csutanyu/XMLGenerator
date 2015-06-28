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
@property (weak, nonatomic, getter=getParent) XMLNode * parentNode;
@property (strong, nonatomic, readonly) NSArray *childNodes;
@property (strong, nonatomic, readonly) NSDictionary * attributes;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name attributes:(NSDictionary *)attributes;

- (void)addAttributes:(NSDictionary *)attributes;
- (void)addAttributesWithValue:(NSString *)value forKey:(NSString *)key;

- (XMLNode *)addChild:(XMLNode *)node;
- (XMLNode *)addChildWithName:(NSString *)nodeName;
- (XMLNode *)addChildWithName:(NSString *)nodeName attributes:(NSDictionary *)attributes;
- (void)removeChildWithName:(NSString *)nodeName;
- (void)removeChildNode:(XMLNode *)node;

@end
