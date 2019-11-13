//
//  LLMessageViewModel.m
//  LProject
//
//  Created by ios on 2019/11/12.
//  Copyright © 2019 ios. All rights reserved.
//

#import "LLMessageViewModel.h"

@implementation LLMessageViewModel
- (instancetype)initWithServices:(id<MRCViewModelServices>)services params:(id)params {
    self = [super initWithServices:services params:params];
    if (self) {
        
    }
    return self;
}

- (void)initialize {
    [super initialize];
    self.title = @"消息";
    
    self.shouldPullToRefresh = YES;
    self.shouldInfiniteScrolling = YES;
     @weakify(self)
//    RAC(self, results) = [self.requestRemoteDataCommand.executionSignals.switchToLatest startWith:self.fetchLocalData];
//    RAC(self, dataSource) =  [RACObserve(self, results)
//                                  map:^id(NSMutableArray *value) {
//                                      return [self dataSourceWithResults:value];
//                                  }];
   
}
 

//- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
//    NSArray *args =  @[ doctorId(), @(page), @(self.perPage),self.query];
//    return [[MMBaseAPI requestURL: [NSString stringWithFormat:@"%@/User2/Patient", SERVICE_URL]
//                   withMethodName: @"getDidByAllPatient"
//                         withArgs: args]
//            map:^id(MMResultModel *model2) {
//                return model2.data;
//            }];
//}

//- (NSArray *)dataSourceWithResults:(NSArray *)results {
//    if (results.count == 0)  return nil;
//    NSArray *models = [results.rac_sequence map:^id(id value) {
//        MMPatientModel *patientModel = [MMPatientModel modelWithDictionary: value];
//        return   patientModel ;
//    }].array;
//
//    if (self.page > 1) {
//        for (id  objc in models) {
//            [self.resultDataSource addObject:objc];
//        }
//    }else{
//        self.resultDataSource = models.mutableCopy;
//    }
//
//    return  @[self.resultDataSource];
//}
@end
