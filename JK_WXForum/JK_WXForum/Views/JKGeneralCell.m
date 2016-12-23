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
@property (weak, nonatomic) IBOutlet UIView *PhotoLibriy;

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
    NSLog(@"%@",generalModel.forumname);
    _tiemAndAnswerLabel.text =[NSString stringWithFormat:@"%@/%@回复",generalModel.dateline,generalModel.replies];
    
    if (generalModel.attachimg.count) {
        [_PhotoLibriy.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        _PhotoLibriy.hidden = NO;
        NSInteger totalcoumls = 3;
        CGFloat margin = 8;
        for (int i = 0; i < generalModel.attachimg.count; i++) {
            UIImageView * image = [[UIImageView alloc]init];
            [image sd_setImageWithURL:generalModel.attachimg[i][@"url"] placeholderImage:[UIImage imageNamed:@"photo-2"]];
            NSUInteger cols = i % totalcoumls;
            CGFloat w =(WIDTH(_PhotoLibriy) - (generalModel.attachimg.count - 1) * margin) / generalModel.attachimg.count;
            
            if (generalModel.attachimg.count < totalcoumls) {
                w = (274 - (3 - 1) * margin) / 3;
            }
            CGFloat h = w;
            CGFloat x = cols * (w + margin);
            
            if (generalModel.attachimg.count == 1) {
                h = (274 - (3 - 1) * margin) / 3;
                w = 274 - 70;
            }
            image.frame = CGRectMake(x, 0, w, h);
            [_PhotoLibriy addSubview:image];
            
        }
    }else{
        _PhotoLibriy.hidden = YES;
    }
    
    
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _iconImage.layer.cornerRadius = WIDTH(_iconImage) * 0.5;
    _iconImage.layer.masksToBounds = YES;
    
}

@end
