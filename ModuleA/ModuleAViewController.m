//
//  ModuleAViewController.m
//  CHMeditorDemo
//
//  Created by Chausson on 2016/12/29.
//  Copyright © 2016年 Chausson. All rights reserved.
//

#import "ModuleAViewController.h"

@interface ModuleAViewController ()

@end

@implementation ModuleAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x-50, self.view.center.y-15, 100, 30)];
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = 1;
    
    [self.view addSubview:self.titleLabel ];
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.backgroundColor = [UIColor lightGrayColor];
    cancel.titleLabel.textColor = [UIColor whiteColor];
    [cancel setTitle:@"cancel" forState:UIControlStateNormal];
    cancel.frame  = CGRectMake(self.titleLabel.frame.origin.x, CGRectGetMaxY(self.titleLabel.frame)+15, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    [cancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancel];
}

- (void)cancel{
    if (self.navigationController != nil) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    NSLog(@"dealloc");
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
