//
//  JSDMaterialViewModel.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDMaterialViewModel.h"

@implementation JSDMaterialViewModel

- (NSArray<JSDMaterialModel *> *)listArray {
    
    if (!_listArray) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"MaterialData" ofType:@"json"];
        NSData* data = [NSData dataWithContentsOfFile:path];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        _listArray = [JSDMaterialModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}

@end

@implementation JSDMaterialModel

@end
