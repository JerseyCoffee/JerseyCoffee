//
//  JSDMyCenterVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/23.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDMyCenterVC.h"

#import "JSDMyCenterViewModel.h"
#import "JSDCollectionViewCell.h"
#import "JSDCoffeeHistoryVC.h"

@interface JSDMyCenterVC ()

@property (strong, nonatomic) JSDMyCenterViewModel *viewModel;

@end

@implementation JSDMyCenterVC

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
    
    self.navigationItem.title = @"个人中心";
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JSDCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor jsd_mainGrayColor];
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
    JSDCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    JSDMyCenterModel* model = self.viewModel.listArray[indexPath.item];
    cell.model = model;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    JSDMyCenterModel* model = self.viewModel.listArray[indexPath.item];
    
    if (model.route) {
        JSDCoffeeHistoryVC* historyVC = [NSClassFromString(model.route) new];
        if ([historyVC isKindOfClass:[JSDCoffeeHistoryVC class]]) {
            historyVC.titleString = model.title;
            historyVC.subTitleString = model.subTitle;
            [self.navigationController pushViewController:historyVC animated:YES];
        } else {
            [self.navigationController pushViewController:historyVC animated:YES];
        }
    }
}

#pragma mark <UICollectionViewLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((ScreenWidth - 20), 60);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(21, 10, 20, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}

#pragma mark <UICollectionViewDelegate>


#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

- (JSDMyCenterViewModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [[JSDMyCenterViewModel alloc] init];
    }
    return _viewModel;
}

@end
