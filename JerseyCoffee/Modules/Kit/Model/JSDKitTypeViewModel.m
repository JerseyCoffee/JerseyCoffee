
//
//  JSDKitTypeViewModel.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDKitTypeViewModel.h"

@implementation JSDKitTypeViewModel

- (NSArray<JSDKitTypeModel *> *)listArray {
    
    if (!_listArray) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"kitTyopeData" ofType:@"json"];
        NSData* data = [NSData dataWithContentsOfFile:path];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _listArray = [JSDKitTypeModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}


@end


@implementation JSDKitTypeModel



@end
