//
//  ZZQCommentTableViewCell.m
//  FItBodyMerchant
//
//  Created by ben on 17/5/16.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQCommentTableViewCell.h"

@interface ZZQCommentTableViewCell ()

@property(nonatomic, strong)ZZQComments * comment;
//用户头像
@property(nonatomic, strong)UIImageView * userPic;
//用户名
@property(nonatomic, strong)UILabel * userNameLabel;
//菜品名称
@property(nonatomic, strong)UILabel * menuLabel;
//是否评论过了
@property(nonatomic, strong)UILabel * isCommand;

@end

@implementation ZZQCommentTableViewCell


- (void)initForCell{
    _userPic = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
    _userPic.layer.cornerRadius = _userPic.width/2;
    _userPic.layer.masksToBounds = YES;
    _userPic.image = [UIImage imageWithData:_comment.portrait];
    [self.contentView addSubview:_userPic];
    
    _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 150, 60)];
    _userNameLabel.font = [UIFont systemFontOfSize:18];
    _userNameLabel.text = _comment.userName;
    [self.contentView addSubview:_userNameLabel];
    
    _menuLabel = [[UILabel alloc] initWithFrame:CGRectMake(_userNameLabel.origin.x, CGRectGetMaxY(_userPic.frame), 120, 25)];
    _menuLabel.font = [UIFont systemFontOfSize:16];
    _menuLabel.text = _comment.menuNames;
    [self.contentView addSubview:_menuLabel];
    
    _isCommand = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-80, _menuLabel.origin.y, 60, 20)];
    _isCommand.font = [UIFont systemFontOfSize:14];
    _isCommand.layer.cornerRadius = 3;
    _isCommand.layer.masksToBounds = YES;
    _isCommand.textAlignment = NSTextAlignmentCenter;
    if ([_comment.storeReturn isEqualToString:@"感谢您的光临！"]) {
        _isCommand.backgroundColor = [UIColor colorWithRed:0.97 green:0.36 blue:0.33 alpha:1.00];
        _isCommand.textColor = [UIColor whiteColor];
        _isCommand.text = @"未评价";
    }else{
        _isCommand.backgroundColor = [UIColor colorWithRed:0.00 green:0.57 blue:0.00 alpha:1.00];
        _isCommand.textColor = [UIColor whiteColor];
        _isCommand.text = @"已评价";
    }
    [self.contentView addSubview:_isCommand];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIView * view in [self.contentView subviews]) {
        [view removeFromSuperview];
    }
    [self initForCell];
}

- (void)setCellForComment:(ZZQComments *)comment{
    _comment = comment;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [UIView animateWithDuration:0.4 animations:^{
        self.backgroundColor = selected?[UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.00]:[UIColor whiteColor];
    }];
}

@end
