//
//  JSDMaterialDetailVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDMaterialDetailVC.h"

@interface JSDMaterialDetailVC ()

@property (weak, nonatomic) IBOutlet UIView *showImageContenView;
@property (weak, nonatomic) IBOutlet UILabel *coffeeTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet UIView *showTextContentView;
@property (weak, nonatomic) IBOutlet UIView *textContentView;
@property (weak, nonatomic) IBOutlet UILabel *storyDetailLabel;

@end

@implementation JSDMaterialDetailVC

#pragma mark - 1.View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.设置导航栏
    [self setupNavBar];
    //2.设置view
    [self setupView];
    //3.请求数据
    [self setupData];
    //4.设置通知
    [self setupNotification];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.navigationItem.title = @"咖啡故事";
    
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    self.showImageContenView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.showTextContentView.backgroundColor = [UIColor whiteColor];
    self.textContentView.backgroundColor = [UIColor whiteColor];
    
    if (IphoneScale == 3) {
        self.showTextContentView.layer.cornerRadius = 25;
        self.showTextContentView.layer.shadowRadius = 15;
        self.showTextContentView.layer.shadowOffset = CGSizeMake(0,3);
        self.showTextContentView.layer.shadowOpacity = 1;
    } else {
        self.showTextContentView.layer.cornerRadius = 20;
        self.showTextContentView.layer.shadowRadius = 10;
        self.showTextContentView.layer.shadowOffset = CGSizeMake(0,2);
        self.showTextContentView.layer.shadowOpacity = 1;
    }
    
    self.coffeeTitleLabel.font = [UIFont jsd_fontSize:24];
    self.coffeeTitleLabel.textColor = [UIColor whiteColor];
}

- (void)reloadView {
    
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
    self.coffeeTitleLabel.text = self.model.materialName;
    
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为20
    [paragraphStyle setLineSpacing: 15];
    NSMutableAttributedString *detail = [[NSMutableAttributedString alloc] initWithString:@"拿铁咖啡是意大利浓缩咖啡(Espresso)与牛奶的经典混合，意大利人也很喜欢把拿铁作为早餐的饮料。意大利人早晨的厨房里，照得到阳光的炉子上通常会同时煮着咖啡和牛奶。" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 14.0],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];
    [detail addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [detail length])];
    
    self.storyDetailLabel.numberOfLines = 0;
    self.storyDetailLabel.attributedText = detail;
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

@end

