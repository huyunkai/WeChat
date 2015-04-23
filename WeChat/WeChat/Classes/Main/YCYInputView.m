//
//  YCYInputView.m
//  WeChat
//
//  Created by Charles on 14/12/11.
//  Copyright (c) 2014年 Charles. All rights reserved.
//

#import "YCYInputView.h"

@implementation YCYInputView


+(instancetype)inputView{
    return [[[NSBundle mainBundle] loadNibNamed:@"YCYInputView" owner:nil options:nil] lastObject];
}
@end
