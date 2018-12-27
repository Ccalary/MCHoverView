//
//  BaseTableView.m
//  MCHoverViewDemo
//
//  Created by caohouhong on 2018/12/25.
//  Copyright © 2018年 chh. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    
//    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
    return YES;
}
@end
