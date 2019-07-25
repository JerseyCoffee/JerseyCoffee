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

static CGFloat kUIEdgeInsetsTop = 10;
static CGFloat kUIEdgeInsetsLeft = 40;
static CGFloat kUIEdgeInsetsBottom = 10;
static CGFloat kUIEdgeInsetsRight = 40;
static CGFloat kLineItemSpace = 0;    //水平
static CGFloat kInterItemSpace = 20;    //垂直
static CGFloat kItemLeftShowWidth = 20; //每个 Item 漏出宽度


@interface JSDCoffeeVC ()

@property (nonatomic, strong) MDCPageControl* pageControl;
@property (nonatomic, strong) JSDCoffeeViewModel* viewModel;

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

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.navigationItem.title = @"Coffee";
    self.navigationController.navigationBar.hidden = YES;
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    [self.view addSubview:self.pageControl];
    
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
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark <UICollectionViewLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((ScreenWidth - kUIEdgeInsetsLeft - kInterItemSpace - kItemLeftShowWidth), self.view.frame.size.height - 250);
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
    [self.pageControl scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self.pageControl scrollViewDidEndScrollingAnimation:scrollView];
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

#pragma mark - 7.GET & SET

- (MDCPageControl *)pageControl {
    
    if (!_pageControl) {
        _pageControl = [[MDCPageControl alloc] init];
        _pageControl.numberOfPages = self.viewModel.listArray.count;
        _pageControl.currentPageIndicatorTintColor = [UIColor jsd_colorWithHexString:@"#8A8987"];
        _pageControl.pageIndicatorTintColor = [UIColor jsd_colorWithHexString:@"#A5A3A1"];
        
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor yellowColor];
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

@end

