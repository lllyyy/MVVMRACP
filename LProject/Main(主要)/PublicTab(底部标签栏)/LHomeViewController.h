//
//  LHomeViewController.h
//  LProject
//
//  Created by ios on 2019/11/12.
//  Copyright © 2019 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
 


NS_ASSUME_NONNULL_BEGIN

@interface LHomeViewController : CYLTabBarController<UITabBarControllerDelegate>
@property (strong, nonatomic) CYLTabBarController *tabBarController;
@end

NS_ASSUME_NONNULL_END
