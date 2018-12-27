//
//  FooterView.h
//  MCHoverViewDemo
//
//  Created by caohouhong on 2018/12/25.
//  Copyright © 2018年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FooterView : UIView
@property (nonatomic,strong) void (^footerTableViewDidScrollBlock)(FooterView *);
@property (nonatomic, assign) CGFloat lastCurrentOffsetY;
@end
