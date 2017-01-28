//
//  NetWorkSingleton.m
//
//  Created by jackey_gjt on 16/8/22.
//  Copyright © 2016年 郭健滔. All rights reserved.
//

#import "NetWorkSingleton.h"
#import <AFNetworking.h>
#import <MJExtension/MJExtension.h>

@interface NetWorkSingleton ()

//@property (nonatomic ,strong) progressBlock progressBlock ;
//@property (nonatomic ,strong) successBlock successBlock;

@end

@implementation NetWorkSingleton

implementationSingleton(NetWorkSingleton)


+ (NetWorkSingleton *)sharedManager {
    
    static NetWorkSingleton * instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc]init];
        instance.requestSerializer.timeoutInterval = 5;
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    });
    
    
    return instance;
}

///+ (NetWorkSingleton *)extensionContentTypeManager {
//
//    NetWorkSingleton * manager = [NetWorkSingleton shareNetWorkSingleton];
//
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
//    manager.requestSerializer.timeoutInterval = 5;
//
//    return manager;
//
//}

+ (void)requestData:(RequestType)type requestUrl:(NSString *)requestUrl parameters:(NSDictionary *)parameters  finlishCallBack:(void(^)(id responseObject,NSError *  error))finlishCallBack {
    
    NetWorkSingleton * manager = [self sharedManager];
    
    if (type == GET) {
        
        [manager GET:requestUrl parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (responseObject) {
                
                finlishCallBack(responseObject,nil);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error) {
                
                finlishCallBack(nil,error);
            }
        }];
        
    }
    
    if (type == POST) {
        
        [manager POST:requestUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (responseObject) {
                finlishCallBack(responseObject,nil);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            finlishCallBack(nil,error);
            
        }];
    }
}


NSString * AFStringFromCurrentNetworkStatus(AFNetworkReachabilityStatus status) {
    switch (status) {
        case AFNetworkReachabilityStatusNotReachable:
            return @"没有网络";
        case AFNetworkReachabilityStatusReachableViaWWAN:
            return @"蜂窝网络";
        case AFNetworkReachabilityStatusReachableViaWiFi:
            return @"WIFI网络";
        case AFNetworkReachabilityStatusUnknown:
        default:
            return @"未知错误";
    }
}
/**
 *  只要用户的网络发生改变就开始监听
 *
 AFNetworkReachabilityStatusUnknown          = 不能识别,
 AFNetworkReachabilityStatusNotReachable     = 没有网络,
 AFNetworkReachabilityStatusReachableViaWWAN = 蜂窝网,
 AFNetworkReachabilityStatusReachableViaWiFi = 局域网,
 *
 *  @return 网络状态字符
 */
- (NSString *)currentNetworkReachabilityStatusString {
    
    __block NSString * stateString;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                stateString = AFStringFromCurrentNetworkStatus(AFNetworkReachabilityStatusReachableViaWWAN);
                NSLog(@"蜂窝网");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                stateString = AFStringFromCurrentNetworkStatus(AFNetworkReachabilityStatusReachableViaWiFi);
                NSLog(@"局域网");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                stateString = AFStringFromCurrentNetworkStatus(AFNetworkReachabilityStatusNotReachable);
                NSLog(@"没有网络");
                break;
            default:
                stateString = AFStringFromCurrentNetworkStatus
                (AFNetworkReachabilityStatusUnknown);
                NSLog(@"不能识别");
                break;
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    return stateString;
    
}


@end
