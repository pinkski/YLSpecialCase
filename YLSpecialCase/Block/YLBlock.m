//
//  YLBlock.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/20.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLBlock.h"
#import "YLBlockPerson.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation YLBlock

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    __block int a = 10;
    NSLog(@"a value is %d", a);
    
    void(^blockName)(void) = ^(void) {
        
        a = 20;
    };
    NSLog(@"a value is %d", a);
    blockName();
    NSLog(@"a value is %d", a);
    
    // traversal
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"%s, %s", name, type);
    }
    
    
    YLBlockPerson *person = [YLBlockPerson new];   // strong
    
    //默认是放在栈中，可能会被随时销毁
    void (^blockUser) (void) = ^(void) {
        
        person.userName = @"你好";
    };
    
    [blockUser copy];   //进行一次copy操作，就可以放在堆中了。   // strong
    //用retain没有用的原因：retain只是增加一次计数，block内存还是在栈中，并没有转移到堆中。
    
    //block如果是copy的话，里面使用它所在的类的对象的话，这个对象永远无法被释放。即person对象在堆中是强指针，且person在blockName就在，而blockName指向的代码也在堆中，即它的person.age=20的那些代码也在堆中，而这些代码中有person对象，所以又反过来指向person对象。就这么在相互指向的，永远不能释放。
    
    
}

@end
