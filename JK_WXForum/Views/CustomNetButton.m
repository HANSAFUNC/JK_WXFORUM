//
//  CustomNetButton.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/27.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "CustomNetButton.h"

@implementation CustomNetButton

-(void)setHighlighted:(BOOL)highlighted {}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    if ([self superview].tag == 1111) {
        self.titleLabel.frame = CGRectMake(0, HEIGHT(self), WIDTH(self), 20);
        self.imageView.frame = CGRectMake(0, 0, 35, 35);
        self.imageView.center = CGPointMake(WIDTH(self) * 0.5, JKMinY(self.titleLabel)-22.5);
    }else {
        self.imageView.frame = CGRectMake(0, 0, 20, 20);
        self.imageView.center = CGPointMake(WIDTH(self) * 0.5, 15);
        self.titleLabel.frame = CGRectMake(0, JKMaxY(self.imageView)+5, WIDTH(self), 20);
        
    }
    
}

@end
