//
//  ANNewsCollectionViewCell.m
//  无限滚动
//
//  Created by a on 15/11/25.
//  Copyright (c) 2015年 YongChaoAn. All rights reserved.
//

#import "ANNewsCollectionViewCell.h"
#import "ANNews.h"

@interface ANNewsCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation ANNewsCollectionViewCell

- (void)awakeFromNib
{
    
}

- (void)setNews:(ANNews *)news
{
    _news = news;
    
    self.iconView.image = [UIImage imageNamed:news.icon];
    self.titleLabel.text = news.title;
}

@end
