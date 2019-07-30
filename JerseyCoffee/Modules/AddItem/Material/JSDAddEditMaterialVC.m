//
//  JSDAddEditMaterialVC.m
//  Jerseymaterial
//
//  Created by Jersey on 2019/7/29.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDAddEditMaterialVC.h"

#import "JSDSelectedNumberView.h"

@interface JSDAddEditMaterialVC ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollerViewContentView;

@property (weak, nonatomic) IBOutlet MDCTextField *materialCNNameTextField;
@property (nonatomic, strong) MDCTextInputControllerUnderline* materialCNNameController;
@property (weak, nonatomic) IBOutlet MDCTextField *materialENNameTextField;
@property (nonatomic, strong) MDCTextInputControllerUnderline* materialENNameController;

@property (weak, nonatomic) IBOutlet UIView *materialParameterView;
@property (weak, nonatomic) IBOutlet MDCMultilineTextField *materialIntroTextField;
@property (nonatomic, strong) MDCTextInputControllerUnderline* materialIntroController;

@property (weak, nonatomic) IBOutlet JSDSelectedNumberView *bakeNumberView;
@property (weak, nonatomic) IBOutlet JSDSelectedNumberView *sourNumberView;
@property (weak, nonatomic) IBOutlet JSDSelectedNumberView *chunNumberView;


@end

@implementation JSDAddEditMaterialVC

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
    
    if (self.model.canEdit) {
        self.title = @"编辑豆子";
    } else {
        self.title = @"添加豆子";
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(onTouchSave:)];
    
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    self.scrollView.backgroundColor = [UIColor jsd_mainGrayColor];
    self.scrollerViewContentView.backgroundColor = [UIColor jsd_mainGrayColor];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTouchContentView:)];
    
    [self.scrollerViewContentView addGestureRecognizer:tap];
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    [self materialCNNameController];
    [self materialENNameController];
    [self materialIntroController];
    
    self.materialParameterView.layer.cornerRadius = 5;
    self.materialParameterView.layer.masksToBounds = YES;
}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
    self.materialCNNameTextField.text = self.model.materialName;
    self.materialENNameTextField.text = self.model.materialENName;
    self.materialIntroTextField.text = self.model.materialDetail;
    
    [self.bakeNumberView updateNumber:self.model.bakeNumber];
    [self.sourNumberView updateNumber:self.model.sourNumber];
    [self.chunNumberView updateNumber:self.model.chunNumber];
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

- (void)onTouchSave:(id) sender {
    
    BOOL havamaterialName = JSDIsString(self.materialCNNameTextField.text);
    if (havamaterialName) {
        if (self.model.canEdit) {
            [self updateMaterial];
        } else {
            [self addMaterial];
        }
    } else {
        MDCSnackbarManager* snackManger = [MDCSnackbarManager defaultManager];
        MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText:@"咖啡名称"];
        [snackManger showMessage:message];
    }
}

- (void)onTouchContentView:(id)sender {
    
    [self.view endEditing:YES];
}

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

- (void)updateMaterial {
    
    self.model.materialName = self.materialCNNameTextField.text;
    self.model.materialENName = self.materialENNameTextField.text;
    self.model.materialDetail = self.materialIntroTextField.text;
    self.model.bakeNumber = self.bakeNumberView.currentNumber;
    self.model.sourNumber = self.sourNumberView.currentNumber;
    self.model.chunNumber = self.chunNumberView.currentNumber;
    
    JSDMaterialViewModel* viewModel = [[JSDMaterialViewModel alloc] init];
    [viewModel editDataMaterial:self.model];
    
    // 添加完成
    [self.navigationController popViewControllerAnimated:YES];
    MDCSnackbarManager* manager = [MDCSnackbarManager defaultManager];
    MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText: @"豆子品种已编辑成功, 可在列表进行查看"];
    [manager showMessage:message];
}

- (void)addMaterial {
    
    self.model.materialName = self.materialCNNameTextField.text;
    self.model.materialENName = self.materialENNameTextField.text;
    self.model.materialDetail = self.materialIntroTextField.text;
    self.model.bakeNumber = self.bakeNumberView.currentNumber;
    self.model.sourNumber = self.sourNumberView.currentNumber;
    self.model.chunNumber = self.chunNumberView.currentNumber;
    self.model.canEdit = YES;
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    self.model.materialID = currentDateString;
    
    JSDMaterialViewModel* viewModel = [[JSDMaterialViewModel alloc] init];
    [viewModel addDateMaterial:self.model];
    
    // 添加完成
    [self.navigationController popViewControllerAnimated:YES];
    MDCSnackbarManager* manager = [MDCSnackbarManager defaultManager];
    MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText: @"咖啡品种已添加成功, 可在列表进行查看"];
    [manager showMessage:message];
}

#pragma mark - 7.GET & SET

- (MDCTextInputControllerUnderline *)materialCNNameController {
    
    if (!_materialCNNameController) {
        
        _materialCNNameController = [[MDCTextInputControllerUnderline alloc] initWithTextInput: self.materialCNNameTextField];
        _materialCNNameController.activeColor = [UIColor blueColor];
        _materialCNNameController.normalColor = ColorWithFROMRGB(0xdddddd, 1);
        _materialCNNameController.borderFillColor = [UIColor whiteColor];
        _materialCNNameController.placeholderText = @"豆子名称(建议最长15个字符)";
        _materialCNNameController.characterCountMax = 15;
        _materialCNNameController.roundedCorners = UIRectCornerAllCorners;
    }
    return _materialCNNameController;
}

- (MDCTextInputControllerUnderline *)materialENNameController {
    
    if (!_materialENNameController) {
        
        _materialENNameController = [[MDCTextInputControllerUnderline alloc] initWithTextInput: self.materialENNameTextField];
        _materialENNameController.activeColor = [UIColor blueColor];
        _materialENNameController.normalColor = ColorWithFROMRGB(0xdddddd, 1);
        _materialENNameController.borderFillColor = [UIColor whiteColor];
        _materialENNameController.placeholderText = @"豆子英文名称(选填)";
        //        _materialENNameController.characterCountMax = 15;
        _materialENNameController.roundedCorners = UIRectCornerAllCorners;
    }
    return _materialENNameController;
}

- (MDCTextInputControllerUnderline *)materialIntroController {
    
    if (!_materialIntroController) {
        
        _materialIntroController = [[MDCTextInputControllerUnderline alloc] initWithTextInput: self.materialIntroTextField];
        _materialIntroController.activeColor = [UIColor blueColor];
        _materialIntroController.normalColor = ColorWithFROMRGB(0xdddddd, 1);
        _materialIntroController.borderFillColor = [UIColor whiteColor];
        _materialIntroController.placeholderText = @"咖啡故事(选填)";
        //        _materialIntroController.characterCountMax = 15;
        _materialIntroController.roundedCorners = UIRectCornerAllCorners;
    }
    return _materialIntroController;
}

- (JSDMaterialModel *)model {
    
    if (!_model) {
        _model = [[JSDMaterialModel alloc] init];
    }
    return _model;
}

@end


