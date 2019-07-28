//
//  JSDCoffeeCollectionViewCell.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/23.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeCollectionViewCell.h"

#import "JSDPhotoManage.h"

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
    
    self.titleCNLabel.textColor = [UIColor jsd_mainTextColor];
    self.titleCNLabel.font = [UIFont jsd_fontSize:24];

    self.titleENLabel.textColor = [UIColor jsd_detailTextColor];
    self.titleENLabel.font = [UIFont jsd_fontSize:14];
    
    self.detailLeftLabel.textColor = [UIColor jsd_mainTextColor];
    self.detailLeftLabel.font = [UIFont jsd_fontSize:36];
    
    self.detailLeftRight.textColor = [UIColor jsd_mainTextColor];
    self.detailLeftRight.font = [UIFont jsd_fontSize:36];


    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为20
    [paragraphStyle setLineSpacing: 15];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"拿铁咖啡是意大利浓缩咖啡(Espresso)与牛奶的经典混合，意大利人也很喜欢把拿铁作为早餐的饮料。意大利人早晨的厨房里，照得到阳光的炉子上通常会同时煮着咖啡和牛奶。" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 14.0],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];
    [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    
    self.detailLabel.attributedText = string;
}

- (void)setModel:(JSDCoffeeModel *)model {
    
    _model = model;
    
    if (model.imageName) {
        if ([model.imageName containsString:kJSDPhotoImageFiles]) {
            NSLog(@"包含了");
            NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            
            NSString* coffeeName = [NSString stringWithFormat:@"%@/%@.png", documentsDirectory, model.imageName];
            UIImage* image = [UIImage imageWithContentsOfFile:coffeeName];
            self.coffeeImageView.image = image;
        } else {
            NSString* imagePath = [JSDBundle pathForResource:model.imageName ofType:@"png"];
            self.coffeeImageView.image = [UIImage imageWithContentsOfFile:imagePath];
        }
    }
    self.titleCNLabel.text = model.coffeeCNName;
    self.titleENLabel.text = model.coffeeENName;
    
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为20
    [paragraphStyle setLineSpacing: 15];
    NSMutableAttributedString *detail = [[NSMutableAttributedString alloc] initWithString:model.coffeeDetail attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 14.0],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];
    [detail addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [detail length])];
    
    self.detailLabel.attributedText = detail;
}

@end
