//
//  ViewController.m
//  xmlParserTake3
//
//  Created by David Savrda on 11/14/14.
//  Copyright (c) 2014 David Savrda. All rights reserved.
//

#import "ViewController.h"
#import "xmlParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self doParse:[[NSData alloc] initWithContentsOfFile:@"/Users/davidsavrda/Dropbox/HIEsuggestedxml.xml"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) doParse:(NSData *)data {
    
    // create and init NSXMLParser object
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    
    // create and init our delegate
    xmlParser *parser = [[xmlParser alloc] initXMLParser];
    
    // set delegate
    [nsXmlParser setDelegate:parser];
    
    // parsing...
    BOOL success = [nsXmlParser parse];
    
    // test the result
    if (success) {
        NSLog(@"No errors - user count : %i", [parser.nodes count]);
        // get array of users here
        //  NSMutableArray *users = [parser users];
    } else {
        NSLog(@"Error parsing document!");
    }
    
}

@end
