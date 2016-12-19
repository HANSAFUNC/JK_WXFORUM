//
//  UIImage+Render.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "UIImage+Render.h"

@implementation UIImage (Render)


+ (UIImage *)renderImageWithNormal:( NSString * _Nonnull )NormalImage{
    
    
    UIImage * resultImage = [[self imageNamed:NormalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return resultImage;
}

@end
