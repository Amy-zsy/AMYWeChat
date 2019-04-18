//
//  AMYChatsViewController.m
//  amywechat
//
//  Created by Amy on 2019/4/6.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYChatsViewController.h"
#import "AMYView.h"
#import "AMYChatCell.h"
#import "AMYChats.h"
#import "AMYDataLoader.h"

static NSString * const ID = @"CHATSVIEWCELL";

@interface AMYChatsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) AMYView *view;
@property (nonatomic, copy) NSArray<NSDictionary<NSString *, NSString *> *> *data;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation AMYChatsViewController

@dynamic view;

- (void)loadView {
    self.view = [[AMYView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tableview.delegate = self;
    self.view.tableview.dataSource = self;
    self.view.tableview.rowHeight = 60;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] init];
    right.image = [UIImage imageNamed:@"mute"];
    self.navigationItem.rightBarButtonItem = right;
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = UIColor.redColor;
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:vc];
    searchController.searchBar.barTintColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1];
    searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.view.tableview.tableHeaderView = searchController.searchBar;
    self.searchController = searchController;
    
    [self.view.tableview registerClass:AMYChatCell.class forCellReuseIdentifier:ID];
    
    [AMYDataLoader loadJSONFile:@"Chats" completion:^(id jsonObj, NSError *error) {
        if (![jsonObj isKindOfClass:NSArray.class]) {
            return;
        }
        self.data = jsonObj;
        [self.view.tableview reloadData];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (!self.isBeingPresented && !self.isMovingToParentViewController) {
        if (self.navigationController.interactivePopGestureRecognizer.state == UIGestureRecognizerStatePossible) {
            [self.view.tableview deselectRowAtIndexPath:self.view.tableview.indexPathForSelectedRow animated:YES];
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.view.tableview.indexPathForSelectedRow) {
        [self.view.tableview deselectRowAtIndexPath:self.view.tableview.indexPathForSelectedRow animated:YES];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMYChatCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    AMYChats *data = [[AMYChats alloc] initWithDic:self.data[indexPath.row]];
    [cell setData:data];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        [cell setSelected:NO animated:YES];
//    });
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = UIColor.redColor;
    [self.navigationController pushViewController:vc animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
