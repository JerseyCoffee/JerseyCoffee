//
//  JSDMaterialTextView.h
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/24.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDBaseView.h"

#import "JSDMaterialViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JSDMaterialTextView : JSDBaseView

@property (nonatomic, strong) JSDMaterialModel* model;

- (void)updateViewWithModel:(JSDMaterialModel *)model;

@end

NS_ASSUME_NONNULL_END
