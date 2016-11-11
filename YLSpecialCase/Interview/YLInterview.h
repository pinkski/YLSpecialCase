//
//  YLInterview.h
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/10/11.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/objc.h>

@interface YLInterview : NSObject

// property本质： ivar + getter + setter
// 反编译后： offset(偏移量)  getter+setter  ivarlist  methodlist  proplist

@property NSString *name;


@end
