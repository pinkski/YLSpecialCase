//
//  YLRunloopViewController.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/8/4.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLRunloopViewController.h"

@interface YLRunloopViewController()

@property (nonatomic, strong) NSPort *port;
@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, assign) BOOL shouldKeepRunning;

@end

@implementation YLRunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self runLoopTest];
    
}

- (void)memoryTest {
    
    for (int i = 0; i < 10000; i++) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
        [thread start];
        [thread performSelector:@selector(stopThread) onThread:thread withObject:nil waitUntilDone:YES];
    }
}

- (void)stopThread {
    
    CFRunLoopStop(CFRunLoopGetCurrent());
    NSThread *thread = [NSThread currentThread];
    [thread cancel];
}

- (void)run {
    
    @autoreleasepool {
        NSLog(@"current thread = %@", [NSThread currentThread]);
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        if (self.port) {
            self.port = [NSMachPort port];
        }
        [runloop addPort:self.port forMode:NSDefaultRunLoopMode];
        CFRunLoopRun();
    }
}

- (void)runLoopTest {
    
    UIButton *stopButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [stopButton setTitle:@"Stop Timer" forState:UIControlStateNormal];
    [stopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:stopButton];
    [stopButton addTarget:self action:@selector(stopButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(singleThread) object:nil];
    [self.thread start];
    [self.thread performSelector:@selector(printSomething) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)singleThread {
    
    @autoreleasepool {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        if (!self.port) {
            self.port = [NSMachPort port];
        }
        [runLoop addPort:self.port forMode:NSDefaultRunLoopMode];
        CFRunLoopRun();
    }
}

- (void)printSomething {
    NSLog(@"current thread = %@", [NSThread currentThread]);
    [self performSelector:@selector(printSomething) withObject:nil afterDelay:1];

}

- (IBAction)stopButtonDidClicked:(id)sender {
    [self performSelector:@selector(stopRunloop) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)stopRunloop {
    CFRunLoopStop(CFRunLoopGetCurrent());
}


@end
