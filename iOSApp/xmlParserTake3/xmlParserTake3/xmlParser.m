//
//  xmlParser.m
//  xmlParserTake3
//
//  Created by David Savrda on 11/14/14.
//  Copyright (c) 2014 David Savrda. All rights reserved.
//

#import "xmlParser.h"
#import "Node.h"

@implementation xmlParser


- (xmlParser *) initXMLParser {
    self = [super init];
    // init array of user objects
    _nodes = [[NSMutableDictionary alloc] init];
    return self;
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"node"]) {
        NSLog(@"node element found – create a new instance of Node class...");
        _node = [[Node alloc] init];
        _node.nameArray = [[NSMutableArray alloc] init];
        _node.typeArray = [[NSMutableArray alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElementValue) {
        // init the ad hoc string with the value
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else {
        // append value to the ad hoc string
        [currentElementValue appendString:string];
    }
    NSLog(@"Processing value for : %@", string);
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"document"]) {
        // We reached the end of the XML document
        return;
    }
    if ([elementName isEqualToString:@"name"]){
        _node.name = currentElementValue;
    }
    if ([elementName isEqualToString:@"ccdNodeName"]){
        _node.ccdNodeName = currentElementValue;
    }
    if([elementName isEqualToString:@"text"]){
        _node.text = currentElementValue;
    }
    if([elementName isEqualToString:@"childName"]){
        [_node.nameArray addObject:currentElementValue];
    }
    if([elementName isEqualToString:@"type"]){
        [_node.typeArray addObject:currentElementValue];
    }
    if ([elementName isEqualToString:@"node"]) {
        // We are done with user entry – add the parsed user
        // object to our user array
        [_nodes setValue: _node forKey:_node.name];
        // release user object
        _node = nil;
    } else {
        // The parser hit one of the element values.
        // This syntax is possible because User object
        // property names match the XML user element names
        //[_node setValue:currentElementValue forKey:elementName];
    }
    currentElementValue = nil;
}

@end
