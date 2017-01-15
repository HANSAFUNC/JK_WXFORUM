//
//  webModel.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/12.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface webModel : NSObject
//照片
@property (nonatomic, strong) NSArray * attachimg;
@property (nonatomic, strong) NSString * attachment;
@property (nonatomic, strong) NSString * author;
@property (nonatomic, strong) NSString * authorid;
@property (nonatomic, strong) NSString * dateline;
@property (nonatomic, strong) NSString * digest;
@property (nonatomic, strong) NSString * favid;
@property (nonatomic, strong) NSString * favtimes;
@property (nonatomic, strong) NSString * ffupname;
@property (nonatomic, strong) NSString * follow;
@property (nonatomic, strong) NSString * fupname;
@property (nonatomic, strong) NSString * grouptitle;
@property (nonatomic, strong) NSString * heats;
@property (nonatomic, strong) NSString * highlight;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * myratecount;
@property (nonatomic, strong) NSString * pid;
@property (nonatomic, strong) NSString * rate;
@property (nonatomic, strong) NSString * rateLogcount;
@property (nonatomic, strong) NSString * rateNumber;
@property (nonatomic, strong) NSString * replies;
@property (nonatomic, strong) NSString * special;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic, strong) NSString * tid;
//@property (nonatomic, strong) NSString * typeid;
@property (nonatomic, strong) NSString * views;

@end
