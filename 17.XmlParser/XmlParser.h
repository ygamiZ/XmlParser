//
//  XmlParser.h
//  17.XmlParser
//
//  Created by dllo on 15/2/4.
//  Copyright (c) 2015年 赵雪松. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlParser : NSObject<NSXMLParserDelegate>

@property (retain, nonatomic) NSMutableArray *bigArray;

@property (retain, nonatomic) NSString *name;

- (void)startParser;

@end
