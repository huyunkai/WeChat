//
//  YCYMeViewController.m
//  WeChat
//
//  Created by Charles on 14/12/8.
//  Copyright (c) 2014年 Charles. All rights reserved.
//

#import "YCYMeViewController.h"
#import "AppDelegate.h"
#import "XMPPvCardTemp.h"

@interface YCYMeViewController()

- (IBAction)logoutBtnClick:(id)sender;
/**
 *  头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *headerView;
/**
 *  昵称
 */
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;

/**
 *  微信号
 */
@property (weak, nonatomic) IBOutlet UILabel *weixinNumLabel;

@end

@implementation YCYMeViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 显示当前用户个人信息

    //xmpp提供了一个方法，直接获取个人信息
   XMPPvCardTemp *myVCard =[YCYXMPPTool sharedYCYXMPPTool].vCard.myvCardTemp;
    
    // 设置头像
    if(myVCard.photo){
        self.headerView.image = [UIImage imageWithData:myVCard.photo];
    }
    
    // 设置昵称
    self.nickNameLabel.text = myVCard.nickname;
    
    // 设置微信号[用户名]
    
    NSString *user = [YCYUserInfo sharedYCYUserInfo].user;
    self.weixinNumLabel.text = [NSString stringWithFormat:@"微信号:%@",user];
    
}


- (IBAction)logoutBtnClick:(id)sender {
    
    //直接调用 appdelegate的注销方法
//    AppDelegate *app = [UIApplication sharedApplication].delegate;
//    
//    [app xmppUserlogout];
    
    [[YCYXMPPTool sharedYCYXMPPTool] xmppUserlogout];
}
@end
