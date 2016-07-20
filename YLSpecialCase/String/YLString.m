//
//  YLString.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/20.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLString.h"

@implementation YLString

- (void)run {
    
    NSString *str = @"str text";
    NSMutableString *mStr = [NSMutableString stringWithString:@"mStr text"];
    
    [str copy];         // 浅复制
    [str mutableCopy];  // 深复制
    
    [mStr copy];        // 深拷贝
    [mStr mutableCopy]; // 深拷贝
    
    
    //集合对象的内容复制仅限于对象本身，对象元素仍然是指针复制
    NSArray *array = @[@"1", @"2"];
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    
    [array copy];
    [array mutableCopy];
    
    [mArray copy];
    [mArray mutableCopy];
}

@end
