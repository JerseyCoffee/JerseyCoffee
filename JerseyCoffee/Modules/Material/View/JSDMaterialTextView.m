//
//  JSDMaterialTextView.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/24.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDMaterialTextView.h"

@interface JSDMaterialTextView ()

@property (weak, nonatomic) IBOutlet UILabel *coffeeNameCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeNameENLabel;
@property (weak, nonatomic) IBOutlet UILabel *bakeCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *backENLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourENLabel;
@property (weak, nonatomic) IBOutlet UILabel *chunCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *chunENLabel;

@end


@implementation JSDMaterialTextView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    
}

@end

/*
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
 
 self.contentView.backgroundColor = [UIColor jsd_mainGrayColor];
 }
 
 @end
 */


