//
//  ZZQAddNewMenuViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/4/3.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQAddNewMenuViewController.h"
#import "ZZQMenus.h"
#import <CTAssetsPickerController/CTAssetsGridSelectedView.h>


@interface ZZQAddNewMenuViewController ()<CTAssetsPickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *calorieTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *leftTextFiedl;
@property (weak, nonatomic) IBOutlet UITextField *typeTextFeild;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImage;

@property (nonatomic, strong) PHImageRequestOptions *requestOptions;
@property (nonatomic, strong)CTAssetsPickerController * picker;

@property(nonatomic, strong)ZZQMenus * menu;

@end

@implementation ZZQAddNewMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _menu = [[ZZQMenus alloc] init];
}
- (IBAction)addPic:(UIButton *)sender {
    [self uploadPicWithTitle:@"菜品图片"];
}
- (IBAction)saveAction:(UIButton *)sender {
    _menu.name = _nameTextField.text;
    _menu.price = _priceTextField.text;
    _menu.calorie = _calorieTextField.text;
    _menu.left = _leftTextFiedl.text;
    _menu.orderedNum = @"0";
    _menu.type = _typeTextFeild.text;
    _menu.context = @"6666666666";
    
    AVObject * menuObj = [AVObject objectWithClassName:@"Menus"];
    [menuObj setObject:[AVUser currentUser] forKey:@"owner"];
    [menuObj setObject:_menu.name forKey:@"name"];
    [menuObj setObject:_menu.price forKey:@"price"];
    [menuObj setObject:_menu.calorie forKey:@"calorie"];
    [menuObj setObject:_menu.left forKey:@"left"];
    [menuObj setObject:_menu.orderedNum forKey:@"orderedNum"];
    [menuObj setObject:_menu.type forKey:@"type"];
    [menuObj setObject:_menu.context forKey:@"context"];
    AVFile * file = [AVFile fileWithData:_menu.portrait];
    [menuObj setObject:file forKey:@"portrait"];
    [menuObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            [ProgressHUD showSuccess:@"添加成功"];
        }else{
            NSLog(@"%@", error);
        }
    }];
}
- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(PHAsset *)asset
{
    NSInteger max = 1;
    if (picker.selectedAssets.count >= max)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注意"
                                            message:[NSString stringWithFormat:@"请选择不要超过 %ld 张图片", (long)max]
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的"
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
            _menu.portrait = imageData;
            _portraitImage.image = [UIImage imageWithData:imageData];
        }];
        
    }];
    
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_leftTextFiedl resignFirstResponder];
    [_calorieTextField resignFirstResponder];
    [_nameTextField resignFirstResponder];
    [_priceTextField resignFirstResponder];
    [_typeTextFeild resignFirstResponder];
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
