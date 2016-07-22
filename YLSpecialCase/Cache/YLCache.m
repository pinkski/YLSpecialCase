

//
//  YLCache.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/21.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLCache.h"

@implementation YLCache

- (void)run {
    
    // 缓存分类：内存缓存、数据库缓存、文件缓存
    
    // 1,检查内存缓存是否有数据
    // 2,检查本地文件是否有缓存： 数据库、文件
    // 3,发送网络请求
    // 4,将请求回来的数据进行缓存（内存、DB、文件）
    
    //并行设备的硬件寄存器（如：状态寄存器）
    //一个中断服务子程序中会访问到的非自动变量(Non-automatic variables)
    //多线程应用中被几个任务共享的变量
    
    volatile int test = 10.0;
}

@end
