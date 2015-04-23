//
//  YCYInputView.h
//  WeChat
//
//  Created by Charles on 14/12/11.
//  Copyright (c) 2014年 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCYInputView : UIView
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

+(instancetype)inputView;

@end
