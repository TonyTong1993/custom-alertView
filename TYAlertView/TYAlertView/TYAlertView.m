//
//  TYAlertView.m
//  TYAlertView
//
//  Created by 童万华 on 2017/2/22.
//  Copyright © 2017年 童万华. All rights reserved.
//

#import "TYAlertView.h"

@interface TYAlertView ()

@end

@implementation TYAlertView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self removeTopCircle];
        [self.viewText setTextAlignment:NSTextAlignmentLeft];
    }
    return self;
}
@end
