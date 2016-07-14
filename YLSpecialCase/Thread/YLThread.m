//
//  YLThread.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/14.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLThread.h"
#import <pthread/pthread.h>

@implementation YLThread

- (void)runSynchronized {
    
    //1, synchronized
    NSObject *obj = [NSObject new];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        @synchronized (obj) {
            NSLog(@"操作1， 开始");
            sleep(3);
            NSLog(@"操作1， 结束");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        @synchronized (obj) {
            NSLog(@"操作2， 开始");
        }
    });
    
}


- (void)runSemaphore {
    
    // 2, dispatch_semaphore
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    dispatch_time_t overtime = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_semaphore_wait(signal, overtime);  //signal value - 1
        NSLog(@"操作1，开始");
        sleep(2);
        NSLog(@"操作1，结束");
        dispatch_semaphore_signal(signal); //signal value + 1
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        sleep(1);
        dispatch_semaphore_wait(signal, overtime);  //signal value = 0  to  1
        NSLog(@"操作2，开始");
        dispatch_semaphore_signal(signal);  //signal value = 2
    });
    
}

- (void)runLock {
    
    // 3, NSLock
    NSLock *lock = [NSLock new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        [lock lockBeforeDate:[NSDate date]];
        NSLog(@"操作1，开始");
        sleep(2);
        NSLog(@"操作2，结束");
        [lock unlock];
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        sleep(1);
        if ([lock tryLock]) {
            
            [lock unlock];
        } else {
            NSLog(@"锁不可用");
        }
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:3];
        if ([lock lockBeforeDate:date]) {
            
            NSLog(@"没有超时，获得锁");
            [lock unlock];
        } else {
            
            NSLog(@"超时，没有获得锁");
        }
        
    });
}

- (void)runMutex {
    
    //4, pthread_mutex
    __block pthread_mutex_t theLock;
    pthread_mutex_init(&theLock, NULL);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        pthread_mutex_lock(&theLock);
        NSLog(@"线程1，开始");
        sleep(3);
        NSLog(@"线程2，结束");
        pthread_mutex_unlock(&theLock);
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
//        sleep(1);
        pthread_mutex_lock(&theLock);
        NSLog(@"线程2");
        pthread_mutex_unlock(&theLock);
    });
    
}


@end
