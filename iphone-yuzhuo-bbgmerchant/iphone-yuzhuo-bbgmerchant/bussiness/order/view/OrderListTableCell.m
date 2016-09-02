//
//  OrderListTableCell.m
//  iphone-yuzhuo-bbgmerchant
//
//  Created by yuzhuo on 16/8/31.
//  Copyright © 2016年 bianbiangou. All rights reserved.
//

#import "OrderListTableCell.h"
#import "IrisStyle.h"
#import "BBGConfig.h"
#import "OrderInfoModel.h"

@interface OrderListTableCell()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *content;

@end

@implementation OrderListTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//设置有箭头指向图标
        [self initSubViews];
    }
    return self;
}

-(void) initSubViews
{
    self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 16, 30, 30)];
    [self addSubview:self.icon];
    
    UIFont *titleFont = [UIFont systemFontOfSize:16];
    UIFont *contenFont = [UIFont systemFontOfSize:12];
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(60, 13, kScreenW-95, 16)];
    self.content = [[UILabel alloc] initWithFrame:CGRectMake(60, 37, kScreenH-95, 12)];
    self.title.textColor = [UIColor blackColor];
    self.content.textColor = [UIColor nvColorWithcccccc];
    self.title.font = titleFont;
    self.content.font = contenFont;
    [self addSubview:self.title];
    [self addSubview: self.content];
}

#pragma mark - Setter

-(void)setData:(OrderInfoModel*)data
{
    _data = data;
    self.title.text = data.time;
    self.content.text = data.phoneNum;
}


@end
