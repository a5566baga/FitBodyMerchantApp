//
//  ZZQRegisterViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/29.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQRegisterViewController.h"
#import "ZZQVerifyViewController.h"

@interface ZZQRegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ZZQRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _phoneTextField.delegate = self;
    _passwordTextField.delegate = self;
    _emailTextField.delegate = self;
    _loginBtn.layer.cornerRadius = 10;
}
- (IBAction)closeAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)registerAction:(UIButton *)sender {
    AVUser * user = [AVUser user];
    user.username = _phoneTextField.text;
    user.password = _passwordTextField.text;
    user.mobilePhoneNumber = _phoneTextField.text;
    user.email = _emailTextField.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(succeeded){
            [ProgressHUD showSuccess:@"注册成功"];
            ZZQVerifyViewController * verifyVC = [[ZZQVerifyViewController alloc] init];
            [self presentViewController:verifyVC animated:YES completion:^{
                
            }];
        }else{
            if (error.code == 125) {
                [ProgressHUD showError:@"邮箱不合法"];
            }else if (error.code == 203) {
                [ProgressHUD showError:@"该邮箱已注册"];
            }else if (error.code == 202) {
                [ProgressHUD showError:@"用户名已存在"];
            }else{
                [ProgressHUD showError:@"注册失败"];
            }
        }
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_emailTextField resignFirstResponder];
    [_phoneTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
