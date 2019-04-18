//
//  AMYMeViewController.m
//  amywechat
//
//  Created by Amy on 2019/4/6.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYMeViewController.h"
#import "AMYView.h"
#import "AMYMeView.h"
#import "AMYDataLoader.h"

static NSString * const ID = @"MEVIEWCELL";

@interface AMYMeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (null_resettable, nonatomic, strong) AMYView *view;
@property (nonatomic, copy) NSArray<NSArray<NSDictionary<NSString *, NSString *> *> *> *data;

@end

@implementation AMYMeViewController

@dynamic view;

- (void)loadView {
    self.view = [[AMYView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tableview.delegate = self;
    self.view.tableview.dataSource = self;
    UIBarButtonItem *right = [[UIBarButtonItem alloc] init];
    right.image = [UIImage imageNamed:@"mute"];
    self.navigationItem.rightBarButtonItem = right;
    if(@available(iOS 11, *)) {
        self.view.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    self.view.tableview.tableHeaderView = [[AMYMeView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    self.view.tableview.tableHeaderView.backgroundColor = [UIColor whiteColor];
    [(AMYMeView *)self.view.tableview.tableHeaderView addTarget:self action:@selector(touchButton) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.tableview.rowHeight = 50;
    self.view.tableview.sectionHeaderHeight = 0.1;
    self.view.tableview.sectionFooterHeight = 0.1;
    [self.view.tableview registerClass:UITableViewCell.class forCellReuseIdentifier:ID];
    
    __weak typeof(self) weakself = self;
    [AMYDataLoader loadJSONFile:@"discovery" completion:^(id jsonObj, NSError *error) {
        if(![jsonObj isKindOfClass:NSArray.class]) {
            return;
        }
        __strong typeof(self) self = weakself;
        self.data = jsonObj;
        [self.view.tableview reloadData];
    }];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if(!self.isBeingPresented && !self.movingFromParentViewController) {
        if(self.navigationController.interactivePopGestureRecognizer.state == UIGestureRecognizerStatePossible){
            [self.view.tableview deselectRowAtIndexPath:self.view.tableview.indexPathForSelectedRow animated:YES];
        }
    }
}

-(void)viewDidAppear:(BOOL)animated {
    [self.tabBarController.tabBar setHidden:NO];
    [super viewDidAppear:animated];
    if(self.view.tableview.indexPathForSelectedRow) {
        [self.view.tableview deselectRowAtIndexPath:self.view.tableview.indexPathForSelectedRow animated:YES];
    }
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *header = [[UIView alloc] init];
//    header.backgroundColor = UIColor.redColor;
//    return header;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController setNavigationBarHidden:NO];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = UIColor.redColor;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = _data[indexPath.section][indexPath.row][@"name"];
    NSString *img = _data[indexPath.section][indexPath.row][@"image"];
    cell.imageView.image = [UIImage imageNamed:img];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)touchButton {
    [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:YES];
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
