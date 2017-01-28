//
//  GeneralRequestVM.h
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequest.h"
@interface GeneralRequestVM : BaseRequest
@property (nonatomic ,strong) NSArray * GeneralModels;
@property (nonatomic ,strong) NSArray * navigationModels;
@property (nonatomic ,strong) NSArray * maxCycleModels;

- (void)loadGeneralDataFinshedCallBack:(void(^)())finshedCallBack;
- (void)loadNetSchoolDataSourceHandleCompleteBlock:(void(^)())completeCallBack;

@end
