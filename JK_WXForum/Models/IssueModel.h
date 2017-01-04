//
//  IssueModel.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/4.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IssueModel : NSObject

@property (nonatomic ,assign) CGFloat cellH;
@property (nonatomic ,assign) CGRect  topViewFrame;
@property (nonatomic ,assign) CGRect  midImageFrame;
@property (nonatomic ,assign) CGRect  bottomViewFrame;

//头像url
@property (nonatomic, strong) NSString * avatar;
//评论内容
@property (nonatomic, strong) NSArray * clist;
//消息时间
@property (nonatomic, strong) NSString * dateline;
@property (nonatomic, strong) NSString * doid;
@property (nonatomic, strong) NSString * from;
//
@property (nonatomic, strong) NSString * grouptitle;
@property (nonatomic, strong) NSString * ifdel;
//图片列表
@property (nonatomic, strong) NSArray * imagelist;
//大图
@property (nonatomic, strong) NSArray * imagelistBig;
//小图
@property (nonatomic, strong) NSArray * imagelistSmall;
//发消息的ip
@property (nonatomic, strong) NSString * ip;
//赞
@property (nonatomic, strong) NSString * likenum;
//内容
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * mylike;
//端口
@property (nonatomic, strong) NSString * port;
//评论数
@property (nonatomic, strong) NSString * replynum;

@property (nonatomic, strong) NSString * status;
//时间轴
@property (nonatomic, strong) NSString * timestamp;
//用户ID
@property (nonatomic, strong) NSString * uid;
//用户名
@property (nonatomic, strong) NSString * username;




@end
