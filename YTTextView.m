//
//  YTTextView.m
//  dddd
//
//  Created by yzw on 2017/1/10.
//  Copyright © 2017年 xyt. All rights reserved.
//

#import "YTTextView.h"


@interface YTTextView()

@property (nonatomic, assign) BOOL ifPlaceholder;

@end


@implementation YTTextView

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    
    self.ifPlaceholder = YES;
    self.text = placeholder;
    self.textColor = [UIColor grayColor];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidBeginEditing) name:UITextViewTextDidBeginEditingNotification object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEndEditing) name:UITextViewTextDidEndEditingNotification object:self];
    }
    return self;
}
-(void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidBeginEditing) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEndEditing) name:UITextViewTextDidEndEditingNotification object:self];
}
- (void)textDidBeginEditing {
    // 如果是Placeholder 需要清空
    if ([self.placeholder isEqualToString:self.text] && self.textColor == [UIColor grayColor]) {
        self.text = nil;
    }
    self.textColor = [UIColor darkTextColor];
}

- (void)textDidEndEditing {
    // 如果没有文字需要变成Placeholder
    if (self.text.length == 0) {
        self.text = self.placeholder;
        self.textColor = [UIColor grayColor];
    }
}

- (NSString *)content {
    if (self.textColor == [UIColor grayColor]) {
        return nil;
    } else {
        return self.text;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
