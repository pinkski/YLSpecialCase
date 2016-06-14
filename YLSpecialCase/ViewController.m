//
//  ViewController.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/1/11.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "ViewController.h"
#import "YLTableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.tableViewCellBlock = ^(void){
        
        NSLog(@"点击了2");
        
        
        
    };
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击了");
}

@end
