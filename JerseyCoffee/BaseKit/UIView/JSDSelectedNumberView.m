//
//  JSDSelectedNumberView.m
//  JerseyCoffee
//
//  Created by ada on 2019/7/27.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDSelectedNumberView.h"

static NSInteger kImageViewCount = 5;

@interface JSDSelectedNumberView ()

@property (nonatomic, strong) NSArray<UIButton *>* listButtonViews;
@property (assign, nonatomic) NSInteger lastNumber;

@end

@implementation JSDSelectedNumberView

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
    UIButton* lastImageView;
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        UIButton* btn = [[UIButton alloc] init];
//        btn.backgroundColor = [UIColor clearColor];
        [btn setImage:[UIImage imageNamed:@"material_tabbar_defalut"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"material_tabbar_selected"] forState:UIControlStateSelected];
        btn.contentMode = UIViewContentModeScaleToFill;
        btn.tag = i;
        [btn addTarget:self action:@selector(onTouchNumber:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [tempArray addObject:btn];
        if (lastImageView) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(0);
                make.height.mas_equalTo(lastImageView);
                make.width.mas_equalTo(lastImageView);
                make.left.mas_equalTo(lastImageView.mas_right).mas_offset(5);
            }];
            if (i == kImageViewCount - 1) {
                [btn mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(0);
                }];
            }
        } else {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.height.mas_equalTo(15);
                make.centerY.mas_equalTo(0);
            }];
        }
        lastImageView = btn;
    }
    
   _listButtonViews = tempArray.copy;
}

- (void)onTouchNumber:(UIButton* )sender {
    

    for (NSInteger i = 0; i < kImageViewCount; i++) {
        
        UIButton* btn = self.listButtonViews[i];
        //TODO:暂时不考虑清楚
//        if (sender.tag == 0) {
//            btn.selected = !sender.isSelected;
//        } else {
            if (i <= sender.tag) {// 高亮
                
                btn.selected = YES;
            } else { //
                btn.selected = NO;
            }
//        }
    }
//    self.lastNumber = sender.tag;
    self.currentNumber = sender.tag + 1;
}

- (void)updateNumber:(NSInteger)number {
    
    for (NSInteger i = 0; i < kImageViewCount; i++) {
        
        UIButton* btn = self.listButtonViews[i];
        if (i < number) {// 高亮
            btn.selected = YES;
        } else { //
            btn.selected = NO;
        }
    }
    self.currentNumber = number;
}

@end
