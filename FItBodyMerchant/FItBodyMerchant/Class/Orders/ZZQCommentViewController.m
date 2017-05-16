//
//  ZZQCommentViewController.m
//  FItBodyMerchant
//
//  Created by ben on 17/5/16.
//  Copyright © 2017年 张增强. All rights reserved.
//

#import "ZZQCommentViewController.h"

@interface ZZQCommentViewController ()

@property(nonatomic, strong)ZZQComments * comment;

@end

@implementation ZZQCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"评价回复";
}

- (void)setVCComment:(ZZQComments *)comment{
    _comment = comment;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.tabBarController.tabBar setHidden:NO];
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
