//
//  YLLock.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/26.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLLock.h"

@implementation YLLock

- (void)run {
    
    
//    [self case1];
    
    [self case4];
    
//    [self case3];
    
}

/// case 1:
- (void)case1 {
    
    NSLog(@"task 1");
    
    //1, 程序遇到了同步线程，那么它会进入等待，等待任务2执行完，然后执行任务3
    //2, 但这是队列，有任务来，当然会将任务加到队尾，然后遵循FIFO原则执行任务。那么，现在任务2就会被加到最后，任务3排在了任务2前面
    dispatch_sync(dispatch_get_main_queue(), ^{
        
        NSLog(@"task 2");
    });
    
    NSLog(@"task 3");
    
    //任务3要等任务2执行完才能执行，任务2由排在任务3后面，意味着任务2要在任务3执行完才能执行，所以他们进入了互相等待的局面。【既然这样，那干脆就卡在这里吧】这就是死锁。
}

- (void)case2 {
    
    NSLog(@"task 1");
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"task 2");
    });
    NSLog(@"task 3");
}

- (void)case3 {
    
    dispatch_queue_t queue = dispatch_queue_create("com.vip.serial", DISPATCH_QUEUE_SERIAL);
    
    // 执行任务1；
    NSLog(@"task 1");
    //遇到异步线程，将【任务2、同步线程、任务4】加入串行队列中。因为是异步线程，所以在主线程中的任务5不必等待异步线程中的所有任务完成；
    dispatch_async(queue, ^{
        //因为任务5不必等待，所以2和5的输出顺序不能确定；
        NSLog(@"task 2");
        //任务2执行完以后，遇到同步线程，这时，将任务3加入串行队列；
        dispatch_sync(queue, ^{
            
            //又因为任务4比任务3早加入串行队列，所以，任务3要等待任务4完成以后，才能执行。但是任务3所在的同步线程会阻塞，所以任务4必须等任务3执行完以后再执行。这就又陷入了无限的等待中，造成死锁。
            NSLog(@"task 3");
        });
        NSLog(@"task 4");
    });
    NSLog(@"task 5");
    
}

- (void)case4 {
    
    NSLog(@"task 1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"task 2");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"task 3");
        });
        NSLog(@"task 4");
    });
    NSLog(@"task 5");
}

- (void)case5 {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"task 1");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"task 2");
        });
        NSLog(@"task 3");
    });
    NSLog(@"task 4");
    while (1) {
        
    }
    NSLog(@"task 5");
}



@end
