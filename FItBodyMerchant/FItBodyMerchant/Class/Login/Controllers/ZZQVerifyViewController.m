//
//  ZZQVerifyViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/30.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQVerifyViewController.h"
#import <CTAssetsPickerController/CTAssetsGridSelectedView.h>
#import "ZZQLoginUserViewController.h"
#import "ZZQTabBarViewController.h"

@interface ZZQVerifyViewController ()<CTAssetsPickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *storeName;
@property (weak, nonatomic) IBOutlet UITextField *userTrueName;
@property (weak, nonatomic) IBOutlet UITextField *userCard;
@property (weak, nonatomic) IBOutlet UITextField *userBankCard;
@property (weak, nonatomic) IBOutlet UIButton *cardFrontBtn;
@property (weak, nonatomic) IBOutlet UIButton *cardBackBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UIImageView *headSmallImage;
//商家模型
@property(nonatomic, strong)ZZQMerchant * merchant;


@property (nonatomic, strong) PHImageRequestOptions *requestOptions;
@property (nonatomic, strong)CTAssetsPickerController * picker;


@end

@implementation ZZQVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView{
    _storeName.delegate = self;
    _userTrueName.delegate = self;
    _userBankCard.delegate = self;
    _userCard.delegate = self;
    _cardBackBtn.layer.cornerRadius = 10;
    _cardBackBtn.layer.masksToBounds = YES;
    _cardFrontBtn.layer.cornerRadius = 10;
    _cardFrontBtn.layer.masksToBounds = YES;
    _submitBtn.layer.cornerRadius = 10;
    _headImage.layer.cornerRadius = _headImage.width/2;
    _headImage.layer.masksToBounds = YES;
    _headSmallImage.layer.cornerRadius = _headSmallImage.width/2;
    _headSmallImage.layer.masksToBounds = YES;
    [CTAssetsGridSelectedView appearance].borderWidth = 3.0f;
    self.requestOptions = [[PHImageRequestOptions alloc] init];
    self.requestOptions.resizeMode   = PHImageRequestOptionsResizeModeExact;
    self.requestOptions.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
}

//关闭验证
- (IBAction)closeAction:(id)sender {
    ZZQLoginUserViewController * loginUserVC = [[ZZQLoginUserViewController alloc] init];
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:loginUserVC animated:YES completion:^{
        
    }];
}
//上传图像
- (IBAction)uploadProtrait:(UIButton *)sender {
    [self uploadPicWithTitle:@"商铺头像"];
}
- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(PHAsset *)asset
{
    NSInteger max = 1;
    
    if (picker.selectedAssets.count >= max)
    {
        UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:@"注意"
                                            message:[NSString stringWithFormat:@"请选择不要超过 %ld 张图片", (long)max]
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action =
        [UIAlertAction actionWithTitle:@"好的"
                                 style:UIAlertActionStyleDefault
                               handler:nil];
        
        [alert addAction:action];
        
        [picker presentViewController:alert animated:YES completion:nil];
    }
    
    return (picker.selectedAssets.count < max);
}
- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    [picker dismissViewControllerAnimated:YES completion:^{
        PHAsset *asset = [assets objectAtIndex:0];
        PHImageManager *manager = [PHImageManager defaultManager];
        [manager requestImageDataForAsset:asset options:self.requestOptions resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
            if ([picker.title isEqualToString:@"商铺头像"]) {
                self.headImage.image= [UIImage imageWithData:imageData];
                self.headSmallImage.image = [UIImage imageWithData:imageData];
                _merchant.protrait = imageData;
            }else if([picker.title isEqualToString:@"身份证正面"]){
                [self.cardFrontBtn setBackgroundImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                _merchant.cardFront = imageData;
            }else if([picker.title isEqualToString:@"身份证背面"]){
                [self.cardBackBtn setBackgroundImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                _merchant.cardBack = imageData;
            }
        }];
        
    }];
    
}
//上传身份证正面
- (IBAction)cardFrontAction:(UIButton *)sender {
    [self uploadPicWithTitle:@"身份证正面"];
}
//上传身份证背面
- (IBAction)cardBackAction:(UIButton *)sender {
    [self uploadPicWithTitle:@"身份证背面"];
}

//上传图片方法
- (void)uploadPicWithTitle:(NSString *)titile{
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
        dispatch_async(dispatch_get_main_queue(), ^{
            _picker = [[CTAssetsPickerController alloc] init];
            
            _picker.delegate = self;
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                _picker.modalPresentationStyle = UIModalPresentationFormSheet;
            
            [_picker setShowsNumberOfAssets:NO];
            [_picker setDoneButtonTitle:@"选好了"];
            [_picker setShowsSelectionIndex:YES];
            [_picker setShowsCancelButton:YES];
            _picker.title = titile;
            [self presentViewController:_picker animated:YES completion:nil];
        });
    }];
}

//提交审核
- (IBAction)submitAction:(UIButton *)sender {
    NSString * storeName = _storeName.text;
    NSString * trueName = _userTrueName.text;
    NSString * bankCard = _userBankCard.text;
    NSString * idCard = _userCard.text;
    
    if (![storeName isEqualToString:@""] && ![trueName isEqualToString:@""] && ![bankCard isEqualToString:@""] && ![idCard isEqualToString:@""]
        && _merchant.protrait != nil && _merchant.cardBack != nil && _merchant.cardFront != nil) {
        _merchant.name = storeName;
        _merchant.trueName = trueName;
        _merchant.bankCard = bankCard;
        _merchant.cardNum = idCard;
        _merchant.isPassed = NO;
        AVUser * currentUser = [AVUser currentUser];
        AVObject * merchantObj = [[AVObject alloc] initWithClassName:@"Merchants"];
        [merchantObj setObject:currentUser forKey:@"owner"];
        [merchantObj setObject:_merchant.name forKey:@"name"];
        [merchantObj setObject:_merchant.protrait forKey:@"protrait"];
        [merchantObj setObject:_merchant.phone forKey:@"phone"];
        [merchantObj setObject:_merchant.cardNum forKey:@"cardNum"];
        [merchantObj setObject:_merchant.cardFront forKey:@"cardFront"];
        [merchantObj setObject:_merchant.cardBack forKey:@"cardBack"];
        [merchantObj setObject:_merchant.bankCard forKey:@"bankCard"];
        [merchantObj setObject:_merchant.password forKey:@"password"];
        [merchantObj setObject:_merchant.email forKey:@"email"];
        [merchantObj setObject:_merchant.trueName forKey:@"trueName"];
        [merchantObj setObject:_merchant forKey:@"isPassed"];
        AVFile * protrainFile = [AVFile fileWithData:_merchant.protrait];
        AVFile * frontFile = [AVFile fileWithData:_merchant.cardFront];
        AVFile * backFile = [AVFile fileWithData:_merchant.cardBack];
        [merchantObj setObject:protrainFile forKey:@"protrait"];
        [merchantObj setObject:frontFile forKey:@"cardFront"];
        [merchantObj setObject:backFile forKey:@"cardBack"];
        [merchantObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                [ProgressHUD showSuccess:@"提交成功"];
                ZZQTabBarViewController * tabBarVC = [[ZZQTabBarViewController alloc] init];
                [self presentViewController:tabBarVC animated:YES completion:^{
                    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
                }];
            } else {
                [ProgressHUD showError:@"提交出错，请重试"];
            }
        }];
    }else{
        [ProgressHUD showError:@"信息填写不全"];
    }
}

- (ZZQMerchant *)merchant{
    if (!_merchant) {
        _merchant = [[ZZQMerchant alloc] init];
    }
    return _merchant;
}

- (void)setNewMerchant:(ZZQMerchant *)merchant{
    self.merchant = merchant;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_userCard resignFirstResponder];
    [_userBankCard resignFirstResponder];
    [_userTrueName resignFirstResponder];
    [_storeName resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_userCard resignFirstResponder];
    [_userBankCard resignFirstResponder];
    [_userTrueName resignFirstResponder];
    [_storeName resignFirstResponder];
    return YES;
}

- (void)dealloc
{
    // reset appearance
    [CTAssetsGridSelectedView appearance].borderWidth = 0.0f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
