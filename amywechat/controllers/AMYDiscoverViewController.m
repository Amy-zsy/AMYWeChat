//
//  AMYDiscoverViewController.m
//  amywechat
//
//  Created by Amy on 2019/4/6.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYDiscoverViewController.h"
#import "AMYView.h"
#import "AMYDataLoader.h"

static NSString * const ID = @"DISCOVERVIEWCELL";

@interface AMYDiscoverViewController () <UITableViewDelegate, UITableViewDataSource>

@property (null_resettable, nonatomic, strong) AMYView *view;
@property (nonatomic, copy) NSArray<NSArray<NSDictionary<NSString *, NSString *> *> *> *data;

@end

@implementation AMYDiscoverViewController

@dynamic view;

//// lazy load
//- (UIView *)view {
//    if (!self->view) {
//        [self loadView];
//        [self viewDidLoad];
//    }
//    return self->view;
//}

//- (instancetype)init {
//    return [self initWithNibName:nil bundle:nil];
//}

- (void)loadView {
    self.view = [[AMYView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tableview.delegate = self;
    self.view.tableview.dataSource = self;
    self.view.tableview.rowHeight = 50;
    self.view.tableview.sectionHeaderHeight = 4;
    self.view.tableview.sectionFooterHeight = 4;
    self.view.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01)];
//    self.view.tableview.tableFooterView = [UIView new]; // remove seperators
    self.view.tableview.separatorColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    [self.view.tableview registerClass:UITableViewCell.class forCellReuseIdentifier:ID];
    
//    __weak typeof(self) weakself = self;
//    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
//        NSURL *url = [NSBundle.mainBundle URLForResource:@"discovery" withExtension:@"json"];
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        id list = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        if ([list isKindOfClass:NSArray.class]) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                __strong typeof(self) self = weakself;
//                self.data = list;
//                [self.view.tableview reloadData];
//            });
//        }
//    });
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = self.data[indexPath.section][indexPath.row][@"name"];
    NSString *img = self.data[indexPath.section][indexPath.row][@"image"];
    cell.imageView.image = [UIImage imageNamed:img];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
