//
//  UIViewController+Swizzling.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/15.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)

void (gOriginalViewDidAppear)(id, SEL, BOOL);

+ (void)load {
    
    //1, method swizzling
    swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));

    //2, exchange IMP
//    Method originalMethod = class_getInstanceMethod(self, @selector(viewDidAppear:));
//    gOriginalViewDidAppear = (void *)method_getImplementation(originalMethod);
//    
//    if(!class_addMethod(self, @selector(viewDidAppear:), (IMP) newViewDidAppear, method_getTypeEncoding(originalMethod))) {
//        method_setImplementation(originalMethod, (IMP) newViewDidAppear);
//    }}
}


/// 调用viewDidAppear，实际执行swizzled_viewDidAppear; 调用swizzled_viewDidAppear实际调用viewDidAppear。
- (void)swizzled_viewDidAppear:(BOOL)animated {
    
    [self swizzled_viewDidAppear:animated];
    
    NSLog(@"日志：view did appear");   //add to log, 达到了日志的目的
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddSuccess = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddSuccess) {
        
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



void newViewDidAppear (UIViewController *self, SEL _cmd, BOOL aniamted) {
    
    gOriginalViewDidAppear(self, _cmd, aniamted);
    
    NSLog(@"日志：记录一次");
}


@end
