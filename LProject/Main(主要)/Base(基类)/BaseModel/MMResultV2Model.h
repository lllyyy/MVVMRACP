 
#import "MMBaseModel.h"

@interface MMResultV2Model : MMBaseModel

@property(nonatomic, copy) NSString *code;
@property(nonatomic, copy) NSString *message;
@property(nonatomic, copy) id data;
@property(nonatomic, copy) NSArray *extra;


@end
