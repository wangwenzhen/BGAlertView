//
//  ViewController.m
//  BGAlertViewDemo
//
//  Created by Little.Daddly on 2018/6/19.
//  Copyright © 2018年 Little.Daddly. All rights reserved.
//

#import "ViewController.h"

#import "BGAlertView+BGAdd.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)displayDemo:(UIButton *)sender {
    [BGAlertView showAlertViewWithEditingChangedHandler:^(NSString *string) {
        
    } actionTapedHandler:^(NSInteger index) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
