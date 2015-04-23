//
//  YCYEditProfileViewController.h
//  WeChat
//
//  Created by Charles on 14/12/9.
//  Copyright (c) 2014年 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol YCYEditProfileViewControllerDelegate <NSObject>

-(void)editProfileViewControllerDidSave;


@end

@interface YCYEditProfileViewController : UITableViewController

@property (nonatomic, strong) UITableViewCell *cell;

@property (nonatomic, weak) id<YCYEditProfileViewControllerDelegate> delegate;

@end
