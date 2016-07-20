//
//  YLOperation.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/20.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLOperation.h"
#import <UIKit/UIKit.h>

@implementation YLOperation

- (void)run {
    
    //1, 基本使用
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
       
        //主线程
    }];
    
    [op addExecutionBlock:^{
        //子线程1
    }];
    
    [op addExecutionBlock:^{
        //子线程2
    }];
    
    [op addExecutionBlock:^{
        //子线程3
    }];
    
    [op start];
    
    // 创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] init];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] init];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        
    }];
    
    [op3 addExecutionBlock:^{
        
    }];
    
    [op3 addExecutionBlock:^{
        
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        
    }];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperation:op4];
    
    //2, 简单方法
    NSOperationQueue *queueZ = [[NSOperationQueue alloc] init];
    [queueZ addOperationWithBlock:^{
        
    }];
    
    //3, 一些属性
    NSOperationQueue *queueQ = [[NSOperationQueue alloc] init];
    queueQ.maxConcurrentOperationCount = 1; // 串行了
    queueQ.suspended = YES;
    [queueQ cancelAllOperations];
    
    //4, 队列组
    
    //5, 队列间通讯
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
       
        //图片网络路径
        NSURL *url = [NSURL URLWithString:@"http://img.pconline.com.cn/images/photoblog/9/9/8/1/9981681/200910/11/1255259355826.jpg"];
        
        // 加载图片
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 生成图片
        UIImage *image = [UIImage imageWithData:data];
        
        // 回主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           
            //self.imageView.image = image;
        }];

    }];
}

@end
