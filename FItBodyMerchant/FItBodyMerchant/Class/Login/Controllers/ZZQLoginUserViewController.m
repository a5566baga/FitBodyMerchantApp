//
//  ZZQLoginUserViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/29.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQLoginUserViewController.h"
#import "ZZQHomeViewController.h"

@interface ZZQLoginUserViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ZZQLoginUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)loginAction:(id)sender {
    [AVUser logInWithUsernameInBackground:_phoneTextField.text password:_passwordTextField.text block:^(AVUser * _Nullable user, NSError * _Nullable error) {
        if (error == nil) {
            [ProgressHUD showSuccess:@"登录成功"];
            [self dismissViewControllerAnimated:YES completion:^{
                ZZQHomeViewController * homeVC = [[ZZQHomeViewController alloc] init];
                [UIApplication sharedApplication].keyWindow.rootViewController = homeVC;
            }];
        }else{
            if (error.code == 210){
                [ProgressHUD showError:@"用户名或密码错误"];
            }else if (error.code == 211) {
                [ProgressHUD showError:@"不存在该用户"];
            }else if (error.code == 216) {
                [ProgressHUD showError:@"未验证邮箱"];
            }else if (error.code == 1){
                [ProgressHUD showError:@"操作频繁"];
            }else{
                [ProgressHUD showError:@"登录失败"];
            }
        }
    }];
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