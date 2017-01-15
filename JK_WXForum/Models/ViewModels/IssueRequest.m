//
//  IssueRequest.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "IssueRequest.h"
#import "NetWorkSingleton.h"
#import <MJExtension/MJExtension.h>
#import "IssueModel.h"

@implementation IssueRequest

-(void)loadIssueAllDataSourceHandleCompleteBlock:(void(^)())completeCallBack {
    [NetWorkSingleton requestData:GET requestUrl:@"http://api.pyua.net/?v=1&module=doing&doid=&filter=&page=1&view=all" parameters:nil finlishCallBack:^(id responseObject, NSError *error) {
        NSArray * tempArr = responseObject[@"variables"][@"list"];
        _issueModels  = [IssueModel mj_objectArrayWithKeyValuesArray:tempArr];
        if (error) {
            NSLog(@"%@",error);
        }
        if (completeCallBack) {
            completeCallBack();
        }
        
    }];
    
}

-(void)loadIssueHotDataSourceHandleCompleteBlock:(void(^)())completeCallBack {
    [NetWorkSingleton requestData:GET requestUrl:@"http://api.pyua.net/?v=1&module=doing&doid=&filter=heat&page=1&view=all" parameters:nil finlishCallBack:^(id responseObject, NSError *error) {
        NSArray * tempArr = responseObject[@"variables"][@"list"];
        _issueModels  = [IssueModel mj_objectArrayWithKeyValuesArray:tempArr];
        if (error) {
            NSLog(@"%@",error);
        }
        if (completeCallBack) {
            completeCallBack();
        }
        
    }];
    
}

@end
