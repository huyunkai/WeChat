//
//  YCYEditProfileViewController.m
//  WeChat
//
//  Created by Charles on 14/12/9.
//  Copyright (c) 2014年 Charles. All rights reserved.
//

#import "YCYEditProfileViewController.h"
#import "XMPPvCardTemp.h"

@interface YCYEditProfileViewController()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation YCYEditProfileViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 设置标题和TextField的默认值
    self.title = self.cell.textLabel.text;
    
    self.textField.text = self.cell.detailTextLabel.text;
    
    
    // 右边添加个按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveBtnClick)];
}


-(void)saveBtnClick{
    // 1.更改Cell的detailTextLabel的text
    self.cell.detailTextLabel.text = self.textField.text;
    
    [self.cell layoutSubviews ];
    
    // 2.当前的控制器消失
    [self.navigationController popViewControllerAnimated:YES];
    
    // 调用代理
    if([self.delegate respondsToSelector:@selector(editProfileViewControllerDidSave)]){
        // 通知代理，点击保存按钮
        [self.delegate editProfileViewControllerDidSave];
    }
        

}
@end
