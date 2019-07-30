
//
//  JSDKitTypeViewModel.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDKitTypeViewModel.h"

static NSString* const kKitFilePathName = @"KitDate.json";
@implementation JSDKitTypeViewModel

- (NSMutableArray <JSDKitTypeModel *> *)listArray {
    
    if (!_listArray) {
        NSFileManager* fileManager = [NSFileManager defaultManager];
        //指向文件目录
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString* dataPath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kKitFilePathName];
        if ([fileManager fileExistsAtPath:dataPath]) {
        } else {
            dataPath = [[NSBundle mainBundle] pathForResource:@"kitTypeData" ofType:@"json"];
        }
        NSData* data = [NSData dataWithContentsOfFile:dataPath];
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        _listArray = [JSDKitTypeModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}

- (void)upDateKit {
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    //指向文件目录
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* dataPath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kKitFilePathName];
    if ([fileManager fileExistsAtPath:dataPath]) {
    } else {
        dataPath = [[NSBundle mainBundle] pathForResource:@"kitTypeData" ofType:@"json"];
    }
    NSData* data = [NSData dataWithContentsOfFile:dataPath];
    NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    _listArray = [JSDKitTypeModel mj_objectArrayWithKeyValuesArray:array];
}

- (void)addDateKit:(JSDKitTypeModel *_Nullable)KitModel {
    
    if (KitModel ) {
        [self.listArray addObject:KitModel];
    }
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSMutableArray* dataArray = [JSDKitTypeModel mj_keyValuesArrayWithObjectArray:self.listArray];
    NSData* data = [dataArray mj_JSONData];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kKitFilePathName];
    if ([fileManager fileExistsAtPath:path]) {
    } else {
    }
    [data writeToFile:path atomically:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kKitListChangeNotifaction object:nil];
    
}

- (void)editDataKit:(JSDKitTypeModel *)kitModel {
    
    for (NSInteger i = 2;i < self.listArray.count; i++) {
        JSDKitTypeModel* model = self.listArray[i];
        if ([model.kitID isEqualToString:kitModel.kitID]) {
            [self.listArray replaceObjectAtIndex:i withObject:kitModel];
            break;
        }
    }
    [self addDateKit: nil];
}

@end


@implementation JSDKitTypeModel



@end
