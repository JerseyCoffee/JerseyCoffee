//
//  JSDKitTypeViewModel.h
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class JSDKitTypeModel;
@interface JSDKitTypeViewModel : JSDBaseModel

@property (nonatomic, strong) NSMutableArray<JSDKitTypeModel* >* listArray;

- (void)upDateKit;
- (void)addDateKit: (JSDKitTypeModel* _Nullable)KitModel;
- (void)editDataKit: (JSDKitTypeModel *)kitModel;

@end

@interface JSDKitTypeModel : JSDBaseModel

@property (nonatomic, copy) NSString* kitImageName;
@property (nonatomic, copy) NSString* kitCNName;
@property (nonatomic, copy) NSString* kitENName;
@property (nonatomic, copy) NSString* kitDetail;
@property (nonatomic, copy) NSString* step;
@property (nonatomic, copy) NSString* kitID;
@property (nonatomic, assign) BOOL canEdit;


@end

NS_ASSUME_NONNULL_END
