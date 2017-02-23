//
//  ViewController.m
//  TYAlertView
//
//  Created by 童万华 on 2017/2/22.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "ViewController.h"
#import "TYAlertView.h"
#import "SCLButton.h"
#import "AlertView.h"
#import "PLAlertView.h"
@interface ViewController ()<UIAlertViewDelegate>
{
    AlertView *_alert;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)customAlert {
    TYAlertView *alert = [[TYAlertView alloc] init];
    [alert setHorizontalButtons:YES];
    [alert addButton:@"取消" actionBlock:^{
        NSLog(@"cancel");
    }];
    [alert showNotice:self title:@"检测到有新版本" subTitle:@"1.优化了跑步入口和跑步界面\n2.全新的校园跑步规则，让跑步更加灵活\n 在此感谢所有支持我们的童鞋，欢迎大家继续提意见和建议～" closeButtonTitle:@"现在更新" duration:0.0f];

}
- (IBAction)systemAlert{
    //系统自带的alertView无法调整字体样式
//   PLAlertView *alertView = [[PLAlertView alloc] initWithTitle:@"检测到有新版本" message:@"1.优化了跑步入口和跑步界面\n2.全新的校园跑步规则，让跑步更加灵活\n 在此感谢所有支持我们的童鞋，欢迎大家继续提意见和建议～" delegate:self cancelButtonTitle:@"取消" submitButtonTitle:@"现在更新"];
//   
//    [alertView show];
    NSString *title = @"检测到有新版本";
    NSString *message = @"1.优化了跑步入口和跑步界面2.全新的校园跑步规则，让跑步更加灵活";
    NSString *additions = @"在此感谢所有支持我们的童鞋，欢迎大家继续提意见和建议～";
   AlertView *alert = [AlertView alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert leftActionTitle:@"取消" rightActionTitle:@"现在更新" cancel:^{
       NSLog(@"cancel");
   } submit:^{
       NSLog(@"submit");
   }];
    alert.additions = additions;
    alert.messages = @[@"1.优化了跑步入口和跑步界面",@"2.全新的校园跑步规则，让跑步更加灵活"];
    alert.additionsAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:15]};
    alert.textAlignment = NSTextAlignmentLeft;
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark----UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

@end
