//
//  UIButton+buttonItem.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "UIButton+buttonItem.h"

@implementation UIButton (buttonItem)

+(UIButton *)buttonWithImage:(nullable UIImage * )image hightLightImage:(nullable UIImage * )hightLightImage addTarget:(id)target action:(SEL)action
{
    UIButton *nightModelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nightModelBtn sizeToFit];
    if (image) {
        [nightModelBtn setImage:image forState:UIControlStateNormal];
    }
    
    if (hightLightImage) {
        [nightModelBtn setImage:hightLightImage forState:UIControlStateHighlighted];
    }
    
    [nightModelBtn addTarget:target  action:action forControlEvents:UIControlEventTouchUpInside];
    return nightModelBtn;
}

@end
