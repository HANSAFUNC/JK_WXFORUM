//
//  WebRequest.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/12.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>
@class webModel;
@interface WebRequest : NSObject
@property (nonatomic ,strong) webModel *webModel;
@property (nonatomic ,strong) NSArray *postList;
- (void)loadHybridWebDataFormJavaScriptRequestTid:(NSString *)tid HandleCompleteBlock:(void(^)())completeCallBack;
@end
