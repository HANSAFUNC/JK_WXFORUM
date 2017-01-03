//
//  NetWorkSingleton.h
//
//  Created by jackey_gjt on 16/8/22.
//  Copyright © 2016年 郭健滔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "Singleton.h"
typedef enum : NSUInteger {
    GET,
    POST,
    
} RequestType;

typedef void(^progressBlock)(NSProgress *  downloadProgress);
typedef void(^successBlock)(NSURLSessionDataTask *  task, id  responseObject);
typedef void(^failureBlock)(NSURLSessionDataTask *  task, NSError *  error);
typedef void(^finlishCallBack)(id result, NSError *  error);

@interface NetWorkSingleton : AFHTTPSessionManager

+ (NetWorkSingleton *)sharedManager;

//interfaceSingleton(NetWorkSingleton);

//+ (NetWorkSingleton *)extensionContentTypeManager;

+ (void)requestData:(RequestType)type requestUrl:(NSString *)requestUrl parameters:(NSDictionary *)parameters  finlishCallBack:(void(^)(id responseObject,NSError *  error))finlishCallBack;


@end
