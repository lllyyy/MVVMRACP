//
//  GVUserDefaults+BBProperties.h
//  GrowthDiary
//
//  Created by wujunyang on 16/1/5.
//  Copyright (c) 2016年 wujunyang. All rights reserved.

//本地储存
//   if (![GVUserDefaults standardUserDefaults].isLanuchedApp)

#import "GVUserDefaults.h"

#define BBUserDefault [GVUserDefaults standardUserDefaults]

@interface GVUserDefaults (BBProperties)

#pragma mark -- personinfo
@property (nonatomic,weak) NSString *userName;
@property (nonatomic,weak) NSString *name;
@property (nonatomic,weak) NSString *role;

@property (nonatomic,assign) BOOL isNoFirstLaunch;
@end
