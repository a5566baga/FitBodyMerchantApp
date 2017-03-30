//
//  ZZQVerifyViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/3/30.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQVerifyViewController.h"

@interface ZZQVerifyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *storeName;
@property (weak, nonatomic) IBOutlet UITextField *userTrueName;
@property (weak, nonatomic) IBOutlet UITextField *userCard;
@property (weak, nonatomic) IBOutlet UITextField *userBankCard;
@property (weak, nonatomic) IBOutlet UIButton *cardFrontBtn;
@property (weak, nonatomic) IBOutlet UIButton *cardBackBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation ZZQVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _cardBackBtn.layer.cornerRadius = 10;
    _cardFrontBtn.layer.cornerRadius = 10;
    _submitBtn.layer.cornerRadius = 10;
}
- (IBAction)closeAction:(id)sender {
    
}
- (IBAction)uploadProtrait:(UIButton *)sender {
}
- (IBAction)cardFrontAction:(UIButton *)sender {
}
- (IBAction)cardBackAction:(UIButton *)sender {
}
- (IBAction)submitAction:(UIButton *)sender {
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
