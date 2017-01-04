//
//  BottomLikeView.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "BottomLikeView.h"

@implementation BottomLikeView


+ (instancetype)viewForXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

@end
