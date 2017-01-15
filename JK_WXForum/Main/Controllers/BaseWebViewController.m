//
//  BaseWebViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 17/1/11.
//  Copyright © 2017年 Jackey. All rights reserved.
//

#import "BaseWebViewController.h"
#import "WebRequest.h"
#import "GeneralModel.h"
#import "webModel.h"
#import "UIImage+Color.h"
#define IMAGE_URL(UD) [NSString stringWithFormat:@"http://bbs.pyua.net/uc_server/avatar.php?uid=%@",UD]

@interface BaseWebViewController ()<UIWebViewDelegate>
{
    UIWebView * _webView;
    webModel * _webModel;
    
    
}
@property (nonatomic ,strong) WebRequest * webRequest;

@end

@implementation BaseWebViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        _webRequest = [[WebRequest alloc]init];
        self.context = [[JSContext alloc]init];
        
    }
    return self;
}
-(void)setGeneralModel:(GeneralModel *)generalModel {
    
    _generalModel = generalModel;
    
    [self.webRequest loadHybridWebDataFormJavaScriptRequestTid:generalModel.tid HandleCompleteBlock:^{
        NSLog(@"%@",self.webRequest.webModel.message);
        _webModel = self.webRequest.webModel;
        NSURL * url = [[NSBundle mainBundle]URLForResource:@"index" withExtension:@"html"];
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:request];
        //                [self onLoadHtml5CodeWithWebView];
        //                [self.context evaluateScript:[self loadJsFile:@"index"]];
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}
- (void)setupNavgationBar {
    UIImage * barImage = [UIImage imageWithColor:JKColor_RGB(255, 255, 255)];
    [self.navigationController.navigationBar setBackgroundImage:barImage forBarMetrics:0];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    [self.navigationController.navigationBar setTintColor:JKColor_RGB(0, 0, 0)];
    UIButton * imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage * imageNormal = [UIImage imageNamed:@"newHost"];
    UIImage * imageSelect = [UIImage imageNamed:@"hostToAll"];
    [imageButton setImage:imageNormal forState:UIControlStateNormal];
    [imageButton setImage:imageSelect forState:UIControlStateSelected];
    [imageButton sizeToFit];
    [imageButton addTarget:self action:@selector(cutDataSource:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = imageButton;
}

- (void)cutDataSource:(UIButton *)button {
    button.selected = !button.selected;
}



- (void)setupUI {
    
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    _webView.delegate =self;
    _webView.scrollView.alwaysBounceHorizontal = NO;
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_webView];
    [self setupNavgationBar];
    self.automaticallyAdjustsScrollViewInsets = NO;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    //    webView.scrollView.alwaysBounceVertical = NO;
    //    webView.scrollView.alwaysBounceHorizontal = NO;
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //    CGFloat offsetH =[[_webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"]floatValue];
    //    [webView.scrollView setContentSize:CGSizeMake(0, offsetH)];
    [self objcCallJavaScritpCode];
    
}

- (void)objcCallJavaScritpCode {
    [self sendContentTextToJavaScriptFunc];
    [self sendSubjectStringToJavaScriptFunc];
    [self sendImageUrlStringToJavaScriptFunc];
    [self sendUserNameStringToJavaScriptFunc];
    [self sendIconImageStringToJavaScriptFunc];
    [self sendTimeAndLevelStringToJavaScriptFunc];
    [self sendReplyAndViewsStringToJavaScriptFunc];
    
    
    
    
}

-(void)sendImageUrlStringToJavaScriptFunc {
//    [UIImage imageWithContentsOfFile:<#(nonnull NSString *)#>]
    NSString * url = [[NSBundle mainBundle]bundlePath ];
    [self objcCallJavaScriptFunctionName:@"insertLeftAndRightImage" someArg:_webModel.author, nil];
    
}
-(void)sendUserNameStringToJavaScriptFunc {
    
    [self objcCallJavaScriptFunctionName:@"insertTitleNameString" someArg:_webModel.author, nil];
    
}
-(void)sendTimeAndLevelStringToJavaScriptFunc {
    
    NSString *TimeAndLevel = [NSString stringWithFormat:@"%@级  楼主/%@",_webModel.grouptitle,_webModel.dateline];
    [self objcCallJavaScriptFunctionName:@"insertTimeAndLevelString" someArg:TimeAndLevel, nil];
}
//浏览量
-(void)sendReplyAndViewsStringToJavaScriptFunc {
    NSString *ReplyAndViews = [NSString stringWithFormat:@"%@回复/%@已读",_webModel.replies,_webModel.views];
    [self objcCallJavaScriptFunctionName:@"insertReplyAndViews" someArg:ReplyAndViews, nil];
    
}
//头像
-(void)sendIconImageStringToJavaScriptFunc {
    
    id arg = [self block:^id{
        
        return IMAGE_URL(self.generalModel.authorid);;
    }];
    [self objcCallJavaScriptFunctionName:@"insertIconImageString" someArg:arg, nil];
}
//主题
-(void)sendSubjectStringToJavaScriptFunc {
    
    NSString *subject = _webModel.subject;
    [self objcCallJavaScriptFunctionName:@"insertSubjectString" someArg:subject, nil];
    
}

- (void)sendContentTextToJavaScriptFunc {
    
    const NSString *body = _webModel.message;
    const NSArray *images = _webModel.attachimg;
    for (NSDictionary * dict in images) {
        NSString * aid = [NSString stringWithFormat:@"[attach]%@[/attach]",dict[@"aid"]];
        NSString * url = dict[@"url"];
        NSString * iamgeHtml = [NSString stringWithFormat:@"<div id=\"imgs\" align =\"center\"> <img src =\"%@\" width = \"%fpx\"> </div>",url,[self calculateImageWidthScaleInIOS]];
        body = [body stringByReplacingOccurrencesOfString:aid withString:iamgeHtml];
    }
    [self objcCallJavaScriptFunctionName:@"insertString" someArg:body, nil];
    
}

- (id)block:(id(^)())finishedBlock{
    
    if (finishedBlock) {
        return finishedBlock();
    }
    return nil;
}
- (id)objcCallJavaScriptFunctionName:(NSString *)funcName someArg:(id)args,... NS_REQUIRES_NIL_TERMINATION {
    
    va_list list;
    va_start(list, args);
    NSMutableArray * Arguments = [NSMutableArray new];
    for (id arg =args; arg != nil; arg = va_arg(list, id)) {
        
        [Arguments addObject:arg];
        NSLog(@"%@",arg);
        
    }
    va_end(list);
    //js环境
    JSValue * func = [self.context objectForKeyedSubscript:funcName];
    JSValue * result =[func callWithArguments:Arguments];
    
    return result;
}

- (NSString *)loadJsFile:(NSString*)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"js"];
    NSString *jsScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return jsScript;
}

- (CGFloat)calculateImageWidthScaleInIOS {
    
    return JKScreenW - (20 * [UIScreen mainScreen].scale);
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}
- (void)onLoadHtml5CodeWithWebView {
    
    NSString * body = _webModel.message;
    NSArray * images = _webModel.attachimg;
    
    for (NSDictionary * dict in images) {
        NSString * aid = [NSString stringWithFormat:@"[attach]%@[/attach]",dict[@"aid"]];
        NSString * url = dict[@"url"];
        //        <div id=\"imgs\"><img src=\"\(src)\"> <p>\(alt)</p></div>
        NSString * iamgeHtml = [NSString stringWithFormat:@"<div id=\"imgs\"> <img src =\"%@\"> </div>",url];
        body = [body stringByReplacingOccurrencesOfString:aid withString:iamgeHtml];
    }
    //    let cssPath = NSBundle.mainBundle().URLForResource("newsDetail", withExtension: "css")
    //    let cssHtml = "<link href=\"\(cssPath!)\" rel=\"stylesheet\">"
    NSURL * cssPath = [[NSBundle mainBundle]URLForResource:@"index" withExtension:@"css"];
    //    NSLog(@"%@",cssPath)
    
    NSString * cssHtml = [NSString stringWithFormat:@"<link href=\"%@\" rel=\"stylesheet\">",cssPath];
    //    NSLog(@"%@",cssHtml);
    NSString * html = [NSString stringWithFormat:@"<html><head lang=\"en\"><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width,initial-sacal=1.0\"><title>sb</title>%@</head><body width=\"375px\">%@</body></html>",cssHtml,body];
    [_webView loadHTMLString:html baseURL:nil];
    
    CGFloat offsetH =[[_webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"]floatValue];
    NSLog(@"%f",offsetH);
}

@end
