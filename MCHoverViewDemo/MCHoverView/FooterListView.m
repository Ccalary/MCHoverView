//
//  FooterListView.m
//  MCHoverViewDemo
//
//  Created by caohouhong on 2018/12/26.
//  Copyright © 2018年 chh. All rights reserved.
//

#import "FooterListView.h"

@interface FooterListView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) BaseTableView *tableView;
@end
@implementation FooterListView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
        [self initView];
    }
    return self;
}

- (void)initView {
    _tableView = [[BaseTableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pageTitleViewToTop) name:@"headerViewToTop" object:nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"-------%ld--------",(long)indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 滚动时发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SubTableViewDidScroll" object:scrollView];
}

- (void)pageTitleViewToTop {
    self.tableView.contentOffset = CGPointZero;
}
@end
