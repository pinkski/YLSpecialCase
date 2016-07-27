//
//  YLSynchronized.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/27.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLSynchronized.h"
#import "YLLock.h"

@interface YLSynchronized()

@property (nonatomic, assign) int seat; ///<座位数
@property (atomic, strong) YLLock *lock;

@end

@implementation YLSynchronized


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.seat = 15;
    _lock = [YLLock new];
    _lock.count = 15;
    
    //线程1
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(reserveSeat) object:nil];
    thread1.name = @"他的";
    [thread1 start];
    
    //线程2
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(reserveSeat) object:nil];
    thread2.name = @"我的";
    [thread2 start];
    
}

- (void)reserveSeat {
    
    //    我们必须座位预定完   也就是一直循环 直到seat属性没有值
    while (true) {
        
        // 注意，锁一定要是所有线程共享的对象
        // 如果代码中只有一个地方需要加锁，大多都使用 self
        @synchronized (self) {
        
            if (self.lock.count > 0) {
                
                NSLog(@"预定了座位%li --- %@", (long)self.lock.count, [NSThread currentThread]);
                self.lock.count--;
            } else {
                
                NSLog(@"没有座位了 --- %@", [NSThread currentThread]);
                break;
            }
        }
        
        volatile;
        
        [[NSUserDefaults standardUserDefaults] synchronize];   //同步内存里的键值对到disk
    }
}

// 总结：锁能加到任意NSObject对象，但是一定是所有线程都可访问到，锁的范围越大效率越差

// atomic(自旋) sychronized(互斥) 对比
// 都能锁定一块代码，保证同时只有一个线程访问
//互斥锁：当上一个线程的任务没有执行完毕的时候（被锁住），那么下一个线程会进入睡眠状态等待任务执行完毕，当上一个线程的任务执行完毕，下一个线程会自动唤醒然后执行任务。
//自旋锁：当上一个线程的任务没有执行完毕的时候（被锁住），那么下一个线程会一直等待（不会睡眠），当上一个线程的任务执行完毕，下一个线程会立即执行。

//- (void)setProp:(NSString *)newValue {
//    [_prop lock];
//    _prop = newValue;
//    [_prop unlock];
//}

//- (void)setLock:(YLLock *)lock {
//    
//    [_lock lock];
//    
//}

//按我理解：
//1.此处的线程安全是就getter,setter而言的。比如对于@property(nonatomic,copy)NSString *str; 当调用self.str = @"HELLO,GUY";如果是多线程，在一个线程执行setter方法的时候，会涉及到字符串拷贝，另一个线程去读取，很可能读到一半的数据，也就是garbage数据。
//2.另外的话，它也仅限于getter,setter时的线程安全。比如@property(atomic,strong)NSMutableArray *arr;如果一个线程循环读数据，一个线程循环写数据，肯定会产生内存问题。因为它和setter,getter没有关系。

@end
