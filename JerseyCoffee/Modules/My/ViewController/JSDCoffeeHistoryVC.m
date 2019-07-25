//
//  JSDCoffeeHistoryVC.m
//  JerseyCoffee
//
//  Created by ada on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeHistoryVC.h"

#import "JSDPublic.h"

@interface JSDCoffeeHistoryVC ()

@property (weak, nonatomic) IBOutlet UIImageView *logImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end

@implementation JSDCoffeeHistoryVC

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
    
    self.title = @"咖啡科普";
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    self.logImageView.image = [UIImage imageNamed:@"coffee_tabbar_selected"];
    
    self.titleLabel.font = [UIFont jsd_fontSize: 18];
    self.titleLabel.textColor = [UIColor jsd_mainTextColor];
    
    self.detailLabel.numberOfLines = 0;
}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {

    self.titleLabel.text = @"咖啡的起源";
    
    NSMutableParagraphStyle* style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:15];
    NSMutableAttributedString* detail = [[NSMutableAttributedString alloc] initWithString:@"“咖啡 [1]  ”一词源自希腊语“Kaweh”，意思是“力量与热情”。咖啡树是属茜草科多年生常绿灌木或小乔木 [2]  ，日常饮用的咖啡是用咖啡豆配合各种不同的烹煮器具制作出来的，而咖啡豆就是指咖啡树果实内之果仁，再用适当的烘焙方法烘焙而成。\n    有关咖啡起源的传说各式各样，不过大多因为其荒诞离奇而被人们淡忘了。但是，人们不会忘记，非洲是咖啡的故乡。咖啡树很可能就是在埃塞俄比亚的卡发省（KAFFA）被发现的。后来，一批批的奴隶从非洲被贩卖到也门和阿拉伯半岛，咖啡也就被带到了沿途的各地。可以肯定，也门在15世纪或是更早既已开始种植咖啡了。阿拉伯虽然有着当时世界上最繁华的港口城市摩卡，但却禁止任何种子出口！这道障碍最终被荷兰人突破了，1616年，他们终于将成活的咖啡树和种子偷运到了荷兰，开始在温室中培植。" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 14.0],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];
        [detail addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [detail length])];
//    self.detailLabel.numberOfLines = 0;
//    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    // 行间距设置为20
//    [paragraphStyle setLineSpacing: 15];
//    NSMutableAttributedString *detail = [[NSMutableAttributedString alloc] initWithString:@"拿铁咖啡是意大利浓缩咖啡(Espresso)与牛奶的经典混合，意大利人也很喜欢把拿铁作为早餐的饮料。意大利人早晨的厨房里，照得到阳光的炉子上通常会同时煮着咖啡和牛奶。" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size: 14.0],NSForegroundColorAttributeName: [UIColor colorWithRed:113/255.0 green:120/255.0 blue:130/255.0 alpha:1.0]}];

                                                                                                                                                                                                                                                                                                                                                                                                                                                                         self.detailLabel.attributedText = detail;
    
                                               
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

@end
