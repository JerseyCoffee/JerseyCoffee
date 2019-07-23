//
//  JSDCoffeeCollectionViewCell.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/23.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeCollectionViewCell.h"

@interface JSDCoffeeCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleENLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLeftRight;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end

@implementation JSDCoffeeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1].CGColor;
//    self.layer.shadowColor = [UIColor redColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,3);
    self.layer.shadowOpacity = 1;
    self.layer.cornerRadius = 20;
    self.layer.masksToBounds = YES;
    
    NSMutableAttributedString *titleCNLabel = [[NSMutableAttributedString alloc] initWithString:@"拿铁咖啡" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24],NSForegroundColorAttributeName: [UIColor colorWithRed:30/255.0 green:23/255.0 blue:13/255.0 alpha:1.0]}];
    self.titleCNLabel.attributedText = titleCNLabel;
    
    NSMutableAttributedString *titleENstring = [[NSMutableAttributedString alloc] initWithString:@"Caffè Latte" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 14.0],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];
    
    self.titleENLabel.attributedText = titleENstring;
    
    NSMutableAttributedString *leftstring = [[NSMutableAttributedString alloc] initWithString:@"“" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 36.0],NSForegroundColorAttributeName: [UIColor colorWithRed:30/255.0 green:23/255.0 blue:13/255.0 alpha:1.0]}];
    
    self.detailLeftLabel.attributedText = leftstring;
    
    NSMutableAttributedString *rightstring = [[NSMutableAttributedString alloc] initWithString:@"”" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 36.0],NSForegroundColorAttributeName: [UIColor colorWithRed:30/255.0 green:23/255.0 blue:13/255.0 alpha:1.0]}];
    
    self.detailLeftRight.attributedText = rightstring;
    
    NSMutableAttributedString *detail = [[NSMutableAttributedString alloc] initWithString:@"拿铁咖啡是意大利浓缩咖啡(Espresso)与牛奶的经典混合，意大利人也很喜欢把拿铁作为早餐的饮料。意大利人早晨的厨房里，照得到阳光的炉子上通常会同时煮着咖啡和牛奶。" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];

    self.detailLabel.attributedText = detail;
}

@end
