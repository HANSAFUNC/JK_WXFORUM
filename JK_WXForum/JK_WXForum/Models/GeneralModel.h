//
//  GeneralModel.h
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeneralModel : NSObject
/*****
"tid": "36968",
"fid": "172",
"author": "zoey2008",
"authorid": "6836",
"subject": "妈妈种的花花草草",
"dateline": "1小时前",
"views": "3",
"replies": "2",
"forumname": "花草萌宠",
"message": "好久没上无邪了，难得今天有空，赶紧把最近拍的家里的 ..."
 ****/
 
//用户名
@property (nonatomic, strong) NSString * author;
//账户id
@property (nonatomic, strong) NSString * authorid;
//时间轴
@property (nonatomic, strong) NSString * dateline;
//标记id
@property (nonatomic, strong) NSString * fid;
//分类
@property (nonatomic, strong) NSString * forumname;
//内容
@property (nonatomic, strong) NSString * message;
//回复数
@property (nonatomic, strong) NSString * replies;
//标题
@property (nonatomic, strong) NSString * subject;
//帖子数
@property (nonatomic, strong) NSString * tid;
@property (nonatomic, strong) NSString * views;

@end
