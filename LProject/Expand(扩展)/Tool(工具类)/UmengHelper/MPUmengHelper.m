//
//  MPUmengHelper.m
//  MobileProject
//
//  Created by wujunyang on 16/1/15.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "MPUmengHelper.h"
#import <UMAnalytics/MobClick.h>


@implementation MPUmengHelper

+ (void)UMAnalyticStart {
    [UMConfigure initWithAppkey:@"Your appkey" channel:@"App Store"];
//    UMConfigInstance.appKey=kUmengKey;
//    UMConfigInstance.channelId=@"App Store";
//    [MobClick startWithConfigure:UMConfigInstance];
    // version标识
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
 
    
#if DEBUG
    // 打开友盟sdk调试，注意Release发布时需要注释掉此行,减少io消耗
//    [MobClick setLogEnabled:YES];
#endif
    return;
}

+ (void)beginLogPageView:(__unsafe_unretained Class)pageView {
    [MobClick beginLogPageView:NSStringFromClass(pageView)];
    return;
}

+ (void)endLogPageView:(__unsafe_unretained Class)pageView {
    [MobClick endLogPageView:NSStringFromClass(pageView)];
    return;
}

+(void)beginLogPageViewName:(NSString *)pageViewName
{
    [MobClick beginLogPageView:pageViewName];
    return;
}

+(void)endLogPageViewName:(NSString *)pageViewName
{
    [MobClick endLogPageView:pageViewName];
    return;
}

@end
