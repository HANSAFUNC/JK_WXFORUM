//
//  BaseWebViewController.h
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/11.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@class GeneralModel;
@protocol JavaScriptFuncDelegate <JSExport>
/**
 *  JavaScript交互协议
 *
 *  @param PropertyName 别名
 *  @param Selector     方法名
 *
 */
//JSExportAs(<#PropertyName#>, <#Selector#>)


@end
@interface BaseWebViewController : UIViewController<UIWebViewDelegate,JavaScriptFuncDelegate>

@property (nonatomic ,strong) GeneralModel * generalModel;
@property (nonatomic ,strong) JSContext * context;

@end
