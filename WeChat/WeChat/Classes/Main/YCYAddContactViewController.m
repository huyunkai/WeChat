//
//  YCYAddContactViewController.m
//  WeChat
//
//  Created by Charles on 14/12/9.
//  Copyright (c) 2014年 Charles. All rights reserved.
//

#import "YCYAddContactViewController.h"

@interface YCYAddContactViewController()<UITextFieldDelegate>

@end

@implementation YCYAddContactViewController


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    // 添加好友
    
    // 1.获取好友账号
    NSString *user = textField.text;
    WCLog(@"%@",user);
    
    // 判断这个账号是否为手机号码
    if(![textField isTelphoneNum]){
        //提示
        [self showAlert:@"请输入正确的手机号码"];
        return YES;
    }
    
    
    //判断是否添加自己
    if([user isEqualToString:[YCYUserInfo sharedYCYUserInfo].user]){
        
        [self showAlert:@"不能添加自己为好友"];
        return YES;
    }
    NSString *jidStr = [NSString stringWithFormat:@"%@@%@",user,domain];
    XMPPJID *friendJid = [XMPPJID jidWithString:jidStr];
    
    
    //判断好友是否已经存在
    if([[YCYXMPPTool sharedYCYXMPPTool].rosterStorage userExistsWithJID:friendJid xmppStream:[YCYXMPPTool sharedYCYXMPPTool].xmppStream]){
        [self showAlert:@"当前好友已经存在"];
        return YES;
    }
    
    
    // 2.发送好友添加的请求
    // 添加好友,xmpp有个叫订阅
   
  
    [[YCYXMPPTool sharedYCYXMPPTool].roster subscribePresenceToUser:friendJid];
    
    return YES;
}

-(void)showAlert:(NSString *)msg{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:msg delegate:nil cancelButtonTitle:@"谢谢" otherButtonTitles:nil, nil];
    [alert show];
}
@end
