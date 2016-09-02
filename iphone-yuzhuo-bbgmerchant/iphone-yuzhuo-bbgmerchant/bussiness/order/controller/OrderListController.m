//
//  FirstViewController.m
//  边边购
//
//  Created by yuzhuo on 16/8/22.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "OrderListController.h"
#import "BBGConfig.h"
#import "OrderListTableCell.h"
#import "MTAHomeOrderHeaderView.h"
#import "OrderListModel.h"
#import "BBGURLConfig.h"

@interface OrderListController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString *sbid;
}
/** tableview */
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) MTAHomeOrderHeaderView * tableHeaderView;
/** arraydata */
@property (nonatomic,strong) NSMutableArray<OrderInfoModel*> *arrayData;
@end

@implementation OrderListController

#pragma mark - lifecircle

- (instancetype)init{
    
    self = [super init];
    if(self){
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, kScreenW, kScreenH-164)];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.tableFooterView = [[UIView alloc] init];
        [self initData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshData) name:ORDER_REFRSH_DATA object:nil];
    [self initViews];
    sbid = [SZUserDefault objectForKey:@"sbid"];
    [self getOderList:sbid status:@"0" offset:0 pageSize:20];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    OrderListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil){
        cell = [[OrderListTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if(indexPath.row < self.arrayData.count){
        cell.data = self.arrayData[indexPath.row];
    }
    return cell;
}

#pragma mark - Private
-(void) initData{
    self.arrayData = [NSMutableArray<OrderInfoModel *> new];
}

-(void) initViews{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableHeaderView];
    [self.view addSubview:self.tableView];
//    self.tableView.frame = self.view.bounds;
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ];
    
}

- (MTAHomeOrderHeaderView *)tableHeaderView
{
    if (_tableHeaderView) {
        return _tableHeaderView;
    }
    _tableHeaderView = [[MTAHomeOrderHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 50)];
    _tableHeaderView.backgroundColor = [UIColor whiteColor];
    return  _tableHeaderView;
}

-(void) refreshData{
    [self getOderList:sbid status:@"2" offset:0 pageSize:20];
}


-(void)getOderList:(NSString*)sid status:(NSString*) status offset:(NSInteger) offset pageSize:(NSInteger) pageSize
{
//    status：0,1为新订单，2、3、4为已发货的订单，5、6为已收货的订单，7、8、9为取消
    NSDictionary *data =@{@"sbid":sid,@"status":status,@"offset":i2s(offset),@"pageSize":i2s(pageSize)};
    //    NSDictionary *data = @{@"data":[self setParams:dataDc]};
    NSLog(@"%@",data);
    //前面写服务器给的域名,后面拼接上需要提交的参数，假如参数是key＝1
    __weak OrderListController *weakSelf = self;
    [AFNHelper get:getOrderList parameters:data success:^(id responseObject) {
        OrderListModel *dataModel = [[OrderListModel alloc]initWithDictionary:responseObject error:nil];
        if(dataModel.code == 28){
            weakSelf.bt = [BBGToast makeText:dataModel.message];
            [weakSelf.bt showWithType:ShortTime];
            //此处跳转到首页
            self.arrayData = dataModel.data;
            [self.tableView reloadData];
        }else {
            weakSelf.bt = [BBGToast makeText:dataModel.message];
            [weakSelf.bt showWithType:ShortTime];
        }
        
    } faliure:^(id error) {
        weakSelf.bt = [BBGToast makeText:@"网络请求失败，请检查网络后重试"];
        [weakSelf.bt showWithType:ShortTime];
    }];
}



@end
