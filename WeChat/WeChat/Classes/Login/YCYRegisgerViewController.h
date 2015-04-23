//
//  YCYRegisgerViewController.h
//  WeChat
//
//  Created by Charles on 14/12/8.
//  Copyright (c) 2014年 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol YCYRegisgerViewControllerDelegate <NSObject>

/**
 *  完成注册
 */
-(void)regisgerViewControllerDidFinishRegister;

@end
@interface YCYRegisgerViewController : UIViewController

@property (nonatomic, weak) id<YCYRegisgerViewControllerDelegate> delegate;

@end
