//
//  GeneralModel.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "GeneralModel.h"

@implementation GeneralModel


-(CGFloat)cellH
{
    if (self.attachimg.count) {
        return 200;
    }else {
        return 100;
    }
}
@end
