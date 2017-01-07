//
//  ViewController.m
//  CHMeditorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "ViewController.h"
#import "CHMediator+CHModuleABehaviour.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIViewController *controller =  [[CHMediator sharedInstance] fetchPresentViewControllerWithIdentifer:1001];
        if ([controller isKindOfClass:[NSError class]]) {
            return;
        }
        [self presentViewController:controller animated:YES completion:^{
            
        }];
    }else if (indexPath.row == 1){
        UIViewController *controller =  [[CHMediator sharedInstance] fetchPushViewController];
        [self.navigationController pushViewController:controller animated:YES];
    }
}
@end
