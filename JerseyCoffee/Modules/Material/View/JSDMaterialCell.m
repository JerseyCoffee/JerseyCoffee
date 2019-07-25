//
//  JSDMaterialCell.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/24.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDMaterialCell.h"

@interface JSDMaterialCell ()

@property (weak, nonatomic) IBOutlet UIImageView *materialImageView;
@property (weak, nonatomic) IBOutlet UIView *textContentView;
@property (weak, nonatomic) IBOutlet UILabel *meterialNameLabel;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *coffeeStoryLabel;

@end

@implementation JSDMaterialCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
//    self.contentView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.textContentView.backgroundColor = [UIColor colorWithRed:243/255.0 green:241/255.0 blue:241/255.0 alpha:1.0];
    
}

@end
