//
//  YLSynchronized.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/27.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLSynchronized.h"

@interface YLSynchronized()

@property (nonatomic, assign) int seat; ///<座位数

@end

@implementation YLSynchronized


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.seat = 15;
    
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
            
            if (self.seat > 0) {
                
                NSLog(@"预定了座位%li --- %@", (long)self.seat, [NSThread currentThread]);
                self.seat--;
            } else {
                
                NSLog(@"没有座位了 --- %@", [NSThread currentThread]);
                break;
            }
        }
        
        
    }
}

// 总结：锁能加到任意NSObject对象，但是一定是所有线程都可访问到，锁的范围越大效率越差



@end
