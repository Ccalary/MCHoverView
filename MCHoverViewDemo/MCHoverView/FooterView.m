//
//  FooterView.m
//  MCHoverViewDemo
//
//  Created by caohouhong on 2018/12/25.
//  Copyright © 2018年 chh. All rights reserved.
//

#import "FooterView.h"
#import "EMScrollView.h"
#import "FooterListView.h"

@interface FooterView()
@property (nonatomic, strong) EMScrollView *scrollView;
@end

@implementation FooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
        self.lastCurrentOffsetY = 0;
        [self initView];
    }
    return self;
}

- (void)initView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 50)];
    headerView.backgroundColor = [UIColor yellowColor];
    [self addSubview:headerView];
    
    _scrollView = [[EMScrollView alloc] initWithFrame:CGRectMake(0, 50, 414, 736 - 50)];
    [self addSubview:_scrollView];

    FooterListView *listView1 = [[FooterListView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [_scrollView addSubview:listView1];
    
    FooterListView *listView2 = [[FooterListView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [_scrollView addSubview:listView2];
    
    FooterListView *listView3 = [[FooterListView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [_scrollView addSubview:listView3];
    
    FooterListView *listView4 = [[FooterListView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [_scrollView addSubview:listView4];
    
}

@end
