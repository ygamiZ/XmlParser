//
//  ViewController.m
//  17.XmlParser
//
//  Created by dllo on 15/2/4.
//  Copyright (c) 2015年 赵雪松. All rights reserved.
//

#import "ViewController.h"
#import "XmlParser.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc{
    [super dealloc];
}
- (void)awakeFromNib{
//    NSString *xml = @"<root>\
//                        <list>\
//                         <student>\
//                            <name>张三</name>\
//                            <age>10</age>\
//                            <sex>男</sex>\
//                         </student>\
//                        </list>\
//                       </root>";
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XmlParser *xmlP = [[XmlParser alloc] init];
//    NSLog(@"%@", xmlP);
    // 在解析之前设置代理人
    [xmlP startParser];
    NSLog(@"%@", xmlP.bigArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}













@end
