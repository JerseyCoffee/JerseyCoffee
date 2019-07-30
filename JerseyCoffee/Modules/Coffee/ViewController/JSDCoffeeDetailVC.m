//
//  JSDCoffeeDetailVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeDetailVC.h"

#import "JSDAddCoffeeItemVC.h"

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

@property (weak, nonatomic) IBOutlet JSDShowNumberView *espressoNumberView;
@property (weak, nonatomic) IBOutlet JSDShowNumberView *milkNumberView;
@property (weak, nonatomic) IBOutlet JSDShowNumberView *waterNumberView;


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

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self setupNavBar];
    [self setupData];
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.navigationItem.title = self.model.coffeeCNName;
    //可编辑
    if (self.model.canEdit) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(onTouchEdit:)];
    }
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
    
    if (self.model.imageName) {
        if ([self.model.imageName containsString:kJSDPhotoImageFiles]) {
            NSLog(@"包含了");
            NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            
            NSString* coffeeName = [NSString stringWithFormat:@"%@/%@.png", documentsDirectory, self.model.imageName];
            UIImage* image = [UIImage imageWithContentsOfFile:coffeeName];
            self.coffeeImageView.image = image;
        } else {
            if (JSDIsString(self.model.imageName)) {
                NSString* imagePath = [JSDBundle pathForResource:self.model.imageName ofType:@"png"];
                self.coffeeImageView.image = [UIImage imageWithContentsOfFile:imagePath];
            } else {
                NSString* imagePath = [JSDBundle pathForResource:@"latte_coffee" ofType:@"png"];
                self.coffeeImageView.image = [UIImage imageWithContentsOfFile:imagePath];
            }
        }
    }
    self.coffeeCNNameLabel.text = self.model.coffeeCNName;
    self.coffeeENNameLabel.text = self.model.coffeeENName;

    self.espressoCNLabel.text = @"浓缩咖啡";
    self.espressoENLabel.text = @"/Roast";
    
    self.milkCNLabel.text = @"牛奶";
    self.milkENLabel.text = @"/Acidity";
    
    self.waterCNLabel.text = @"水";
    self.waterENLabel.text = @"/Body";
    
    [self.espressoNumberView updateNumber:self.model.expressoNumber];
    [self.milkNumberView updateNumber:self.model.milkNumber];
    [self.waterNumberView updateNumber:self.model.waterNumber];
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

- (void)onTouchEdit:(id)sender {
    
    JSDAddCoffeeItemVC* coffeeEditVC = [[JSDAddCoffeeItemVC alloc] init];
    coffeeEditVC.model = self.model;
    
    [self.navigationController pushViewController:coffeeEditVC animated:YES];
}

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

@end

