//
//  AdvertiseHelper.h
//  MobileProject  处理事件在AdvertiseView里面有个NotificationContants_Advertise_Key通知，可以在首页进行获取通知，然后进行处理，比如进行跳转功能
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:NotificationContants_Advertise_Key object:nil];
//
//  Created by wujunyang on 16/6/14.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

/*
 
 #pragma mark 启动广告
 -(void)setupAdveriseView
 {
     // TODO 请求广告接口 获取广告图片
     
     //现在了一些固定的图片url代替
     NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
     
     [AdvertiseHelper showAdvertiserView:imageArray];
 }
 
 */

#import <Foundation/Foundation.h>
#import "AdvertiseView.h"

@interface AdvertiseHelper : NSObject

+ (instancetype)sharedInstance;

+(void)showAdvertiserView:(NSArray *)imageArray;

@end
