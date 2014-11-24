//
//  xmlParser.h
//  xmlParserTake3
//
//  Created by David Savrda on 11/14/14.
//  Copyright (c) 2014 David Savrda. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Node;

@interface xmlParser : NSObject
{
    NSMutableString *currentElementValue;
    Node *node;
    NSMutableArray *nodes;
    
    
}

@property (nonatomic) Node *node;
@property (nonatomic) NSMutableDictionary *nodes;
- (xmlParser *) initXMLParser;
@end
