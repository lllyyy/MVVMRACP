//
//  introductoryPagesHelper.h
//  MobileProject
//
//  Created by wujunyang on 16/7/14.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "introductoryPagesView.h"
/*
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

 
 
 */
@interface introductoryPagesHelper : NSObject

+ (instancetype)shareInstance;

+(void)showIntroductoryPageView:(NSArray *)imageArray;

@end
