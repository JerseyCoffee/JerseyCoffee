//
//  JSDAddEditKitVC.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/30.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDAddEditKitVC.h"

@interface JSDAddEditKitVC ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollerViewContentView;

@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet MDCButton *addCoffeeButton;

@property (weak, nonatomic) IBOutlet MDCTextField *kitCNNameTextField;
@property (nonatomic, strong) MDCTextInputControllerUnderline* kitCNNameController;
@property (weak, nonatomic) IBOutlet MDCTextField *kitENNameTextField;
@property (nonatomic, strong) MDCTextInputControllerUnderline* kitENNameController;
@property (weak, nonatomic) IBOutlet MDCMultilineTextField *kitIntroTextField;
@property (nonatomic, strong) MDCTextInputControllerUnderline* kitIntroController;

@property (weak, nonatomic) IBOutlet MDCMultilineTextField *kitStepTextField;
@property (nonatomic, strong) MDCTextInputControllerUnderline* kitStepController;

@property (nonatomic, assign) BOOL havaImage;

@end

@implementation JSDAddEditKitVC

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
        self.title = @"编辑器具";
    } else {
        self.title = @"添加器具";
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
    
    [self kitCNNameController];
    [self kitENNameController];
    [self kitIntroController];
    [self kitStepController];
    
    self.coffeeImageView.backgroundColor = [UIColor jsd_grayColor];
    NSString* path = [JSDBundle pathForResource:@"selected_photo" ofType:@"png"];
    self.coffeeImageView.image = [UIImage imageNamed:path];
    self.coffeeImageView.contentMode = UIViewContentModeScaleToFill;
    self.addCoffeeButton.backgroundColor = [UIColor clearColor];
    self.coffeeImageView.layer.cornerRadius = 5;
    self.coffeeImageView.layer.masksToBounds = YES;
    self.addCoffeeButton.layer.masksToBounds = YES;
    self.addCoffeeButton.layer.cornerRadius = 5;
    
    [self.addCoffeeButton addTarget:self action:@selector(onTouchAddCoffee:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
    if (self.model.canEdit) {
        NSLog(@"包含了");
        if (JSDIsString(self.model.kitImageName)) {
            NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            
            NSString* coffeeName = [NSString stringWithFormat:@"%@/%@.png", documentsDirectory, self.model.kitImageName];
            UIImage* image = [UIImage imageWithContentsOfFile:coffeeName];
            self.coffeeImageView.image = image;
        }
    }
    self.kitCNNameTextField.text = self.model.kitCNName;
    self.kitENNameTextField.text = self.model.kitENName;
    self.kitIntroTextField.text = self.model.kitDetail;
    self.kitStepTextField.text = self.model.step;
    
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

- (void)onTouchSave:(id) sender {
    
    BOOL havakitName = JSDIsString(self.kitCNNameTextField.text);
    BOOL havaImageView = self.coffeeImageView.image;
    if (havakitName && havaImageView) {
        if (self.model.canEdit) {
            [self updatekit];
        } else {
            [self addkit];
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

- (void)onTouchAddCoffee:(id) sender {
    
    [JSDPhotoManage presentWithViewController:self sourceType:YZHImagePickerSourceTypePhotoLibrary finishPicking:^(UIImage * _Nonnull image) {
        if (image) {
            self.havaImage = YES;
            self.coffeeImageView.image = image;
        } else {
        }
    }];
}

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

- (void)updatekit {
    
    JSDKitTypeViewModel* viewModel = [[JSDKitTypeViewModel alloc] init];
    if (self.havaImage) {
        //TODO: 保存相片写法有坑
        self.coffeeImageView.animationRepeatCount = viewModel.listArray.count;
        NSString* kitFileName = self.kitCNNameTextField.text;
        [JSDPhotoManage savaKitImageView:self.coffeeImageView fileName:kitFileName];
        
        NSString* kitName = [NSString stringWithFormat:@"%@%@", kJSDKitImageFiles, kitFileName];
        self.model.kitImageName = kitName;
    }
    self.model.kitCNName = self.kitCNNameTextField.text;
    self.model.kitENName = self.kitENNameTextField.text;
    self.model.kitDetail = self.kitIntroTextField.text;
    self.model.step = self.kitStepTextField.text;
    
    [viewModel editDataKit:self.model];
    // 添加完成
    [self.navigationController popViewControllerAnimated:YES];
    MDCSnackbarManager* manager = [MDCSnackbarManager defaultManager];
    MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText: @"咖啡器具已编辑成功, 可在列表进行查看"];
    [manager showMessage:message];
}

- (void)addkit {
    
    JSDKitTypeViewModel* viewModel = [[JSDKitTypeViewModel alloc] init];
    if (self.havaImage) {
        //TODO: 保存相片写法有坑
        self.coffeeImageView.animationRepeatCount = viewModel.listArray.count;
        NSString* kitFileName = self.kitCNNameTextField.text;
        [JSDPhotoManage savaKitImageView:self.coffeeImageView fileName:kitFileName];
        
        NSString* kitName = [NSString stringWithFormat:@"%@%@", kJSDKitImageFiles, kitFileName];
        self.model.kitImageName = kitName;
    }
    self.model.kitCNName = self.kitCNNameTextField.text;
    self.model.kitENName = self.kitENNameTextField.text;
    self.model.kitDetail = self.kitIntroTextField.text;
    self.model.step = self.kitStepTextField.text;
    self.model.canEdit = YES;
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    self.model.kitID = currentDateString;
    
    [viewModel addDateKit:self.model];
    
    // 添加完成
    [self.navigationController popViewControllerAnimated:YES];
    MDCSnackbarManager* manager = [MDCSnackbarManager defaultManager];
    MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText: @"咖啡器具已添加成功, 可在列表进行查看"];
    [manager showMessage:message];
}

#pragma mark - 7.GET & SET

- (MDCTextInputControllerUnderline *)kitCNNameController {
    
    if (!_kitCNNameController) {
        
        _kitCNNameController = [[MDCTextInputControllerUnderline alloc] initWithTextInput: self.kitCNNameTextField];
        _kitCNNameController.activeColor = [UIColor blueColor];
        _kitCNNameController.normalColor = ColorWithFROMRGB(0xdddddd, 1);
        _kitCNNameController.borderFillColor = [UIColor whiteColor];
        _kitCNNameController.placeholderText = @"器具名称(建议最长15个字符)";
        _kitCNNameController.characterCountMax = 15;
        _kitCNNameController.roundedCorners = UIRectCornerAllCorners;
    }
    return _kitCNNameController;
}

- (MDCTextInputControllerUnderline *)kitENNameController {
    
    if (!_kitENNameController) {
        
        _kitENNameController = [[MDCTextInputControllerUnderline alloc] initWithTextInput: self.kitENNameTextField];
        _kitENNameController.activeColor = [UIColor blueColor];
        _kitENNameController.normalColor = ColorWithFROMRGB(0xdddddd, 1);
        _kitENNameController.borderFillColor = [UIColor whiteColor];
        _kitENNameController.placeholderText = @"器具英文名称(选填)";
        //        _kitENNameController.characterCountMax = 15;
        _kitENNameController.roundedCorners = UIRectCornerAllCorners;
    }
    return _kitENNameController;
}

- (MDCTextInputControllerUnderline *)kitIntroController {
    
    if (!_kitIntroController) {
        
        _kitIntroController = [[MDCTextInputControllerUnderline alloc] initWithTextInput: self.kitIntroTextField];
        _kitIntroController.activeColor = [UIColor blueColor];
        _kitIntroController.normalColor = ColorWithFROMRGB(0xdddddd, 1);
        _kitIntroController.borderFillColor = [UIColor whiteColor];
        _kitIntroController.placeholderText = @"器具描述(选填)";
        //        _kitIntroController.characterCountMax = 15;
        _kitIntroController.roundedCorners = UIRectCornerAllCorners;
    }
    return _kitIntroController;
}

- (MDCTextInputControllerUnderline *)kitStepController {
    
    if (!_kitStepController) {
        
        _kitStepController = [[MDCTextInputControllerUnderline alloc] initWithTextInput: self.kitStepTextField];
        _kitStepController.activeColor = [UIColor blueColor];
        _kitStepController.normalColor = ColorWithFROMRGB(0xdddddd, 1);
        _kitStepController.borderFillColor = [UIColor whiteColor];
        _kitStepController.placeholderText = @"使用步骤(选填)";
        //        _kitIntroController.characterCountMax = 15;
        _kitStepController.roundedCorners = UIRectCornerAllCorners;
    }
    return _kitStepController;
}

- (JSDKitTypeModel *)model {
    
    if (!_model) {
        _model = [[JSDKitTypeModel alloc] init];
    }
    return _model;
}

@end
