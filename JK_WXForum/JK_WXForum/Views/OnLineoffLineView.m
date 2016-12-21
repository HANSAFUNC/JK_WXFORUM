//
//  OnLineoffLineView.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/21.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "OnLineoffLineView.h"
#import "OnLineCustomButton.h"

const static CGFloat kOnlineViewHeight = 60;
@implementation OnLineoffLineView


-(void)willMoveToSuperview:(UIView *)newSuperview{
    
    int totalCols = 2;
    for (int i = 0; i < 2; i++) {
        NSUInteger cols = i % totalCols;
        CGFloat w =  JKSreenW / 2;
        CGFloat x = cols * JKSreenW / 2;
        OnLineCustomButton * btn = [OnLineCustomButton buttonWithType:UIButtonTypeCustom];
        if (i == 0) {
            [btn setTitle:@"线上活动" forState:0];
            [btn setImage:[UIImage imageNamed:@"线上"] forState:0];
        }
        if (i == 1) {
            [btn setTitle:@"线下活动" forState:0];
            [btn setImage:[UIImage imageNamed:@"线下"] forState:0];
        }
        [btn setTitleColor:JKColor_RGB(0, 0, 0) forState:0];
        btn.frame = CGRectMake(x, 10, w, kOnlineViewHeight);
        btn.backgroundColor = [UIColor whiteColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [self addSubview:btn];
    }
    UIView * midLine = [[UIView alloc]init];
    midLine.frame = CGRectMake(JKSreenW / 2 - 0.5, 20, 1, 40);
    midLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:midLine];
}



@end
