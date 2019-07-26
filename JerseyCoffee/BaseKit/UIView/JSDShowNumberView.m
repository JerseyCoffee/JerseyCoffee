//
//  JSDShowNumberView.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/26.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDShowNumberView.h"

static NSInteger kImageViewCount = 5;

@interface JSDShowNumberView ()

@property (nonatomic, strong) NSArray<UIImageView *>* listImageViews;

@end

@implementation JSDShowNumberView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder: aDecoder];
    if (self) {
        [self initConfiguration];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfiguration];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)initConfiguration {
    
    NSMutableArray* tempArray = NSMutableArray.new;
    UIImageView* lastImageView;
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"material_tabbar_defalut"] highlightedImage:[UIImage imageNamed:@"material_tabbar_selected"]];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:imageView];
        [tempArray addObject:imageView];
        if (lastImageView) {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.height.mas_equalTo(lastImageView);
                make.width.mas_equalTo(lastImageView);
                make.left.mas_equalTo(lastImageView.mas_right).mas_offset(5);
            }];
            if (i == kImageViewCount - 1) {
                [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(0);
                }];
            }
        } else {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.height.mas_equalTo(15);
                make.centerY.mas_equalTo(0);
            }];
        }
        lastImageView = imageView;
    }
    
    _listImageViews = tempArray.copy;
}

//3 2
- (void)updateNumber:(NSInteger)number {
    
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        
        UIImageView* imageView = self.listImageViews[i];
        if (i < number) {// 高亮
            
            imageView.highlighted = YES;
        } else { //
            imageView.highlighted = NO;
        }
    }
}

@end
