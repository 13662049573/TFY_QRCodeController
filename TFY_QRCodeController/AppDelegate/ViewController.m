//
//  ViewController.m
//  TFY_QRCodeController
//
//  Created by 田风有 on 2019/6/13.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "ViewController.h"
#import "TFY_ScanViewController.h"
#import "ViewTableViewCell.h"

#import "DrawQrViewController.h"
#import "DrawBarViewController.h"
@interface ViewController ()
@property(nonatomic , strong)UITableView *tableView;
@property(nonatomic , copy)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView tfy_AutoSize:0 top:0 right:0 bottom:0];
    
    self.dataArray = @[@"扫一扫",@"扫描二维码",@"扫描条形码",@"绘制二维码",@"绘制条形码"];
    
    [self LayouttableView];
}

-(void)LayouttableView{
    [self.tableView tfy_tableViewMaker:^(TFY_TableViewMaker * _Nonnull tableMaker) {
        
        [tableMaker tfy_addSectionMaker:^(TFY_SectionMaker * _Nonnull sectionMaker) {
            
            [sectionMaker.tfy_dataArr(TFY_DataArr(self.dataArray)) tfy_cellMaker:^(TFY_CellMaker * _Nonnull cellMaker) {
                
                cellMaker.tfy_cellClass(TFY_CellClass(ViewTableViewCell))
                .tfy_adapter(^(__kindof ViewTableViewCell *cell,id data, NSIndexPath *indexPath){
                    
                    cell.text_str = data;
                })
                .tfy_event(^(__kindof UITableView *tableView,NSIndexPath *indexPath,id data){
                    
                    if (indexPath.row==0) {
                        TFY_ScanViewController *scan = [[TFY_ScanViewController alloc] initWithQrType:TFY_ScanTypeAll onFinish:^(NSString * _Nonnull result, NSError * _Nonnull error) {
                           
                            [TFY_ProgressHUD showSuccessWithStatus:result];
                        }];
                        [self.navigationController pushViewController:scan animated:YES];
                    }
                    else if (indexPath.row == 1){
                        TFY_ScanViewController *scan = [[TFY_ScanViewController alloc] initWithQrType:TFY_ScanTypeQrCode onFinish:^(NSString * _Nonnull result, NSError * _Nonnull error) {
                            
                            [TFY_ProgressHUD showSuccessWithStatus:result];
                        }];
                        [self.navigationController pushViewController:scan animated:YES];
                    }
                    else if (indexPath.row == 2){
                        TFY_ScanViewController *scan = [[TFY_ScanViewController alloc] initWithQrType:TFY_ScanTypeBarCode onFinish:^(NSString * _Nonnull result, NSError * _Nonnull error) {
                            
                            [TFY_ProgressHUD showSuccessWithStatus:result];
                        }];
                        [self.navigationController pushViewController:scan animated:YES];
                    }
                    else if (indexPath.row == 3){
                        [self.navigationController pushViewController:[DrawQrViewController new] animated:YES];
                    }
                    else if (indexPath.row == 4){
                        [self.navigationController pushViewController:[DrawBarViewController new] animated:YES];
                    }
                })
                .tfy_rowHeight(60);
            }];
            
        }];
        
    }];
}



-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.showsHorizontalScrollIndicator=NO;
        _tableView.separatorInset= UIEdgeInsetsMake(0,20,0,20);
        _tableView.separatorColor = [UIColor tfy_ColorWithHexString:@"E8E8E8"];
        _tableView.estimatedRowHeight=30;
        _tableView.rowHeight=UITableViewAutomaticDimension;
    }
    return _tableView;
}

@end
