//
//  YLAutorelease.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/21.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLAutorelease.h"
#import <CoreData/CoreData.h>

@implementation YLAutorelease

- (void)run {
    
    // 0, every runloop ==> one autoreleasepool
    // 1, all obj ==> autoreleasepool
    // 2, runloop end ==> autoreleasepool destroy ==> all obj release
    // runloop meas  UI事件， timerCall  delegateCall
    
    NSManagedObject;//实现了core data 模型层所需的基本功能,用户可通过子类化NSManagedObject,建立自己的数据模型
    
    NULL; //C语言中的空指针
    nil; //OC 指向空对象的指针
    Nil; //OC 指向类的空指针
    NSNull; // OC 数组或字典的集合
    
    
}

@end
