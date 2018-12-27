//
//  EMScrollView.m
//  JingJinSuo
//
//  Created by caohouhong on 2018/6/6.
//  Copyright © 2018年 jingjinsuo. All rights reserved.
//

#import "EMScrollView.h"

@implementation EMScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}

/*
 *  视图准备
 */
-(void)viewPrepare{
    
    //开启分页
    self.pagingEnabled = YES;
    
    //隐藏各种条
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    //取消boundce
    self.bounces = NO;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    __block CGRect frame = self.bounds;
    
    __block NSUInteger count = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        
        if([subView isKindOfClass:[UIView class]]){
            
            CGFloat frameX = frame.size.width * idx;
            
            frame.origin.x = frameX;
            
            CGPoint subViewFrame = subView.frame.origin;
            subViewFrame.x = frameX;
            
            subView.frame = CGRectMake(subViewFrame.x, subViewFrame.y, [UIScreen mainScreen].bounds.size.width, subView.frame.size.height);
            
            count ++;
        }
    }];
    
    self.contentSize = CGSizeMake(frame.size.width*count, 0);
}

@end
