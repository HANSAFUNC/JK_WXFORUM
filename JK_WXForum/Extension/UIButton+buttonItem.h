//
//  UIButton+buttonItem.h
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (buttonItem)

+ (UIButton *)buttonWithImage:(UIImage * )image hightLightImage:(UIImage * )hightLightImage addTarget:(id)target action:(SEL)action;
@end
