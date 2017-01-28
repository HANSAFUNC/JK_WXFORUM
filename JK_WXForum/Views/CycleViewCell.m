//
//  CycleViewCell.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/22.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "CycleViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "maxCycleModel.h"

@interface CycleViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *cycleImage;

@end

@implementation CycleViewCell


-(void)setMaxCycleModel:(maxCycleModel *)maxCycleModel {
    _maxCycleModel = maxCycleModel;
    [UIView transitionWithView:self.contentView duration:1.0 options: UIViewAnimationOptionTransitionFlipFromTop  animations:^{
        [_cycleImage sd_setImageWithURL:[NSURL URLWithString:maxCycleModel.src]];
    } completion:nil];
    
    
    
}

@end
