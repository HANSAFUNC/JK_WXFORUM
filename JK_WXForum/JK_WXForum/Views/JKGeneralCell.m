//
//  JKGeneralCell.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKGeneralCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "GeneralModel.h"

@interface JKGeneralCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiemAndAnswerLabel;

@end

@implementation JKGeneralCell


-(void)setGeneralModel:(GeneralModel *)generalModel {
    _generalModel = generalModel;
    NSString * imageUrl = [NSString stringWithFormat:@"http://bbs.pyua.net/uc_server/avatar.php?uid=%@",generalModel.authorid];
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    _userNameLabel.text = generalModel.author;
    _titleLabel.text = generalModel.subject;
    _contentLabel.text = generalModel.message;
    _typeLabel.text = generalModel.forumname;
    _tiemAndAnswerLabel.text =[NSString stringWithFormat:@"%@/%@回复",generalModel.dateline,generalModel.replies];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _iconImage.layer.cornerRadius = WIDTH(_iconImage) * 0.5;
    _iconImage.layer.masksToBounds = YES;
    
}

@end
