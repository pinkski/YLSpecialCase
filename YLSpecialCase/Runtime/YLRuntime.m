//
//  YLRuntime.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/15.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLRuntime.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <objc/objc.h>
#import <objc/NSObject.h>

@implementation YLRuntime

- (void)run {
    
    // msgSend
    
    NSMutableArray *array = @[].mutableCopy;
    [array insertObject:@"你好" atIndex:0];
    
//    objc_msgSend(array, @selector(insertObject:atIndex:), @"hello", 0);
    
//    objc_object; objc_class; objc_method;  都是C语言的结构体
    
    // objc_object => isa指针  指向class 的 instance
    // objc_class => isa指针 、 ivarList 、 methodList 、 cache 、 protocalList
    // objc_method = >  SEL  、  Type Encodiing  、 IMP
    
    // objc_msgSend(); => 通过objc_object的isa -> objc_class -> cacha是否有objc_method -> 如果没有 -> methodList -> superClass methodList -> IMP
    
    // unrecognized selector sent to  三次拯救机会：1,method resolution ； 2，Fast forwarding 3, Normal forwarding
    
    
    
}


void fooMethod(id obj, SEL _cmd) {
    
    NSLog(@"Doing foo");
}


/// 1, resolve
+ (BOOL)resolveInstanceMethod:(SEL)aSEL {
    
    IMP fooIMP = imp_implementationWithBlock(^(id _self){
        
        NSLog(@"Doing foo");
    });
    
    if(aSEL == @selector(foo:)){
        class_addMethod([self class], aSEL, (IMP)fooMethod, "v@:");
        return YES;
    }
    
    return NO;
}

// 2, fast forwarding
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(foo:)) {
//        return alternateObject;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

// 3, normal forwarding
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
//        signature =  [alternateObject methodSignatureForSelector:selector];
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    SEL sel = anInvocation.selector;
    
//    if ([alternateObject respondsToSelector:sel]) {
//
//        [invocation invokeWithTarget:alternateObject];
//    } else {
//        
//        [self doesNotRecognizeSelector:sel];
//    }
}

// 总结
// 1,去找函数，如果找到了 执行IMP
// 2,没找到， resolve -> NO ; forwardingTarget -> nil; methodSignature + forwardInvocation -> invocateWithTarget



@end
