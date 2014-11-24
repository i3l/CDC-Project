//
//  Node.h
//  xmlParserTake3
//
//  Created by David Savrda on 11/14/14.
//  Copyright (c) 2014 David Savrda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject{
    NSString *name;
    NSString *ccdNodeName;
    NSString *ccdNodeValue;
    NSString *text;
    NSMutableArray *nameArray;
    NSMutableArray *typeArray;
}
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *ccdNodeName;
@property (nonatomic) NSString *ccdNodeValue;
@property (nonatomic) NSString *text;
@property (nonatomic) NSMutableArray *nameArray;
@property (nonatomic) NSMutableArray *typeArray;

@end
