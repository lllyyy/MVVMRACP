//
//  AppDelegate.h
//  LProject
//
//  Created by ios on 2019/11/8.
//  Copyright © 2019 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "SYSafeCategory.h"
#import "AdvertiseHelper.h"
#import "introductoryPagesHelper.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow * window;
@property (nonatomic, assign, readwrite) NetworkStatus networkStatus;
+ (instancetype)sharedInstanced ;
@end

