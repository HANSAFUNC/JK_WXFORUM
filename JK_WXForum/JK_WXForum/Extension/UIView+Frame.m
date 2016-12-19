//
//  UIView+Frame.m
//
//  Created by jackey_gjt on 16/8/3.
//  Copyright © 2016年 郭健滔. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)



-(void)setJk_x:(CGFloat)jk_x
{
    CGRect frame =self.frame;
    frame.origin.x =jk_x;
    self.frame =frame;
}

-(CGFloat)jk_x
{
    return self.frame.origin.x;
}

-(CGFloat)jk_y
{
    return  self.frame.origin.y;
}

-(void)setJk_y:(CGFloat)jk_y
{
    CGRect frame =self.frame;
    frame.origin.y =jk_y;
    self.frame =frame;
}

-(void)setJk_width:(CGFloat)jk_width
{
    CGRect frame =self.frame;
    frame.size.width =jk_width;
    self.frame =frame;
}
-(CGFloat)jk_width
{
    return self.frame.size.width;
}

-(void)setJk_height:(CGFloat)jk_height
{
    CGRect frame =self.frame;
    frame.size.height =jk_height;
    self.frame =frame;
}

-(CGFloat)jk_height
{
    return self.frame.size.height;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center =self.center;
    center.x =centerX;
    self.center =center;
}

-(CGFloat)centerX
{
    return self.center.x;
}
-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center =self.center;
    center.y =centerY;
    self.center =center;

    
}

-(CGFloat)centerY
{
    return self.center.y;
}

@end
