//
//  PLAlertView.h
//  TYAlertView
//
//  Created by 童万华 on 2017/2/23.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLAlertView : UIAlertView
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle submitButtonTitle:(NSString *)submitButtonTitle;
@end
