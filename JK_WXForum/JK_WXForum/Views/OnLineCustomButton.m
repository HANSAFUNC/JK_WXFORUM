//
//  OnLineCustomButton.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/21.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "OnLineCustomButton.h"

@implementation OnLineCustomButton

-(void)setHighlighted:(BOOL)highlighted
{
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.bounds = CGRectMake(0, 0, 40, 40);
    self.titleLabel.bounds = CGRectMake(0, 0, 60, HEIGHT(self));
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 150);
}

@end
