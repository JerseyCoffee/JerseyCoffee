//
//  JSDCoffeeVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/23.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDCoffeeVC.h"

#import "JSDCoffeeCollectionViewCell.h"
@interface JSDCoffeeVC ()

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
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    self.collectionView.backgroundColor = self.view.backgroundColor;
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        if (@available(iOS 11.0,*)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }else{
            make.bottom.mas_equalTo(0);
        }
    }];
//    [self.collectionView registerClass:[JSDCoffeeCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"JSDCoffeeCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.alwaysBounceVertical = NO;
    
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

    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSDCoffeeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    

    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark <UICollectionViewLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((ScreenWidth - 80), self.view.frame.size.height - 250);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 40, 30, 20);
//    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

#pragma mark - ScrolleViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger i = (scrollView.contentOffset.x + ScreenWidth / 2) / ScreenWidth;
    NSIndexPath* index = [NSIndexPath indexPathForItem:i inSection:0];
    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition: UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//
//    NSInteger i = (scrollView.contentOffset.x + ScreenWidth / 2) / ScreenWidth;
////    NSLog(@"%ld", i);
//    NSIndexPath* index = [NSIndexPath indexPathForItem:i inSection:0];
//    if (i) {
////        [self.collectionView setContentOffset: CGPointMake((ScreenWidth * (i)), 0)];
//        NSLog(@"%f", self.collectionView.contentOffset.x);
//
//
//    } else {
////        [self.collectionView setContentOffset: CGPointMake(0, 0)];
//        NSLog(@"%f", self.collectionView.contentOffset.x);
//    }
//    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition: UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//}

//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//
//    NSInteger i = (scrollView.contentOffset.x + ScreenWidth / 2) / ScreenWidth;
//    NSIndexPath* index = [NSIndexPath indexPathForItem:i inSection:0];
//    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition: UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//}

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

@end

