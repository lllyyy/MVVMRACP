//
//  AppDelegate.m
//  LProject
//
//  Created by ios on 2019/11/8.
//  Copyright © 2019 ios. All rights reserved.
//

#import "AppDelegate.h"
#import "LHomeViewController.h"
#import "MMHomepageViewController.h"
#import "LLMyVC.h"


@interface AppDelegate ()
@property (nonatomic, strong) Reachability *reachability;

@end

@implementation AppDelegate
 + (instancetype)sharedInstanced {
     return (AppDelegate *)[UIApplication sharedApplication].delegate;
 }

 - (void)dealloc {
     
     [[NSNotificationCenter defaultCenter] removeObserver:self];
 }
 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 //启动友盟统计
//  [MPUmengHelper UMAnalyticStart];
    //统一处理一些为数组、集合等对nil插入会引起闪退
    [SYSafeCategory callSafeCategory];
    
    //键盘统一收回处理
    [self configureBoardManager];
    
      self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
       self.window.backgroundColor = [UIColor whiteColor];
       [self setupHomeViewController];
    
    
//    //引导页面加载
   //  [self setupIntroductoryPage];
//
//    //启动广告（记得放最后，才可以盖在页面上面）
    // [self setupAdveriseView];
    
    return YES;
}
//首页
-(void)setupHomeViewController
{
//    MMHomepageViewController *tabBarController = [[MMHomepageViewController alloc] init];
    LHomeViewController *tabBarController = [[LHomeViewController alloc] init];
//
//    LLMyVC *fourthViewController = [[LLMyVC alloc] init];
//    MRCNavigationController *nav = [[MRCNavigationController alloc]initWithRootViewController:tabBarController];
    
    
    [self.window setRootViewController:tabBarController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

 #pragma mark 键盘收回管理
 -(void)configureBoardManager
 {
     IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
     manager.enable = YES;
     manager.shouldResignOnTouchOutside = YES;
     manager.shouldToolbarUsesTextFieldTintColor = YES;
     manager.keyboardDistanceFromTextField=60;
     manager.enableAutoToolbar = NO;
 }

#pragma mark 启动广告
-(void)setupAdveriseView
{
    // TODO 请求广告接口 获取广告图片
    
    //现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiserView:imageArray];
}


#pragma mark 引导页
-(void)setupIntroductoryPage
{
    if (BBUserDefault.isNoFirstLaunch)
    {
        return;
    }
    BBUserDefault.isNoFirstLaunch=YES;
    NSArray *images=@[@"introductoryPage1",@"introductoryPage2",@"introductoryPage3",@"introductoryPage4"];
    [introductoryPagesHelper showIntroductoryPageView:images];
}
//网络
- (void)configureReachability
{
    self.reachability = Reachability.reachabilityForInternetConnection;
    
    RAC(self, networkStatus) = [[[[NSNotificationCenter.defaultCenter
                                   rac_addObserverForName:kReachabilityChangedNotification object:nil]
                                  map:^id(NSNotification *notification) {
                                      return @([notification.object currentReachabilityStatus]);
                                  }]
                                 startWith:@(self.reachability.currentReachabilityStatus)]
                                distinctUntilChanged];
    @weakify(self)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self)
        [self.reachability startNotifier];
    });
    
}
 

@end
