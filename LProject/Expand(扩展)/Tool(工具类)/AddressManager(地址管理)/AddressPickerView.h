//
//  AddressPickerView.h
//  MobileProject 省市区三级联动弹出窗
//
//  Created by wujunyang on 16/8/3.
//  Copyright © 2016年 wujunyang. All rights reserved.
//
/*
 _myAddressPickerView = [AddressPickerView shareInstance];
 //可以设置其默认值
 //[_myAddressPickerView configDataProvince:@"福建省" City:@"厦门市" Town:@"思明区"];
 //可以判断弹出窗当前的状态
 //_myAddressPickerView.currentPickState
 
 [_myAddressPickerView showAddressPickView];
 [self.view addSubview:_myAddressPickerView];
 
 __weak UIButton *temp = (UIButton *)sender;
 _myAddressPickerView.block = ^(NSString *province,NSString *city,NSString *district)
 {
     [temp setTitle:[NSString stringWithFormat:@"%@ %@ %@",province,city,district] forState:UIControlStateNormal];
 };
 
 */


#import <UIKit/UIKit.h>

typedef  void(^AdressBlock)(NSString *province, NSString *city, NSString *district);

@interface AddressPickerView : UIView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic,copy) AdressBlock block;

//当前弹出视图的显示状态(YES 处于弹出状态 NO 隐藏状态)
@property(nonatomic)BOOL currentPickState;

+ (id)shareInstance;

//显示
-(void)showAddressPickView;

//隐藏
-(void)hiddenAddressPickView;

//绑定默认值 省名 市名 区名
-(void)configDataProvince:(NSString *)provinceName City:(NSString *)cityName Town:(NSString *)townName;

@end
