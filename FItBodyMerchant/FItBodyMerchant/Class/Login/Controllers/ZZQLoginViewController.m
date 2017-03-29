//
//  ZZQLoginViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/29.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQLoginViewController.h"
#import "ZZQRegisterViewController.h"
#import "ZZQLoginUserViewController.h"

@interface ZZQLoginViewController ()

@property(nonatomic, strong)ZZQRegisterViewController * registerVC;
@property(nonatomic, strong)ZZQLoginUserViewController * loginUserVC;

@end

@implementation ZZQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.frame = [UIScreen mainScreen].bounds;
}
- (IBAction)registerAction:(UIButton *)sender {
    _registerVC = [[ZZQRegisterViewController alloc] init];
    [self presentViewController:_registerVC animated:YES completion:^{
        
    }];
}
- (IBAction)loginAction:(id)sender {
    _loginUserVC = [[ZZQLoginUserViewController alloc] init];
    [self presentViewController:_loginUserVC animated:YES completion:^{
        
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
