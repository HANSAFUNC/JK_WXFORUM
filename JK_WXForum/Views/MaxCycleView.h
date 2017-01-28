//
//  MaxCycleView.h
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/22.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaxCycleView : UIView
@property (nonatomic ,strong) NSArray * maxCycleModels;
+(instancetype)loadXib;
-(void)startTimer;
-(void)stopTimer;

@end
