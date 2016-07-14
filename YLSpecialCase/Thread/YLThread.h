//
//  YLThread.h
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/14.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLThread : NSObject

- (void)runSynchronized;

- (void)runSemaphore;

- (void)runLock;

- (void)runMutex;

@end
