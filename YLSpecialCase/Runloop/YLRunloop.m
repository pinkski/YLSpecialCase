//
//  YLRunloop.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/21.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLRunloop.h"

@implementation YLRunloop

- (void)run {
    
    // from Foundation
//    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//    [NSRunLoop mainRunLoop];
    
    // from Core Foundation
//    CFRunLoopRef runloopRef = CFRunLoopGetCurrent();
//    CFRunLoopGetMain();
    
    //主线程的RunLoop已经自动创建好了，子线程的RunLoop需要主动创建
    //RunLoop在第一次获取时创建，在线程结束时销毁
    
    NSLog(@"主线程：%p , %p", [NSRunLoop currentRunLoop], [NSRunLoop mainRunLoop]);
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(action) object:nil];
    
    [thread start];
}

- (void)action {
    
    sleep(2);
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    
    NSLog(@"二线程：%p, %p , %p", runloop, [NSRunLoop currentRunLoop], [NSRunLoop mainRunLoop]);
}

@end
