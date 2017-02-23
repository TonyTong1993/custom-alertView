//
//  AlertView.h
//  TYAlertView
//
//  Created by 童万华 on 2017/2/22.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView : UIAlertController

/**
 自定义提示框(如果当前系统>=ios8 可用否则不可用)

 @param title 提示框标题
 @param message 提示内容
 @param preferredStyle 系统提示框样式
 @param lefTitle action 左边title
 @param rightTitle action 右边title
 @param cancelBlock 左边action响应
 @param submitBlock 右边action响应
 @return 提示框
 */
+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle leftActionTitle:(NSString *)lefTitle rightActionTitle:(NSString *)rightTitle cancel:(void (^)())cancelBlock submit:(void (^)())submitBlock;
/**
 附加信息
 */
@property (nonatomic,copy) NSString *additions;

/**
 提示内容
 */
@property (nonatomic,copy) NSArray  *messages;

/**
 设置内容的(eg:字体大小，字体颜色)
 */
@property (nonatomic,copy) NSDictionary *textAttributes;

/**
 附加信息的样式(eg:字体大小，字体颜色)
 */
@property (nonatomic,copy) NSDictionary *additionsAttributes;

/**
 取消按钮的title颜色
 */
@property (nonatomic,strong) UIColor *cancelTitleColor;
/**
 提交按钮的title颜色
 */
@property (nonatomic,strong) UIColor *submitTitleColor;
@property (nonatomic) NSTextAlignment textAlignment;
@end
