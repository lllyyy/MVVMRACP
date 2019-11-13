//
//  LHomeViewController.m
//  LProject
//
//  Created by ios on 2019/11/12.
//  Copyright © 2019 ios. All rights reserved.
//

#import "LHomeViewController.h"
#import "LLHomeVC.h"
#import "LLHomeViewModel.h"
#import "LLFoundVC.h"
#import "LLMessageViewModel.h"
#import "LLMessageVC.h"
#import "LLMyVC.h"

@interface LHomeViewController ()

@end

@implementation LHomeViewController
 
 - (instancetype)init {
     self = [super init];
     if (self) {
         [self setupTabBarController];
//         [self setUpTabBarItemTextAttributes];
         
//         self.tabBar.barTintColor = UIColorHex(f5f7fa);
//         self.tabBar.tintColor = UIColorHex(f5f7fa);
         
         
         //显示未读
//         UINavigationController  *discoverNav =(UINavigationController *)self.viewControllers[1];
//         UITabBarItem *curTabBarItem=discoverNav.tabBarItem;
//         [curTabBarItem setBadgeValue:@"2"];
     }
     return self;
 }
/**
   tabBarItem 的选中和不选中文字属性
*/
- (void)setUpTabBarItemTextAttributes {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor yellowColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateSelected];
//    UITabBar *tabBarAppearance = [UITabBar appearance];
//    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background_os7"]];
}
 - (void)setupTabBarController {
     /// 设置TabBar属性数组
     self.tabBarItemsAttributes =[self tabBarItemsAttributesForController];
     
     /// 设置控制器数组
     self.viewControllers =[self mpViewControllers];
     
     self.delegate = self;
      self.moreNavigationController.navigationBarHidden = YES;
 }


 //控制器设置
 - (NSArray *)mpViewControllers {
     LLHomeViewModel *vm = [[LLHomeViewModel alloc]initWithServices:nil params:@{}];
     LLHomeVC *firstViewController = [[LLHomeVC alloc] initWithViewModel:vm];
     MRCNavigationController *firstNavigationController = [[MRCNavigationController alloc]
                                                    initWithRootViewController:firstViewController];
     
     LLFoundVC *secondViewController = [[LLFoundVC alloc] init];
     MRCNavigationController *secondNavigationController = [[MRCNavigationController alloc]
                                                     initWithRootViewController:secondViewController];
     
     LLMessageViewModel *vma = [[LLMessageViewModel alloc]initWithServices:nil params:nil];
     LLMessageVC *thirdViewController = [[LLMessageVC alloc] initWithViewModel:vma];
     MRCNavigationController *thirdNavigationController = [[MRCNavigationController alloc]
                                                    initWithRootViewController:thirdViewController];
     
     LLMyVC *fourthViewController = [[LLMyVC alloc] init];
     MRCNavigationController *fourthNavigationController = [[MRCNavigationController alloc]
                                                     initWithRootViewController:fourthViewController];
     
     NSArray *viewControllers = @[
                                  firstNavigationController,
                                  secondNavigationController,
                                  thirdNavigationController,
                                  fourthNavigationController
                                  ];
     return viewControllers;
 }

 //TabBar文字跟图标设置
 - (NSArray *)tabBarItemsAttributesForController {
     NSDictionary *firstTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"首页",
                                                   CYLTabBarItemImage : @"tab_college_gray",
                                                   CYLTabBarItemSelectedImage : @"tab_college",
                                                  };
     NSDictionary *secondTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"发现",
                                                   CYLTabBarItemImage : @"tab_order_gray",
                                                   CYLTabBarItemSelectedImage : @"tab_order",
                                                   };
     NSDictionary *thirdTabBarItemsAttributes = @{
                                                   CYLTabBarItemTitle : @"消息",
                                                   CYLTabBarItemImage : @"tab_patient_gray",
                                                   CYLTabBarItemSelectedImage : @"tab_patient",
                                                  };
     NSDictionary *fourthTabBarItemsAttributes = @{
                                                    CYLTabBarItemTitle : @"我的",
                                                    CYLTabBarItemImage : @"tab_user_gray",
                                                    CYLTabBarItemSelectedImage : @"tab_user"
                                                   };
     NSArray *tabBarItemsAttributes = @[
                                        firstTabBarItemsAttributes,
                                        secondTabBarItemsAttributes,
                                        thirdTabBarItemsAttributes,
                                        fourthTabBarItemsAttributes
                                        ];
     return tabBarItemsAttributes;
 }


 #pragma mark - UITabBarControllerDelegate

 - (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
     /// 特殊处理 - 是否需要登录
     BOOL isBaiDuService = [viewController.topViewController isKindOfClass:[LLMyVC class]];
     if (isBaiDuService) {
         NSLog(@"你点击了TabBar第二个");
     }
     return YES;
 }

@end
