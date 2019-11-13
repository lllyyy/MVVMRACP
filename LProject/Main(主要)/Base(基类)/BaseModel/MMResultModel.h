 
#import "MMBaseModel.h"

@interface MMResultModel : MMBaseModel

@property(nonatomic, copy) NSString *code;
@property(nonatomic, copy) NSString *message;
@property(nonatomic, copy) NSArray *data;
@property(nonatomic, copy) id extra;

- (NSDictionary *)oneObject;

@end
