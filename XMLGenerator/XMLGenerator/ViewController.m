//
//  ViewController.m
//  XMLGenerator
//
//  Created by tanyu on 6/28/15.
//  Copyright (c) 2015 tanyu. All rights reserved.
//

#import "ViewController.h"
#import "XMLDocument.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testXMLGenerator:(id)sender {
    XMLNode *node = [[XMLNode alloc] initWithName:@"CategoryList" content:nil];
    XMLDocument *document = [[XMLDocument alloc] initWithRootNode:node];
    XMLNode *category = [node addChildWithName:@"Category" attributes:@{@"ID":@"01"}];
    [category addChildWithName:@"MainCategory" content:@"XML"];
    [category addChildWithName:@"Description" content:@"This is a list my XML articles"];
    [category addChildWithName:@"Active" content:@"true"];
    NSLog(@"%@", [document getXMLContent]);
}

@end
