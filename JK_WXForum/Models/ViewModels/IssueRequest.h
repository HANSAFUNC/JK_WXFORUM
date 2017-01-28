//
//  IssueRequest.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequest.h"
@interface IssueRequest :BaseRequest
@property (nonatomic ,strong) NSArray * issueModels;

-(void)loadIssueAllDataSourceHandleCompleteBlock:(void(^)())completeCallBack;
-(void)loadIssueHotDataSourceHandleCompleteBlock:(void(^)())completeCallBack;
@end
