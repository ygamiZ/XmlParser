//
//  XmlParser.m
//  17.XmlParser
//
//  Created by dllo on 15/2/4.
//  Copyright (c) 2015年 赵雪松. All rights reserved.
//

#import "XmlParser.h"

@implementation XmlParser

- (void)dealloc{
    [self.name release];
    [self.bigArray release];
    [super dealloc];
}
- (instancetype)init{
    if (self = [super init]) {
        self.bigArray = [NSMutableArray array];
    }
    return self;
}
// 开始解析
- (void)startParser{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    // 开始解析
    [parser parse];
}
// SAX解析中, 如果碰到开始节点则走Start方法, 每碰到一次就走一次
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    // 当开始执行到section的时候,开始创建大字典
    if ([elementName isEqualToString:@"bigDic"]) {
        NSMutableDictionary *bigDic = [NSMutableDictionary dictionary];
        NSMutableArray *array = [NSMutableArray array];
        [bigDic setObject:array forKey:@"array"];
        [_bigArray addObject:bigDic];
    }else if ([elementName isEqualToString:@"stu"]){
        NSMutableDictionary *dic = [_bigArray lastObject];
        NSMutableArray *array = [dic objectForKey:@"array"];
        NSMutableDictionary *dicName = [NSMutableDictionary dictionary];
        [array addObject:dicName];
    }
    
//    NSLog(@"startParser = %@, elementName = %@, namespaceURI = %@, qName = %@, attributeDict = %@", parser,elementName, namespaceURI, qName, attributeDict);
//    NSLog(@"---------------------------");
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    // 如果内容在两个标签中间, 则需要在结束标签中标记是哪个标签的内容, 并取值
    if ([elementName isEqualToString:@"group"]) {
        NSMutableDictionary *dic = [_bigArray lastObject];
        [dic setObject:self.name forKey:@"group"];
    }else if ([elementName isEqualToString:@"name"]) {
        NSMutableDictionary *dic = [_bigArray lastObject];
        NSMutableArray *array = [dic objectForKey:@"array"];
        NSMutableDictionary *dicName = [array lastObject];
        [dicName setObject:self.name forKey:@"name"];
    }else if ([elementName isEqualToString:@"sex"]) {
        NSMutableDictionary *dic = [_bigArray lastObject];
        NSMutableArray *array = [dic objectForKey:@"array"];
        NSMutableDictionary *dicName = [array lastObject];
        [dicName setObject:self.name forKey:@"sex"];
    }
//    NSLog(@"%@", _bigArray);
    
    
//    NSLog(@"EndParser = %@, elementName = %@, namespaceURI = %@, qName = %@", parser, elementName, namespaceURI, qName);
//    NSLog(@"---------------------------");
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    self.name = string;
    
    
//    NSLog(@"parser = %@, string = %@", parser, string);
//    NSLog(@"---------------------------");
}


@end
