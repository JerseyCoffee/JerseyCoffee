//
//  JSDMaterialViewModel.h
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class JSDMaterialModel;
@interface JSDMaterialViewModel : JSDBaseModel

@property (nonatomic, strong) NSMutableArray<JSDMaterialModel* >* listArray;

- (void)upDateMaterial;
- (void)addDateMaterial: (JSDMaterialModel* _Nullable)MaterialModel;
- (void)editDataMaterial: (JSDMaterialModel *)materialModel;

@end

@interface JSDMaterialModel : JSDBaseModel

@property (nonatomic, copy) NSString* imageName;
@property (nonatomic, copy) NSString* materialName;
@property (nonatomic, copy) NSString* materialENName;
@property (nonatomic, copy) NSString* materialDetail;
@property (nonatomic, copy) NSString* materialDetailTitle;
@property (nonatomic, assign) float bakeNumber;
@property (nonatomic, assign) float sourNumber;
@property (nonatomic, assign) float chunNumber;
@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, copy) NSString* materialID;

@end

NS_ASSUME_NONNULL_END
