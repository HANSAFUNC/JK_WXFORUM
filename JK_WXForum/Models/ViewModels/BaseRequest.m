//
//  BaseRequest.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/28.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

- (void)cancel {
    [[NetWorkSingleton sharedManager].tasks makeObjectsPerformSelector:@selector(cancel)];
    
}
- (void)pasue {
    [[NetWorkSingleton sharedManager].tasks makeObjectsPerformSelector:@selector(pasue)];
}
- (void)resume {
    [[NetWorkSingleton sharedManager].tasks makeObjectsPerformSelector:@selector(resume)];
}

-(NSString *)currentNetworkStatusString {
     return  [[NetWorkSingleton sharedManager]currentNetworkReachabilityStatusString];
}

@end
