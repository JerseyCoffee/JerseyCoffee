//
//  JSDMaterialVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/23.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDMaterialVC.h"

#import "JSDMaterialCell.h"
#import "JSDMaterialTextView.h"
#import <MaterialPageControl.h>
#import "JSDMaterialViewModel.h"

static CGFloat kUIEdgeInsetsTop = 10;
static CGFloat kUIEdgeInsetsLeft = 40;
static CGFloat kUIEdgeInsetsBottom = 10;
static CGFloat kUIEdgeInsetsRight = 40;
static CGFloat kLineItemSpace = 0;    //水平
static CGFloat kInterItemSpace = 20;    //垂直
static CGFloat kItemLeftShowWidth = 20; //每个 Item 漏出宽度

@interface JSDMaterialVC ()

@property (nonatomic, strong) JSDMaterialTextView* textView;
@property (nonatomic, strong) MDCPageControl* pageControl;
@property (nonatomic, strong) JSDMaterialViewModel* viewModel;


@end

@implementation JSDMaterialVC

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

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.navigationItem.title = @"Material";
    self.navigationController.navigationBar.hidden = YES;
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    self.collectionView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.styler.cellStyle = MDCCollectionViewCellStyleCard;
    self.styler.cardBorderRadius = 20;

    [self.view addSubview:self.textView];
    [self.view addSubview:self.pageControl];
    self.textView.backgroundColor = [UIColor jsd_mainGrayColor];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.mas_equalTo(46);
        }
        make.height.mas_equalTo(250);
    }];
    
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
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.textView.mas_bottom).mas_equalTo(20);
        make.bottom.mas_equalTo(self.pageControl.mas_top);
    }];

    [self.collectionView registerNib:[UINib nibWithNibName:@"JSDMaterialCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    
    UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.collectionView.alwaysBounceVertical = NO;
    
}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
    self.textView.model = self.viewModel.listArray.firstObject;
    
    //KVO 观察失败; 其重写了 set 方法. 没有发出通知;
    [self.pageControl addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.viewModel.listArray.count;;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSDMaterialCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.model = self.viewModel.listArray[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(8.0)) {
    
    NSLog(@"当前正在准备展示%ld", indexPath.item);
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"当前正在展示%ld", indexPath.item);
}

#pragma mark <UICollectionViewDelegate>

#pragma mark <UICollectionViewLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((ScreenWidth - kUIEdgeInsetsLeft - kInterItemSpace - kItemLeftShowWidth), collectionView.frame.size.height - 40);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(kUIEdgeInsetsTop, kUIEdgeInsetsLeft, kUIEdgeInsetsBottom, kUIEdgeInsetsRight);
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.pageControl scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.pageControl scrollViewDidEndDecelerating:scrollView];
    //更新 View
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self.pageControl scrollViewDidEndScrollingAnimation:scrollView];
    // 更新View
}

#pragma mark - 5.Event Response

- (void)didChangePage:(MDCPageControl*)sender {
    
    CGPoint offset = self.collectionView.contentOffset;
    offset.x = (CGFloat)sender.currentPage * (ScreenWidth - kInterItemSpace - kItemLeftShowWidth - 20);
    [self.collectionView setContentOffset:offset animated: true];
}

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSInteger number = change[NSKeyValueChangeNewKey];
    
    NSLog(@"当前滚到了%ld", number);
}

#pragma mark - 7.GET & SET

- (JSDMaterialTextView *)textView {
    
    if (!_textView) {
        _textView = [[NSBundle mainBundle] loadNibNamed:@"JSDMaterialTextView" owner:nil options:nil].lastObject;
    }
    return _textView;
}

- (MDCPageControl *)pageControl {
    
    if (!_pageControl) {
        _pageControl = [[MDCPageControl alloc] init];
        _pageControl.numberOfPages = self.viewModel.listArray.count;
//        _pageControl.currentPageIndicatorTintColor = [UIColor jsd_colorWithHexString:@"#8A8987"];
//        _pageControl.pageIndicatorTintColor = [UIColor jsd_colorWithHexString:@"#A5A3A1"];
//
//        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//        _pageControl.pageIndicatorTintColor = [UIColor yellowColor];
//        _pageControl.tintColor = [UIColor blueColor];
        [_pageControl addTarget:self action:@selector(didChangePage:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _pageControl;
}

- (JSDMaterialViewModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [[JSDMaterialViewModel alloc] init];
    }
    return _viewModel;
}

@end

