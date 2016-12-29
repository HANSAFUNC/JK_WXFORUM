//
//  MainViewController.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/19.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "MainViewController.h"
#import "JKWXForumViewController.h"
#import "JKNetSchoolViewController.h"
#import "JKIssueViewController.h"
#import "JKForumViewController.h"
#import "JKProfileViewController.h"
#import "UIImage+Render.h"
#import "JKNavgationController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAppearance];
    [self setupChildViewController];
    
}

- (void)setAppearance {
    
    UITabBarItem * tabB = [UITabBarItem appearance];
    [tabB setTitleTextAttributes:@{NSForegroundColorAttributeName : JKColor_RGB(41, 187, 156)} forState:UIControlStateSelected];
    
}


- (void)setupChildViewController {
    
    JKWXForumViewController * WXFroum = [[JKWXForumViewController alloc]init];
    JKNetSchoolViewController * NetSchool = [[JKNetSchoolViewController alloc]init];
    JKIssueViewController * Issue = [[JKIssueViewController alloc]init];
    JKForumViewController * Forum = [[JKForumViewController alloc]init];
    JKProfileViewController * Profile = [[JKProfileViewController alloc]init];
    
    [self giveController:WXFroum normalImage:@"home_off" selectImage:@"home_on" isNavigation:YES];
    [self giveController:NetSchool normalImage:@"abc_off" selectImage:@"abc_on" isNavigation:YES];
    [self giveController:Issue normalImage:@"cc_off" selectImage:@"cc_on" isNavigation:YES];
    [self giveController:Forum normalImage:@"bbs_off" selectImage:@"bbs_on" isNavigation:YES];
    [self giveController:Profile normalImage:@"my_off" selectImage:@"my_on" isNavigation:NO];
    
    
    
}

- (void)giveController:(UIViewController *)controller normalImage:(NSString *)normalName selectImage:(NSString *)selectImage isNavigation:(BOOL)isNavigation{
    controller.tabBarItem.image = [UIImage renderImageWithNormal:normalName];
    controller.tabBarItem.selectedImage = [UIImage renderImageWithNormal:selectImage];
    if (isNavigation) {
        JKNavgationController *nav = [[JKNavgationController alloc]initWithRootViewController:controller];
        [self addChildViewController:nav];
    }else{
        [self addChildViewController:controller];
    }
    
}







@end
