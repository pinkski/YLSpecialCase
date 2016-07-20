//
//  YLGCD.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/19.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLGCD.h"

@implementation YLGCD

- (void)run {
    
    //1, 延时
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
    //2, 异步
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // to do
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
    
    //3, 一组线程执行完毕后执行 ， 无序
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        // first
    });
    
    dispatch_group_async(group, queue, ^{
        // second
    });
    
    dispatch_group_async(group, queue, ^{
        // third
    });
    
    dispatch_group_notify(group, queue, ^{
        // after before
    });
    
    
    //4, 一组线程按顺序执行， 有序
    dispatch_queue_t queue2 = dispatch_queue_create("gcd_test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue2, ^{
        
    });
    
    dispatch_async(queue2, ^{
        
    });
    
    dispatch_async(queue2, ^{
        
    });
    
    dispatch_barrier_async(queue2, ^{
        
    });
    
    //5, 执行n次
    dispatch_apply(5, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
        
    });
    
    //6, timer
    
    //7, 单例
    
}


- (void)test {

    // pthread
    
    // NSThread
    
    // GCD
    
    // NSOperation
    
}

@end
