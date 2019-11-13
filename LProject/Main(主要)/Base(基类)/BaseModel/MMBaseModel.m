 
#import "MMBaseModel.h"

@implementation MMBaseModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self modelEncodeWithCoder:aCoder];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    return [self modelInitWithCoder:aDecoder];
}

- (id)copyWithZone:(NSZone *)zone {
    return [self modelCopy];
}

- (NSUInteger)hash {
    return [self modelHash];
}

- (BOOL)isEqual:(id)object {
    return [self modelIsEqual:object];
}

/*
 
 + (NSDictionary *)modelContainerPropertyGenericClass {
     return @{@"diseaseDiagnosis" : [MMDiseaseModel class],
              @"usageDosageModels" : [MMedicineUsageModel class]};
 }

 + (NSDictionary *)modelCustomPropertyMapper {
     return @{
              @"idd" : @"id",
              @"usageDosageModels":@"usageDosageModel",
              };
 }

 */

@end
