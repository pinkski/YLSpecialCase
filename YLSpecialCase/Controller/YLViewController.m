
//
//  YLViewController.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/7/20.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLViewController.h"

@implementation YLViewController

//当我们用到控制器view时，就会调用控制器view的get方法，在get方法内部，首先判断view是否已经创建，如果已存在，则直接返回存在的view，如果不存在，则调用控制器的loadView方法，在控制器没有被销毁的情况下，loadView也可能会被执行多次
- (void)loadView {
    
    //
}

- (void)viewDidLoad {

    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
}

// 1,重写loadView方法，则会根据重写的loadView方法创建view
// 2,控制器通过storyboard加载，则根据storyboard的描述创建view
// 3,控制器view通过xib加载，则根据nibName对应的xib创建view
// 4,没有指定nibName，则根据与控制器同名的xib创建view
// 5,没有同名的xib，则根据与控制器名前缀相同不带controller的xib创建view
// 6,如果都没有，则创建一个空白的xib

// storyboard加载的是控制器及控制器view，而xib加载的仅仅只是控制器的view。

@end
