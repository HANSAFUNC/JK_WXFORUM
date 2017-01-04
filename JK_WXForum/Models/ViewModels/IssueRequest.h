//
//  IssueRequest.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IssueRequest : NSObject
@property (nonatomic ,strong) NSArray * issueModels;

-(void)loadIssueDataSourceHandleCompleteBlock:(void(^)())completeCallBack;
@end
