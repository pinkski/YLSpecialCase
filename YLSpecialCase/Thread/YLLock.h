//
//  YLLock.h
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/26.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLLock : NSObject

@property (nonatomic, assign) int count;

- (void)run;

@end
