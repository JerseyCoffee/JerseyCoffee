//
//  JSDMaterialViewModel.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDMaterialViewModel.h"

static NSString* const kMaterialFilePathName = @"material.json";

@implementation JSDMaterialViewModel

- (NSMutableArray <JSDMaterialModel *> *)listArray {
    
    if (!_listArray) {
        NSFileManager* fileManager = [NSFileManager defaultManager];
        //指向文件目录
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString* dataPath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kMaterialFilePathName];
        if ([fileManager fileExistsAtPath:dataPath]) {
        } else {
            dataPath = [[NSBundle mainBundle] pathForResource:@"MaterialData" ofType:@"json"];
        }
        NSData* data = [NSData dataWithContentsOfFile:dataPath];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        _listArray = [JSDMaterialModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}

- (void)upDateMaterial {
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    //指向文件目录
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kMaterialFilePathName];
    NSString* dataPath = path;
    if ([fileManager fileExistsAtPath:path]) {
    } else {
        dataPath = [[NSBundle mainBundle] pathForResource:@"MaterialData" ofType:@"json"];
    }
    NSData* data = [NSData dataWithContentsOfFile:dataPath];
    NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    _listArray = [JSDMaterialModel mj_objectArrayWithKeyValuesArray:array];
}

- (void)addDateMaterial:(JSDMaterialModel *_Nullable)MaterialModel {
    
    if (MaterialModel) {
        [self.listArray addObject:MaterialModel];
    }
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSMutableArray* dataArray = [JSDMaterialModel mj_keyValuesArrayWithObjectArray:self.listArray];
    NSData* data = [dataArray mj_JSONData];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kMaterialFilePathName];
    
    if ([fileManager fileExistsAtPath:path]) {
    } else {
    }
    [data writeToFile:path atomically:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMaterialChangeNotification object:nil];
    
}

- (void)editDataMaterial:(JSDMaterialModel *)materialModel {
    
    for (NSInteger i = 3;i < self.listArray.count; i++) {
        JSDMaterialModel* model = self.listArray[i];
        if ([model.materialID isEqualToString: materialModel.materialID]) {
            [self.listArray replaceObjectAtIndex:i withObject:materialModel];
            break;
        }
    }
    [self addDateMaterial: nil];
}

@end

@implementation JSDMaterialModel

@end
