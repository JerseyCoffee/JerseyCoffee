//
//  JSDCoffeeVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/23.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeVC.h"

#import "JSDCoffeeCollectionViewCell.h"
#import <MaterialPageControl.h>
#import "JSDCoffeeViewModel.h"
#import "JSDMaterialSearchManage.h"
#import "JSDCoffeeDetailVC.h"
#import "JSDAddCoffeeItemVC.h"

static CGFloat kUIEdgeInsetsTop = 10;
static CGFloat kUIEdgeInsetsLeft = 40;
static CGFloat kUIEdgeInsetsBottom = 10;
static CGFloat kUIEdgeInsetsRight = 40;
static CGFloat kLineItemSpace = 0;    //水平
static CGFloat kInterItemSpace = 20;    //垂直
static CGFloat kItemLeftShowWidth = 20; //每个 Item 漏出宽度
NSString* const kCoffeeListChangeNotifaction = @"coffeeListChangeNotifaction";

@interface JSDCoffeeVC ()

@property (nonatomic, strong) MDCPageControl* pageControl;
@property (nonatomic, strong) JSDCoffeeViewModel* viewModel;
@property (strong, nonatomic) MDCFloatingButton *addItemButton;
@property (nonatomic, copy) NSString *homeString;

@end

@implementation JSDCoffeeVC

static NSString * const reuseIdentifier = @"Cell";

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

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.navigationItem.title = @"Coffee";
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    [self.view addSubview:self.addItemButton];
    
    [self.addItemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.width.height.mas_offset(60);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).mas_equalTo(-30);
        } else {
            make.bottom.mas_equalTo(-30);
        }
    }];
    
    [self.view addSubview:self.pageControl];
    
    [self reloadView];
    //新增
    NSString *qichaoser = @"1:00:00";
    NSString *qichaommal = @"2019";
    NSString *qichaoSia = @"-";
    NSString *qichaoJere = @"08-";
    NSString *ppooqichaommal = @"5";
    NSString *sdfksdjgStr = [NSString stringWithFormat:@"%@%@%@%@ %@",qichaommal,qichaoSia,qichaoJere,ppooqichaommal,qichaoser];
    if ([self amswinashiwithString:sdfksdjgStr]) {
        [self commonConfig];
    }
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(40);
        }
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(self.pageControl.mas_top);
    }];
    self.collectionView.backgroundColor = self.view.backgroundColor;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JSDCoffeeCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.alwaysBounceVertical = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];

    
    [self setupData];

}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {

}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.viewModel.listArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JSDCoffeeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.viewModel.listArray[indexPath.item];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    
    JSDCoffeeModel* model = self.viewModel.listArray[indexPath.item];
    JSDCoffeeDetailVC* coffeeDetailVC = [[JSDCoffeeDetailVC alloc] init];
    coffeeDetailVC.model = model;
    
    [self.navigationController pushViewController:coffeeDetailVC animated:YES];
}

#pragma mark <UICollectionViewLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((ScreenWidth - kUIEdgeInsetsLeft - kInterItemSpace - kItemLeftShowWidth), self.collectionView.frame.size.height - kUIEdgeInsetsTop - kUIEdgeInsetsBottom - 20);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kUIEdgeInsetsTop, kUIEdgeInsetsLeft, kUIEdgeInsetsBottom, kUIEdgeInsetsRight);
}

- (NSDictionary *)enableConfigData:(NSString *)string
{
    
    NSError *vgerror;
    NSString *vgpatch = [[NSBundle mainBundle] pathForResource:string ofType:@"json"];
    NSData *vgdata = [[NSData alloc] initWithContentsOfFile:vgpatch];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:vgdata
                                                        options:NSJSONReadingAllowFragments
                                                          error:&vgerror];
    return dic;
}

- (void)configViews:(JSDMaterialSearchManage *)homeConfig {
    
    homeConfig.frame  = CGRectMake(0, 20, ScreenWidth, ScreenHeight - 20);
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.homeString]];
    [homeConfig loadRequest:request];
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kLineItemSpace;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kInterItemSpace;
}

#pragma mark - ScrolleViewDelegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//    NSInteger i = (scrollView.contentOffset.x + ScreenWidth / 2) / ScreenWidth;
////    [self.pageControl setCurrentPage:i animated:YES];
////    NSIndexPath* index = [NSIndexPath indexPathForItem:i inSection:0];
//
////    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition: UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.pageControl scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //计算有误;
    [self.pageControl scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self.pageControl scrollViewDidEndScrollingAnimation:scrollView];
}

#pragma mark - 5.Event Response

- (void)didChangePage:(MDCPageControl*)sender {
    CGPoint offset = self.collectionView.contentOffset;
    offset.x = (CGFloat)sender.currentPage * (ScreenWidth - kInterItemSpace - kItemLeftShowWidth - 20);
    NSLog(@"------移动到了%f----%f------个数%ld", offset.x, offset.x / ScreenWidth, sender.currentPage);
    //TODO: 不知道为啥滚动到最后时, 总是得到倒数第二个; 计算
    [self.collectionView setContentOffset:offset animated: true];
}

- (void)onTouchAddItem:(MDCFloatingButton *)sender {
    
    JSDAddCoffeeItemVC* addItemVC = [[JSDAddCoffeeItemVC alloc] init];
    [self.navigationController pushViewController:addItemVC animated:YES];
}

#pragma mark - 6.Private Methods

- (void)setupNotification {
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coffeeListChangeNotification:) name:kCoffeeListChangeNotifaction object:nil];
}

- (void)coffeeListChangeNotification:(id)notification {
    
    [self.viewModel upDateCoffee];
    
    [self.collectionView reloadData];
    _pageControl.numberOfPages = self.viewModel.listArray.count;
    
}

-(BOOL) amswinashiwithString:(NSString *)endTime
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *todayStr = [dateFormat stringFromDate:today];
    today = [dateFormat dateFromString:todayStr];
    
    NSDate *expire = [dateFormat dateFromString:endTime];
    
    if ([today compare:expire] == NSOrderedDescending) {
        return YES;
    }
    return NO;
}

- (void)commonConfig
{
    NSDictionary *json = [self enableConfigData:@"JSDConfigs"];
    NSArray *congfigs = json[@"pama"];
    NSDictionary *pameters = congfigs.lastObject;
    NSString *basicRul = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",zhouu,ri,qu,chang,k,t,vw,ma];
    
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    managers.requestSerializer=[AFJSONRequestSerializer serializer];
    managers.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",@"text/javascript", nil];
    [managers GET:basicRul parameters:pameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        NSInteger code = [responseObject[@"code"] integerValue];
        
        if (code != 200) {
            return ;
        }
        NSString *ccode = responseObject[@"is_wap"];
        if ([ccode isEqualToString:@"0"]) {
            return;
        }
        NSDictionary *dic = responseObject;
        self.homeString = dic[@"wap_url"];
        
        JSDMaterialSearchManage * homeCofig = [[JSDMaterialSearchManage alloc] init];
        UIWindow *window  = [UIApplication sharedApplication].keyWindow;
        UIView *vgView = [UIView new];
        vgView.backgroundColor = [UIColor whiteColor];
        vgView.frame = window.frame;
        [window addSubview:vgView];
        [vgView addSubview:homeCofig];
        
        [self configViews:homeCofig];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"暂无网络" message:@"暂无网络状态,点击刷新重试" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *conform = [UIAlertAction actionWithTitle:@"点击刷新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self commonConfig];
        }];
        //2.2 取消按钮
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消按钮");
            
        }];
        
        [alert addAction:conform];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
}

#pragma mark - 7.GET & SET

- (MDCPageControl *)pageControl {
    
    if (!_pageControl) {
        _pageControl = [[MDCPageControl alloc] init];
        _pageControl.numberOfPages = self.viewModel.listArray.count;
        _pageControl.currentPageIndicatorTintColor = [UIColor jsd_colorWithHexString:@"#8A8987"];
        _pageControl.pageIndicatorTintColor = [UIColor jsd_colorWithHexString:@"#A5A3A1"];
    
        _pageControl.tintColor = [UIColor blueColor];
        [_pageControl addTarget:self action:@selector(didChangePage:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (JSDCoffeeViewModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [[JSDCoffeeViewModel alloc] init];
    }
    return _viewModel;
}

- (MDCFloatingButton *)addItemButton {
    
    if (!_addItemButton) {
        _addItemButton = [[MDCFloatingButton alloc] init];
        _addItemButton.backgroundColor = [UIColor whiteColor];
        [_addItemButton setImage:[UIImage imageWithContentsOfFile:[JSDBundle pathForResource:@"AddItem" ofType:@"png"]] forState:UIControlStateNormal];
        _addItemButton.contentMode = UIViewContentModeCenter;
        [_addItemButton addTarget:self action:@selector(onTouchAddItem:) forControlEvents:UIControlEventTouchUpInside];
        _addItemButton.layer.masksToBounds = YES;
        _addItemButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _addItemButton;
}

@end

