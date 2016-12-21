//
//  GeneralRequestVM.h
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeneralRequestVM : NSObject
@property (nonatomic ,strong) NSArray * GeneralModels;
@property (nonatomic ,strong) NSArray * navigationModels;
- (void)loadGeneralDataFinshedCallBack:(void(^)())finshedCallBack;
@end
