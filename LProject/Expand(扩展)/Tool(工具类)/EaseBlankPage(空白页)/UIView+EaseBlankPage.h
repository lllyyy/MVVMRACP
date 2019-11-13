//
//  UIView+EaseBlankPage.h
//  Blossom
//
//  Created by wujunyang on 15/9/21.
//  Copyright © 2015年 wujunyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EaseBlankPageView.h"

/*
 
 [self.view configBlankPage:EaseBlankPageTypeView hasData:self.dataArray.count hasError:(self.dataArray.count>0) reloadButtonBlock:^(id sender) {
     [MBProgressHUD showInfo:@"重新加载的数据" ToView:weakSelf.view];
     [weakSelf.myTableView.mj_header beginRefreshing];
 }];
 */
@interface UIView(EaseBlankPage)

@property (strong, nonatomic) EaseBlankPageView *blankPageView;

- (void)configBlankPage:(EaseBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;
@end
