//
//  NetSchoolRequest.h
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/27.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetSchoolRequest : NSObject
@property (nonatomic ,strong) NSArray * netSchoolModels;
- (void)loadNetSchoolDataSourceHandleCompleteBlock:(void(^)())completeCallBack;
- (void)cancel;
- (void)pasue;
- (void)resume;
@end
