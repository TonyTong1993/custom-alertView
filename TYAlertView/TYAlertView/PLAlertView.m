//
//  PLAlertView.m
//  TYAlertView
//
//  Created by 童万华 on 2017/2/23.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "PLAlertView.h"

@implementation PLAlertView

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle submitButtonTitle:(NSString *)submitButtonTitle{
   self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:submitButtonTitle,nil];
    if (self) {
        CGSize size = [message sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(240, 1000) lineBreakMode:NSLineBreakByTruncatingTail];
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 240, size.height)];
        
        textLabel.font = [UIFont systemFontOfSize:15];
        
        textLabel.textColor = [UIColor blackColor];
        
        textLabel.backgroundColor = [UIColor clearColor];
        
        textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        textLabel.numberOfLines = 0;
        
        textLabel.textAlignment = NSTextAlignmentLeft;
        
        textLabel.text = self.message;
        
        [self setValue:textLabel forKey:@"accessoryView"];
        
        
        
        //这个地方别忘了把alertview的message设为空
        
        self.message = @"";
    }
    return self;
}

@end
