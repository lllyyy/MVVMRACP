//
//  LLMessageVC.m
//  LProject
//
//  Created by ios on 2019/11/12.
//  Copyright © 2019 ios. All rights reserved.
//

#import "LLMessageVC.h"
#import "LLMessageViewModel.h"
#import "MMTableViewCell.h"


@interface LLMessageVC ()
@property (nonatomic, strong) LLMessageViewModel *viewModel;
@end

@implementation LLMessageVC
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
     
//    self.tableView.height = kScreenHeight - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT ;
    
   [self.tableView registerClass: [MMTableViewCell class] forCellReuseIdentifier:@"MMTableViewCell"];
}

 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return  1;
 }

 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
      
     return 30;
 }

 -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
      
     return 45;
     
 }
 -(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
     return 0.1;
 }
 -(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
      
     return 0.1;
 }
 

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     
        
         MMTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"MMTableViewCell" forIndexPath:indexPath];
        cell.textLabel.text = @"111";
       return cell;
    
 }

 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
     
     
 }
 
@end
