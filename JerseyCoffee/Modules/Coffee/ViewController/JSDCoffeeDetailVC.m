//
//  JSDCoffeeDetailVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeDetailVC.h"

@interface JSDCoffeeDetailVC ()

@property (weak, nonatomic) IBOutlet UIView *coffeeImageContentView;
@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;

@property (weak, nonatomic) IBOutlet UIView *showTextContentView;
@property (weak, nonatomic) IBOutlet UIView *textContentView;
@property (weak, nonatomic) IBOutlet UILabel *coffeeCNNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeENNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *espressoCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *espressoENLabel;
@property (weak, nonatomic) IBOutlet UILabel *milkCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *milkENLabel;
@property (weak, nonatomic) IBOutlet UILabel *waterCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *waterENLabel;

@end

@implementation JSDCoffeeDetailVC

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
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.navigationItem.title = self.model.coffeeCNName;
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    self.coffeeImageContentView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.showTextContentView.backgroundColor = [UIColor whiteColor];
    self.textContentView.backgroundColor = [UIColor whiteColor];
    
    self.showTextContentView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1].CGColor;
//    self.showTextContentView.layer.shadowColor =
    if (IphoneScale == 3) {
        self.showTextContentView.layer.cornerRadius = 15;
        self.showTextContentView.layer.shadowRadius = 15;
        self.showTextContentView.layer.shadowOffset = CGSizeMake(0,3);
        self.showTextContentView.layer.shadowOpacity = 1;
    } else {
        self.showTextContentView.layer.cornerRadius = 10;
        self.showTextContentView.layer.shadowRadius = 10;
        self.showTextContentView.layer.shadowOffset = CGSizeMake(0,2);
        self.showTextContentView.layer.shadowOpacity = 1;
    }
    
    self.coffeeCNNameLabel.font = [UIFont jsd_fontSize:24];
    self.coffeeCNNameLabel.textColor = [UIColor jsd_mainTextColor];
    
    self.coffeeENNameLabel.font = [UIFont jsd_fontSize:14];
    self.coffeeENNameLabel.textColor = [UIColor jsd_detailTextColor];
    
    self.espressoCNLabel.font = [UIFont jsd_fontSize:14];
    self.espressoCNLabel.textColor = [UIColor jsd_mainTextColor];
    
    self.espressoENLabel.font = [UIFont jsd_fontSize:14];
    self.espressoENLabel.textColor = [UIColor jsd_detailTextColor];
    
    self.milkCNLabel.font = [UIFont jsd_fontSize:14];
    self.milkCNLabel.textColor = [UIColor jsd_mainTextColor];
    
    self.milkENLabel.font = [UIFont jsd_fontSize:14];
    self.milkENLabel.textColor = [UIColor jsd_detailTextColor];
    
    self.waterCNLabel.font = [UIFont jsd_fontSize:14];
    self.waterCNLabel.textColor = [UIColor jsd_mainTextColor];
    
    self.waterENLabel.font = [UIFont jsd_fontSize:14];
    self.waterENLabel.textColor = [UIColor jsd_detailTextColor];
    
}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
    self.coffeeCNNameLabel.text = self.model.coffeeCNName;
    self.coffeeENNameLabel.text = self.model.coffeeENName;

    self.espressoCNLabel.text = @"浓缩咖啡";
    self.espressoENLabel.text = @"/Roast";
    
    self.milkCNLabel.text = @"牛奶";
    self.milkENLabel.text = @"/Acidity";
    
    self.waterCNLabel.text = @"水";
    self.waterENLabel.text = @"/Body";
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

@end
