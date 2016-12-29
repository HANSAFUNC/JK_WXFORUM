//
//  JKCustomButton.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "JKCustomButton.h"

@implementation JKCustomButton



-(void)setHighlighted:(BOOL)highlighted{}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
    
    self.imageView.frame = CGRectMake(self.bounds.origin.x,HEIGHT(self) * 0.5 , WIDTH(self), HEIGHT(self) * 0.5);
    
}
@end
