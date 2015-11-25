//
//  ViewController.m
//  无限滚动
//
//  Created by a on 15/11/25.
//  Copyright (c) 2015年 YongChaoAn. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "ANNews.h"
#import "ANNewsCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *newsArray;
@end

@implementation ViewController

- (NSArray *)newsArray
{
    if (!_newsArray) {
        _newsArray = [ANNews objectArrayWithFilename:@"newses.plist"];
    }
    return _newsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 注册
    [self.collectionView registerNib:[UINib nibWithNibName:@"ANNewsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"news"];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2500 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
         return self.newsArray.count * 1000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"news";
    ANNewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.news = self.newsArray[indexPath.item % self.newsArray.count];
    
    return cell;
}


@end
