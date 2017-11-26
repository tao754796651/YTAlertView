//
//  YTTextView.h
//  dddd
//
//  Created by yzw on 2017/1/10.
//  Copyright © 2017年 xyt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTTextView : UITextView

@property(nullable, nonatomic,copy) NSString *placeholder;          // default is nil. string is drawn 70% gray

@property(nullable, nonatomic,copy) NSString *content;   // 真实内容

@end
