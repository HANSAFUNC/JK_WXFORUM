//
//  NetSchoolRequest.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/27.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "NetSchoolRequest.h"
#import "NetWorkSingleton.h"
#import "GeneralModel.h"
#import <MJExtension/MJExtension.h>

@implementation NetSchoolRequest

-(void)loadNetSchoolDataSourceHandleCompleteBlock:(void(^)())completeCallBack {
    [NetWorkSingleton requestData:GET requestUrl:@"http://api.pyua.net/?v=1&module=schoolguide&page=" parameters:nil finlishCallBack:^(id responseObject, NSError *error) {
        NSArray * tempArr = responseObject[@"variables"][@"data"];
        _netSchoolModels  = [GeneralModel mj_objectArrayWithKeyValuesArray: tempArr];
        if (error) {
            NSLog(@"%@",error);
        }
        if (completeCallBack) {
            completeCallBack();
        }
        
        
    }];
    
}
- (void)cancel {
    [[NetWorkSingleton extensionContentTypeManager].tasks makeObjectsPerformSelector:@selector(cancel)];
}
- (void)pasue {
    [[NetWorkSingleton extensionContentTypeManager].tasks makeObjectsPerformSelector:@selector(pasue)];
}
- (void)resume {
    [[NetWorkSingleton extensionContentTypeManager].tasks makeObjectsPerformSelector:@selector(resume)];
}
@end
