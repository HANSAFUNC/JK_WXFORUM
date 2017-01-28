//
//  WebRequest.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/12.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "WebRequest.h"
#import "NetWorkSingleton.h"
#import <MJExtension.h>
#import "webModel.h"

@implementation WebRequest

- (void)loadHybridWebDataFormJavaScriptRequestTid:(NSString *)tid HandleCompleteBlock:(void(^)())completeCallBack {
    NSString * url = [NSString stringWithFormat:@"http://api.pyua.net/?v=1&module=viewthread&token=02415ZLm5ZFr9zeuCgsuV7UQ0Uw5zxh4HAAJRhT0HlURkJ0TzGYVGwDBZKfmAFnwgrTyuTzQo09qfsZDdmNHM2DlyhLsgSwVq05pdU0&authorid=&page=1&tid=%@",tid];
    
    [NetWorkSingleton requestData:GET requestUrl:url parameters:nil finlishCallBack:^(id responseObject, NSError *error) {
        NSDictionary * dict = responseObject[@"variables"][@"thread"];
        NSArray * arr = responseObject[@"variables"][@"postlist"];
        
        _webModel = [webModel mj_objectWithKeyValues:dict];
        _postList = arr;
        
        if (error) {
            NSLog(@"%@",error);
        }
        if (completeCallBack) {
            completeCallBack();
        }
        
    }];
}

@end
