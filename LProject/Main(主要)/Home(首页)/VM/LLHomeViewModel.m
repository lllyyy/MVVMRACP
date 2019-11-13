//
//  LLHomeViewModel.m
//  LProject
//
//  Created by ios on 2019/11/12.
//  Copyright © 2019 ios. All rights reserved.
//

#import "LLHomeViewModel.h"

@implementation LLHomeViewModel
-(instancetype)initWithServices:(id<MRCViewModelServices>)services params:(NSDictionary *)params{
    self = [super initWithServices:services params:params];
    if (self) {
 
 
    }
    return self;
}

- (void)initialize {
    [super initialize];
 
  
    self.title = @"首页";
 

//    RACSignal *validSubmitSignal = [[[RACObserve(self, content)
//                                      map:^(NSString *content) {
//                                          return [content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//                                      }]
//                                     map:^(NSString *content) {
//                                         NSString *oldContent = descr();
//                                      
//                                         return @(content.length > 0 && content.length<=500 &&  ![content isEqualToString:  oldContent]  );
//                                     }]
//                                    distinctUntilChanged];
//    
//    @weakify(self)
//    self.submitCommand = [[RACCommand alloc] initWithEnabled:validSubmitSignal signalBlock:^RACSignal *(id input) {
//        @strongify(self)
//        MMDoctorModel *doctorModel = doctor();
//        doctorModel.idd = doctorId();
//        doctorModel.desc = self.content;
//    
//        return [ [MMUserAPI updateDoctorInfo: doctorModel]
//                  map:^id(MMResultModel *model) {
//                      return model;
//                  }];
//    }];
//    [self.submitCommand.errors subscribe:self.errors];
// 
    
}

@end
