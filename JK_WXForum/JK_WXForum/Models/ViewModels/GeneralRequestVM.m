//
//  GeneralRequestVM.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "GeneralRequestVM.h"
#import "NetWorkSingleton.h"
#import "MJExtension.h"
#import "GeneralModel.h"
#import "maxCycleModel.h"

@implementation GeneralRequestVM

- (void)loadGeneralDataFinshedCallBack:(void(^)())finshedCallBack{
    
    [NetWorkSingleton requestData:GET requestUrl:@"http://api.pyua.net/?v=1&module=forumguide&page=1" parameters:nil finlishCallBack:^(id responseObject, NSError *error) {
        NSArray * tempArr = responseObject[@"variables"][@"data"];
        NSArray * tempArrCyc = responseObject[@"variables"][@"slideshow"];
        _navigationModels = responseObject[@"variables"][@"navigation"];
        _maxCycleModels = [maxCycleModel mj_objectArrayWithKeyValuesArray: tempArrCyc];
       _GeneralModels  = [GeneralModel mj_objectArrayWithKeyValuesArray: tempArr];
//        NSLog(@"%@",_maxCycleModels[1]);
        finshedCallBack();
        
    }];
}

@end
