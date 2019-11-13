//
//  LLCommonURLKey.h
//  LProject
//
//  Created by ios on 2019/11/11.
//  Copyright © 2019 ios. All rights reserved.
//

#ifndef LLCommonURLKey_h
#define LLCommonURLKey_h
#ifdef DEBUG //线下
    #define SERVICE2_URL @"http://service.zmmedical.cn/"
    #define SERVICE_URL  @"https://service.jjmedical.cn/"
    #define SHARE_URL    @"http://tc2.jjmedical.cn/"
    #define AREA_URL     @"test/mami_admin/Area/citylist.json"
#else
    #define SERVICE_URL  @"http://service.lejiayy.com/"
    #define SHARE_URL    @"https://tc.lejiayy.com/"
    #define AREA_URL     @"mami_admin/Area/citylist.json"
 #endif

//static NSString *const InisetJsonUrl = @"test/mami_admin/Iniset/iniset.json";
static NSString *const InisetJsonUrl   = @"mami_admin/Iniset/iniset.json";
static NSString *const ONLINEVIDEO_URL = @"http://api.cogonline.com.cn/";
static NSString *const RongClond_URL   = @"http://api.cn.ronghub.com/";
static NSString *const ossUrl          = @"https://oss.zuimeimami.com/";

#endif /* LLCommonURLKey_h */
