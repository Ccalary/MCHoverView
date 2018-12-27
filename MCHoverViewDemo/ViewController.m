//
//  ViewController.m
//  MCHoverViewDemo
//
//  Created by caohouhong on 2018/12/19.
//  Copyright © 2018年 chh. All rights reserved.
//

#import "ViewController.h"
#import "FooterView.h"
#import "BaseTableView.h"

#define TopHeight 600
#define kCell @"kCell"

static NSString const *NORMAL_CELL = @"NORMAL_CELL";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cellArray;
@property (nonatomic, strong) FooterView *footerView;
@property (nonatomic, strong) UIScrollView *childScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellArray = [NSMutableArray array];
    // 监听子控制器发出的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subTableViewDidScroll:) name:@"SubTableViewDidScroll" object:nil];
    [self drawView];
    [self updateCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)drawView{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    headerView.backgroundColor = [UIColor blueColor];
    _tableView.tableHeaderView = headerView;
    
    _footerView = [[FooterView alloc] initWithFrame:self.view.bounds];
    _tableView.tableFooterView = _footerView;
}

- (void)updateCell {
    [self.cellArray removeAllObjects];
    
    NSMutableArray *array1 = [NSMutableArray array];
    for (int i = 0; i < 10; i++){
        NSDictionary *dic = @{kCell:NORMAL_CELL};
        [array1 addObject:dic];
    }
    [self.cellArray addObject:array1];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.cellArray[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.cellArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    
    if ([NORMAL_CELL isEqualToString:[dic objectForKey:kCell]]){
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        return cell;
    }
    return [[UITableViewCell alloc] init];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = self.cellArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    if ([NORMAL_CELL isEqualToString:[dic objectForKey:kCell]]){
        return 40;
    }else {
        return self.view.frame.size.height;
    }
    return 40;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.tableView == scrollView){
        if ((_childScrollView && _childScrollView.contentOffset.y > 0) || scrollView.contentOffset.y > TopHeight){
            self.tableView.contentOffset = CGPointMake(0, TopHeight);
        }
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY < TopHeight){
            [[NSNotificationCenter defaultCenter] postNotificationName:@"headerViewToTop" object:nil];
        }
    }
}

- (void)subTableViewDidScroll:(NSNotification *)noti {
    UIScrollView *scrollView = noti.object;
    self.childScrollView = scrollView;
    if (self.tableView.contentOffset.y < (TopHeight-10)) {
        scrollView.contentOffset = CGPointZero;
        scrollView.showsVerticalScrollIndicator = NO;
    } else {
        scrollView.showsVerticalScrollIndicator = YES;
    }
}

@end
