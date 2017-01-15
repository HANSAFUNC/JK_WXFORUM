//
//  MidImageView.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "MidImageView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation MidImageView
//imgurl
-(void)setImages:(NSArray *)images {
    _images = images;
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger totalcoumls = 3;
    CGFloat margin = 10;
    for (int i = 0; i < images.count; i++) {
        UIImageView * image = [[UIImageView alloc]init];
        [image sd_setImageWithURL:[NSURL URLWithString:images[0][@"imgurl"]] placeholderImage:[UIImage imageNamed:@"photo-2"]];
        NSUInteger cols = i % totalcoumls;
        CGFloat w =(WIDTH(self) - (images.count - 1) * margin) / images.count;
        
        if (images.count < totalcoumls) {
            w =(WIDTH(self) - (3 - 1) * margin) / 3;
        }
        CGFloat h = w;
        CGFloat x = cols * (w + margin);
        
        if (images.count == 1) {
            h = HEIGHT(self);
            w = WIDTH(self);
        }
        image.frame = CGRectMake(x, 0, w, h);
        [self addSubview:image];
    
}

}



@end
