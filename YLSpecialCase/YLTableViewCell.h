//
//  YLTableViewCell.h
//  YLSpecialCase
//
//  Created by 张晓岚 on 16/1/11.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TableViewCellBlock)(void);

@interface YLTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *tCollectionView;

@property (strong, nonatomic) TableViewCellBlock tableViewCellBlock;

@end
