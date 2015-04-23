//
//  YCYLoginViewController.m
//  WeChat
//
//  Created by Charles on 14/12/8.
//  Copyright (c) 2014年 Charles. All rights reserved.
//

#import "YCYLoginViewController.h"
#import "YCYRegisgerViewController.h"
#import "YCYNavigationController.h"

@interface YCYLoginViewController()<YCYRegisgerViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation YCYLoginViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 设置TextField和Btn的样式
    self.pwdField.background = [UIImage stretchedImageWithName:@"operationbox_text"];
    
  
    [self.pwdField addLeftViewWithImage:@"Card_Lock"];
    
    [self.loginBtn setResizeN_BG:@"fts_green_btn" H_BG:@"fts_green_btn_HL"];
    
    
    // 设置用户名为上次登录的用户名
    
    //从沙盒获取用户名
    NSString *user = [YCYUserInfo sharedYCYUserInfo].user;
    self.userLabel.text = user;
}


- (IBAction)loginBtnClick:(id)sender {
    
    // 保存数据到单例
    
    YCYUserInfo *userInfo = [YCYUserInfo sharedYCYUserInfo];
    userInfo.user = self.userLabel.text;
    userInfo.pwd = self.pwdField.text;
    
    // 调用父类的登录
    [super login];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // 获取注册控制器
    id destVc = segue.destinationViewController;
    
    
    if ([destVc isKindOfClass:[YCYNavigationController class]]) {
        YCYNavigationController *nav = destVc;
        //获取根控制器
        
        if ([nav.topViewController isKindOfClass:[YCYRegisgerViewController class]]) {
            YCYRegisgerViewController *registerVc =  (YCYRegisgerViewController *)nav.topViewController;
            // 设置注册控制器的代理
            registerVc.delegate = self;
        }
        
    }
    
}

#pragma mark regisgerViewController的代理
-(void)regisgerViewControllerDidFinishRegister{
    WCLog(@"完成注册");
    // 完成注册 userLabel显示注册的用户名
    self.userLabel.text = [YCYUserInfo sharedYCYUserInfo].registerUser;
    
    // 提示
    [MBProgressHUD showSuccess:@"请重新输入密码进行登录" toView:self.view];
    
    
}

@end
