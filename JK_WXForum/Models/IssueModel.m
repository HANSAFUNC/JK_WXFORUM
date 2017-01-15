//
//  IssueModel.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "IssueModel.h"

@implementation IssueModel

-(CGFloat)cellH {
    CGFloat orginH = 50 + 10;
    NSDictionary * dict = @{NSFontAttributeName : [UIFont systemFontOfSize:16.0]};
    CGFloat textW = JKScreenW - 50 -15;
    CGFloat textH = [self.message boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.height;
    _topViewFrame = CGRectMake(0, 0, JKScreenW, textH + orginH);
    
    CGFloat bottomY;
    if (_imagelist.count) {
        CGFloat midMargin = 60;
        CGFloat midY = CGRectGetMaxY(_topViewFrame) + 10;
        if (_imagelist.count == 1) {
            _midImageFrame = CGRectMake(midMargin,midY,JKScreenW - 150,100);
        }
        if (_imagelist.count > 1) {
            _midImageFrame = CGRectMake(midMargin,midY,180 ,40);
        }
        if (_imagelist.count > 3) {
            _midImageFrame = CGRectMake(midMargin,midY,180,90);
        }
        if (_imagelist.count > 6) {
            _midImageFrame = CGRectMake(midMargin,midY,180,140);
        }
         bottomY = CGRectGetMaxY(_midImageFrame) + 10;
    }else {
         bottomY = CGRectGetMaxY(_topViewFrame) + 10;
    }
    
    
    _bottomViewFrame = CGRectMake(60,bottomY ,textW , 25);
    
    
    return CGRectGetMaxY(_bottomViewFrame);
}
@end
