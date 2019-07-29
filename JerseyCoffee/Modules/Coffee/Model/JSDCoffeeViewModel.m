//
//  JSDCoffeeViewModel.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeViewModel.h"

NSString* const kCoffeeFilePathName = @"coffee.json";
@implementation JSDCoffeeViewModel

- (NSMutableArray<JSDCoffeeModel *> *)listArray {
    
    if (!_listArray) {
        NSFileManager* fileManager = [NSFileManager defaultManager];
        //指向文件目录
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kCoffeeFilePathName];
        NSString* dataPath = path;
        if ([fileManager fileExistsAtPath:path]) {
        } else {
            dataPath = [[NSBundle mainBundle] pathForResource:@"coffeeData" ofType:@"json"];
        }
        NSData* data = [NSData dataWithContentsOfFile:dataPath];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _listArray = [JSDCoffeeModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}

- (void)upDateCoffee {
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    //指向文件目录
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kCoffeeFilePathName];
    NSString* dataPath = path;
    if ([fileManager fileExistsAtPath:path]) {
    } else {
        dataPath = [[NSBundle mainBundle] pathForResource:@"coffee" ofType:@"json"];
    }
    NSData* data = [NSData dataWithContentsOfFile:dataPath];
    NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    _listArray = [JSDCoffeeModel mj_objectArrayWithKeyValuesArray:array];
}

- (void)addDateCoffee: (JSDCoffeeModel* )coffeeModel {
    
    [self.listArray addObject:coffeeModel];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSMutableArray* dataArray = [JSDCoffeeModel mj_keyValuesArrayWithObjectArray:self.listArray];
    NSData* data = [dataArray mj_JSONData];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kCoffeeFilePathName];
    if ([fileManager fileExistsAtPath:path]) {
    } else {
    }
    [data writeToFile:path atomically:YES];
}

- (void)editDataCoffee: (JSDCoffeeModel *)coffeeModel {
    
    for (NSInteger i = 5;i < self.listArray.count; i++) {
        JSDCoffeeModel* model = self.listArray[i];
        if ([model.coffeeID isEqualToString:coffeeModel.coffeeID]) {
            [self.listArray replaceObjectAtIndex:i withObject:coffeeModel];
            break;
        }
    }
}

@end

@implementation JSDCoffeeModel

@end
