//
//  JSDKitTypeStepVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/26.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDKitTypeStepVC.h"

@interface JSDKitTypeStepVC ()

@property (weak, nonatomic) IBOutlet UIView *showImageViewContentView;
@property (weak, nonatomic) IBOutlet UIImageView *kitImageView;
@property (weak, nonatomic) IBOutlet UILabel *kitNameLabel;
@property (weak, nonatomic) IBOutlet UIView *stepContentView;
@property (weak, nonatomic) IBOutlet UIView *stepTextContentView;
@property (weak, nonatomic) IBOutlet UILabel *stepTextLabel;

@end

@implementation JSDKitTypeStepVC

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
    self.navigationItem.title = @"使用指南";
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    self.showImageViewContentView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.kitImageView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.stepTextContentView.backgroundColor = [UIColor whiteColor];
    self.stepContentView.backgroundColor = [UIColor whiteColor];
    self.stepContentView.backgroundColor = [UIColor whiteColor];
    
    if (IphoneScale == 3) {
        self.stepContentView.layer.cornerRadius = 25;
        self.stepContentView.layer.shadowRadius = 15;
        self.stepContentView.layer.shadowOffset = CGSizeMake(0,3);
        self.stepContentView.layer.shadowOpacity = 1;
    } else {
        self.stepContentView.layer.cornerRadius = 20;
        self.stepContentView.layer.shadowRadius = 10;
        self.stepContentView.layer.shadowOffset = CGSizeMake(0,2);
        self.stepContentView.layer.shadowOpacity = 1;
    }
    
    self.kitNameLabel.font = [UIFont jsd_fontSize:24];
    self.kitNameLabel.textColor = [UIColor whiteColor];
}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
    if (JSDIsString(self.model.kitImageName)) {
        NSString* path = [JSDBundle pathForResource:self.model.kitImageName ofType:@"png"];
        self.kitImageView.image = [UIImage imageWithContentsOfFile:path];
    }
    
    self.kitNameLabel.text = self.model.kitCNName;
    
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为20
    [paragraphStyle setLineSpacing: 15];
    [paragraphStyle setLineSpacing: 15];
    NSMutableAttributedString *detail;
    if (JSDIsString(self.model.step)) {
        detail = [[NSMutableAttributedString alloc] initWithString:self.model.step attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 14.0],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];
    }
    [detail addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [detail length])];
    
    self.stepTextLabel.numberOfLines = 0;
    self.stepTextLabel.attributedText = detail;
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

@end

