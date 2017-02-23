//
//  AlertView.m
//  TYAlertView
//
//  Created by 童万华 on 2017/2/22.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "AlertView.h"
#import <objc/runtime.h>
@interface AlertView ()
@end

@implementation AlertView
+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle leftActionTitle:(NSString *)lefTitle rightActionTitle:(NSString *)rightTitle cancel:(void (^)())cancelBlock submit:(void (^)())submitBlock{

    AlertView *alert = [super alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (alert) {
        //添加action
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:lefTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            cancelBlock();
        }];
        [cancel setValue:[UIColor grayColor] forKey:@"_titleTextColor"];
        UIAlertAction *update = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            submitBlock();
        }];
        [alert addAction:cancel];
        [alert addAction:update];
    }
    return alert;
}
+(instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle {
    AlertView *alert = [super alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    if (alert) {
       
    }
    return alert;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    if (!_textAlignment) {
        _textAlignment = NSTextAlignmentCenter;
    }
    paragraphStyle.alignment = _textAlignment;
    paragraphStyle.lineSpacing = 5.0f;
    if (!self.textAttributes) {
        self.textAttributes = @{NSParagraphStyleAttributeName : paragraphStyle};
    }
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] initWithDictionary:self.textAttributes];
    attributes[NSParagraphStyleAttributeName] = paragraphStyle;
    NSMutableAttributedString *attributedTitle = [[NSMutableAttributedString alloc] initWithString:self.message];
    [attributedTitle addAttributes:attributes range:NSMakeRange(0, self.message.length)];
    if (self.cancelTitleColor) {
      UIAlertAction *cancel = [self.actions firstObject];
       [cancel setValue:_cancelTitleColor forKey:@"_titleTextColor"];
    }
    if (self.submitTitleColor) {
         UIAlertAction *submit = [self.actions lastObject];
        [submit setValue:_submitTitleColor forKey:@"_titleTextColor"];
    }
  
    if (!self.additions) {
         [self setValue:attributedTitle forKey:@"attributedMessage"];
        return;
    }
    if (!self.additionsAttributes) {
        self.additionsAttributes = @{NSParagraphStyleAttributeName:paragraphStyle};
    }
    NSMutableDictionary *additionAttues = [[NSMutableDictionary alloc] initWithDictionary:self.additionsAttributes];
    additionAttues[NSParagraphStyleAttributeName] = paragraphStyle;
    NSMutableAttributedString *addtionsAttueTitle = [[NSMutableAttributedString alloc] initWithString:self.additions];
    [addtionsAttueTitle addAttributes:additionAttues range:NSMakeRange(0, self.additions.length)];
    [attributedTitle appendAttributedString:addtionsAttueTitle];
    [self setValue:attributedTitle forKey:@"attributedMessage"];

}
#pragma mark--setter and geter
-(void)setMessages:(NSArray *)messages{
    if ([messages count]>0) {
        NSMutableString *content = [NSMutableString string];
        [messages enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSString class]]) {
                [content appendFormat:@"%@\n",obj];
            }else{
                [content replaceCharactersInRange:NSMakeRange(0, content.length) withString:@""];
                *stop = YES;
            }
        }];
        if (![content isEqualToString:@""]) {
            self.message = content;
        }
    }
    _messages = messages;
}
@end
