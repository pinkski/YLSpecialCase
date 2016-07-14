//
//  YLTableViewCell.m
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/1/11.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "YLTableViewCell.h"

@interface YLTableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation YLTableViewCell

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    if (self.tableViewCellBlock) {
        self.tableViewCellBlock();
    }
}

@end
