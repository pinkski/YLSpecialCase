//
//  YLSwizzling.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/14.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLSwizzling.h"
#import <objc/runtime.h>

@implementation YLSwizzling

- (void)doReplace {
    
    SEL oldSelector = @selector(oldFunction);
    SEL newSelector = @selector(newFunction);
    
    Method oldMethod = class_getInstanceMethod([self class], oldSelector);
    Method newMethod = class_getInstanceMethod([self class], newSelector);
    
    BOOL success = class_addMethod([self class], oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    
    if (success) {
        
        class_replaceMethod([self class], oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        
    } else {
        
        method_exchangeImplementations(oldMethod, newMethod);
    }
    
    
}


- (void)oldFunction {
    
    NSLog(@"super oldFunction");
}


- (void)newFunction {
    
    NSLog(@"super newFunction");
}

@end
