//
//  WX_Prefix.h
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/20.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#ifndef WX_Prefix_h
#define WX_Prefix_h

#import "UIView+Frame.h"


/**************** Config ****************/
/**
 * 基本URL
 */
#define JK_BaseRequestUrl @"http://api.pyua.net"

#define kWXUdbAppId @"5050"       //web登陆的appid,uauth使用相当于getWebToken

/**************** Macros For Float Compare ****************/
#define MID(x, y, z)                      ( y < x ? x : (z < y ? z : y) )


#define __CALL(x,...) if(x) { x(__VA_ARGS__); }

#if defined(DEBUG)
#define __DBUGAssert(e) \
(__builtin_expect(!(e), 0) ? __assert(#e, __FILE__, __LINE__) : (void)0)
#else
#define __DBUGAssert(e) ((void)0)
#endif

/**************** Macros For iOS version ****************/

#define SystemVersionLessThan(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define iOS7_Adjust_TableViewSeparatorInset(t)  if (!SystemVersionLessThan(@"7.0")) { t.separatorInset = UIEdgeInsetsZero; }

#define JK_DeviecVersion  [UIDevice currentDevice].systemVersion.floatValue



/**************** Macros For UI ****************/
// 获得RGB颜色
#define JKColor_RGB(r, g, b)     [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]
#define JKColor_RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]
#define JKColor_RANDOM [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]



/**
 * 屏幕尺寸
 */
#define JKSreenH [UIScreen mainScreen].bounds.size.height
#define JKSreenW [UIScreen mainScreen].bounds.size.width

/**
 * 机型尺寸
 */
#define iPhone6P (JKScreenH == 736)
#define iPhone6 (JKScreenH == 667)
#define iPhone5 (JKScreenH == 568)
#define iPhone4 (JKScreenH == 480)


#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y

#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define JKMinX(v)                 CGRectGetMinX((v).frame)
#define JKMinY(v)                 CGRectGetMinY((v).frame)

#define JKMidX(v)                 CGRectGetMidX((v).frame)
#define JKMidY(v)                 CGRectGetMidY((v).frame)

#define JKMaxX(v)                 CGRectGetMaxX((v).frame)
#define JKMaxY(v)                 CGRectGetMaxY((v).frame)

/**************** 路径****************/
// 沙盒路径
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**************** 通知 ****************/

/**
 * 通知声明
 */
#define JK_NotifiDec(notification) extern NSString * const notification

/**
 * 通知定义
 */
#define JK_NotifiDef(notification) NSString * const notification = @#notification


/**************** Block ****************/

/**
 * 弱引用定义
 */
#define BlockWeakSelf(weakSelf, self)   __weak typeof(self) weakSelf = self

/**
 * 强引用定义
 */
#define BlockStrongSelf(strongSelf, weakSelf)   __strong typeof(weakSelf) strongSelf = weakSelf



#define jkWriteToPlist(data,filename) ([data writeToFile:[NSString stringWithFormat:@"/Users/jackey_gjt/Desktop/%@.plist", filename] atomically:YES])


#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"FILE:%s->LINE:%d Parameter:\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif




#endif /* WX_Prefix_h */
