//
//  JSDKitTypeViewCell.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDKitTypeViewCell.h"

@interface JSDKitTypeViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleENLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLeftRight;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation JSDKitTypeViewCell

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
    
}

- (void)setModel:(JSDKitTypeModel *)model {
    
    _model = model;
    
    if (model.kitImageName) {
        if ([model.kitImageName containsString:kJSDKitImageFiles]) {
            NSLog(@"包含了");
            NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            
            NSString* coffeeName = [NSString stringWithFormat:@"%@/%@.png", documentsDirectory, model.kitImageName];
            UIImage* image = [UIImage imageWithContentsOfFile:coffeeName];
            self.coffeeImageView.image = image;
        } else {
            if (JSDIsString(model.kitImageName)) {
                NSString* imagePath = [JSDBundle pathForResource:model.kitImageName ofType:@"png"];
                self.coffeeImageView.image = [UIImage imageWithContentsOfFile:imagePath];
            } else {
                NSString* imagePath = [JSDBundle pathForResource:@"dand" ofType:@"png"];
                self.coffeeImageView.image = [UIImage imageWithContentsOfFile:imagePath];
            }

        }
    }
    
    self.titleCNLabel.text = model.kitCNName;
    self.titleENLabel.text = model.kitENName;
    
    
    if (JSDIsString(model.kitDetail)) {
        NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        // 行间距设置为20
        [paragraphStyle setLineSpacing: 15];
        NSMutableAttributedString *detail;
        detail = [[NSMutableAttributedString alloc] initWithString:model.kitDetail attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 14.0],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];
        
        [detail addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [detail length])];
        
        self.detailLabel.attributedText = detail;
    }
 
}

@end
