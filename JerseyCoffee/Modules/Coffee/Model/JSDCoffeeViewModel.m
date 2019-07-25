//
//  JSDCoffeeViewModel.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeViewModel.h"

@implementation JSDCoffeeViewModel

- (NSArray<JSDCoffeeModel *> *)listArray {
    
    if (!_listArray) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"coffeeData" ofType:@"json"];
        NSData* data = [NSData dataWithContentsOfFile:path];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _listArray = [JSDCoffeeModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}

@end

@implementation JSDCoffeeModel

@end
