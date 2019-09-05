//
//  BGAlertView+BGAdd.m
//  BGAlertViewDemo
//
//  Created by Little.Daddly on 2018/6/19.
//  Copyright © 2018年 Little.Daddly. All rights reserved.
//

#import "BGAlertView+BGAdd.h"
#import "AKWaitingView.h"
#import "AKReplaceMachinView.h"
#import "AKCommentBotPopView.h"
#import "AKUserM.h"
static const NSInteger BGAlertViewLableTag = 1400;
static const NSInteger BGAlertViewWaitViewTag = 1401;
static const NSInteger BGAlertViewUnionTag = 1402;
@implementation BGAlertView (BGAdd)
+ (void)showAlertViewWithEditingChangedHandler:(void (^)(NSString *))editHandler actionTapedHandler:(BGAlertViewActionHandler)actionHandler
{
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
    [self commonUpWith:view isLevel:NO editingChangedHandler:editHandler actionTapedHandler:actionHandler];
}

+ (void)showSheetViewWithEditingChangedHandler:(void (^)(NSString *))editHandler actionTapedHandler:(BGAlertViewActionHandler)actionHandler{
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeSheet];
    [self commonUpWith:view isLevel:NO editingChangedHandler:editHandler actionTapedHandler:actionHandler];
}

+ (void)showSheetViewLevelWithEditingChangedHandler:(void (^)(NSString *))editHandler actionTapedHandler:(BGAlertViewActionHandler)actionHandler{
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeSheet showType:BGAlertViewShowTypeLevel];
    [self commonUpWith:view isLevel:YES editingChangedHandler:editHandler actionTapedHandler:actionHandler];
}

+ (void)errorTip:(NSString *)title actionTapedHandler:(BGAlertViewActionHandler)actionHandler{
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
//    CGFloat Vright_Lwidth = -40.f;
    view.contentViewWidthRang = BGRangeMake(0, 150);
    view.maskKeyboard = YES;
    view.isAlwaysVisible = YES;
//    view.contentViewBottomKeyboardTop = 25.0f;
    view.paddingBot = 30;
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        
        contentView.backgroundColor = [UIColor whiteColor];
        [contentView union_addCornerRadius:15.0f];
    }];
    
    [view addTitleWithHandle:^(BGActionViewManager *action, UILabel *label) {
        //        action.size = 66.0f;
//        static inline BGEdge BGEdgeMake(CGFloat top,CGFloat left,CGFloat Vright_Lwidth,CGFloat height){
        action.bgEdge = BGEdgeMake(20, 0, 0, 40);
        label.text = title;
        label.font = [UIFont boldSystemFontOfSize:16.0f];
        label.textColor = [UIColor union_colorWithHex:0x333333];
    }];
    
    [view addActionViewIsBTType:NO withHandle:^(BGActionViewManager *action, UIButton *button) {
        action.bgEdge = BGEdgeMake(20, 10, -10, 40);
        
        [button setTitle:@"重新请求" forState:0];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [button setTitleColor:[UIColor union_colorWithHex:0xffffff] forState:0];
        button.backgroundColor = [UIColor union_colorWithHex:0xe75887];
        [button union_addCornerRadius:19.5f];
    } tapedOnHandler:actionHandler];
    
//    [view addActionViewIsBTType:NO withHandle:^(BGActionViewManager *manager, UIButton *button) {
//        manager.bgEdge = BGEdgeMake(20, 10, -10, 40);
//        [button setTitle:@"取消" forState:0];
//        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
//        [button setTitleColor:[UIColor union_colorWithHex:0x999999] forState:0];
//    } tapedOnHandler:actionTapedHandler];
    
    [self centerDefaultAni:view];
    
    [view showAlertViewOnKeyWindow];
}
+ (void)commonUpWith:(BGAlertView *)view isLevel:(BOOL)isLevel editingChangedHandler:(void (^)(NSString *))editHandler actionTapedHandler:(BGAlertViewActionHandler)actionHandler{
    CGFloat Vright_Lwidth = 0.f;
    if (isLevel) {
        Vright_Lwidth = -40;
    } else {
        Vright_Lwidth = 10;
    }
    view.maskKeyboard = NO;
    view.contentViewBottomKeyboardTop = 25.0f;
    view.paddingBot = 0;
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        
        contentView.backgroundColor = [UIColor whiteColor];
        [contentView union_addCornerRadius:15.0f];
    }];
    
    [view addTitleWithHandle:^(BGActionViewManager *action, UILabel *label) {
        //        action.size = 66.0f;
        action.bgEdge = BGEdgeMake(20, 20, -(Vright_Lwidth + 10), 40);
        label.text = @"确认收货人身份信息";
        label.font = [UIFont boldSystemFontOfSize:16.0f];
        label.textColor = [UIColor union_colorWithHex:0x333333];
    }];
    
    [view addTextFieldWithHandler:^(BGActionViewManager *action, UITextField *textField) {
        //        action.size = 38.0f;
        action.bgEdge = BGEdgeMake(20, 10, -Vright_Lwidth, 30);
        //        BGEdgeMake(<#CGFloat top#>, <#CGFloat left#>, CGFloat Vright_Lwidth, <#CGFloat height#>)
        textField.placeholder = @"输入收货人姓名";
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16.0f, 0)];
        textField.backgroundColor = [UIColor union_colorWithHex:0xf0f0f0];
        textField.textColor = [UIColor union_colorWithHex:0x333333];
        textField.font = [UIFont systemFontOfSize:14.0f];
        [textField union_addCornerRadius:19.0f];
        [textField setValue:[UIColor union_colorWithHex:0x999999] forKeyPath:@"_placeholderLabel.textColor"];
    } editingChangedHandler:editHandler];
    
    [view addTextFieldWithHandler:^(BGActionViewManager *action, UITextField *textField) {
        //        action.size = 38.0f;
        action.bgEdge = BGEdgeMake(20, 10, -Vright_Lwidth, 30);
        
        textField.placeholder = @"输入身份证号码";
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16.0f, 0)];
        textField.backgroundColor = [UIColor union_colorWithHex:0xf0f0f0];
        textField.textColor = [UIColor union_colorWithHex:0x333333];
        textField.font = [UIFont systemFontOfSize:14.0f];
        [textField union_addCornerRadius:19.0f];
        [textField setValue:[UIColor union_colorWithHex:0x999999] forKeyPath:@"_placeholderLabel.textColor"];
    } editingChangedHandler:editHandler];
    
    [view addActionViewIsBTType:NO withHandle:^(BGActionViewManager *action, UIButton *button) {
        action.bgEdge = BGEdgeMake(20, 10, -10, 40);
        //        action.size = 39.0f;
        
        [button setTitle:@"确定" forState:0];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [button setTitleColor:[UIColor union_colorWithHex:0xffffff] forState:0];
        button.backgroundColor = [UIColor union_colorWithHex:0xe75887];
        [button union_addCornerRadius:19.5f];
    } tapedOnHandler:actionHandler];
    
    [view addActionViewIsBTType:NO withHandle:^(BGActionViewManager *manager, UIButton *button) {
        manager.bgEdge = BGEdgeMake(20, 10, -10, 40);
        [button setTitle:@"取消" forState:0];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [button setTitleColor:[UIColor union_colorWithHex:0x999999] forState:0];
    } tapedOnHandler:actionHandler];
    
    [self alertDefaultAni:view];
    
    [view showAlertViewOnKeyWindow];
}

+ (instancetype)titleTip:(NSString *)title{
    return [BGAlertView isAutoHidden:NO withTitle:title];;
}
+ (instancetype)botAutoHiddenWithTit:(NSString *)title{
    return [BGAlertView isAutoHidden:YES withTitle:title];;
}

+ (BGAlertView *)isAutoHidden:(BOOL)isAutoHidden withTitle:(NSString *)title{
    CGSize size = [title union_stringSizeWithFontSize:16
                                              maxSize:CGSizeMake(
                                                                 MAXFLOAT,
                                                                 MAXFLOAT
                                                                 )];
    CGFloat h = size.height;
    CGFloat w = size.width;
    CGFloat padding_top = 7.;
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
    view.contentViewWidthRang = BGRangeMake(0, w + padding_top * 2);
    view.contentViewHeightRang = BGRangeMake(0, h + padding_top * 2);
    
    if (isAutoHidden) {
        view.autoHideTimeInterval = 1.f;
    } else {
        view.isAlwaysVisible = YES;
    }
    
    
    view.maskKeyboard = NO;
    view.paddingBot = 0;
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [UIColor clearColor];
        contentView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.15];
        [contentView union_addCornerRadius:12.0f];
    }];
    
    [view masContentViewConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(h + padding_top * 2);
        make.width.mas_equalTo(w + padding_top * 2);
        make.bottom.mas_equalTo(-45);
    }];
    
    [view addCustomViewWithHandler:^(BGActionViewManager *action, UIView *customView) {
        action.bgEdge = BGEdgeMake(0, 0, 0, padding_top * 2 + h);
        customView.backgroundColor = [UIColor clearColor];
        [customView union_addCornerRadius:19.5];
        
        [UILabel lw_createView:^(__kindof UILabel *lb) {
            lb.tag = BGAlertViewLableTag;
            lb.numberOfLines = 0;
            lb.font = [UIFont systemFontOfSize:16];
            lb.text = title;
            lb.backgroundColor = [UIColor clearColor];
            lb.textAlignment = NSTextAlignmentCenter;
            [customView addSubview:lb];
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        }];
    }];
    
    [self botAni:view];
    
    [view showAlertViewOnKeyWindow];
    return view;
}

+ (instancetype)replaceMachineAlertWithModel:(AKGetDeviceListModel *)model
                          actionTapedHandler:(void (^)(NSInteger index,BGAlertView *view,AKDeviceListModel *model))actionTapedHandler{
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
    view.contentViewWidthRang = BGRangeMake(0, UNION_SCREEN_WIDTH - 15 * 2);
    view.contentViewHeightRang = BGRangeMake(0, 500);
    view.actionViewShowType = BGAlertViewShowTypeVertical;
    view.maskKeyboard = NO;
    view.isAlwaysVisible = YES;
    view.contentViewBottomKeyboardTop = 25.0f;
    view.paddingBot = 0;
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.35];
        contentView.backgroundColor = [UIColor clearColor];
        [contentView union_addCornerRadius:15.0f];
    }];
    @weakify(view)
    [view addCustomViewWithHandler:^(BGActionViewManager *action, UIView *customView) {
//static inline BGEdge BGEdgeMake(CGFloat top,CGFloat left,CGFloat Vright_Lwidth,CGFloat height){
        action.bgEdge = BGEdgeMake(0, 0, 0, 500);
        customView.backgroundColor = [UIColor clearColor];
        [customView union_addCornerRadius:19.5];
        AKReplaceMachinView *replaceMachinView = [[AKReplaceMachinView alloc] initWithDeviceListModel:model];
        [replaceMachinView lw_AddToView:customView blockConfig:^(__kindof AKReplaceMachinView *v) {
           
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(0);
                make.left.mas_equalTo(10);
                make.right.mas_equalTo(-10);
                make.height.mas_equalTo(350);
            }];
            
            [v.listSingle subscribeNext:^(UIButton *x) {
                x.selected = YES;
                for (int i = 0; i < model.deviceList.count; i++) {
                    AKDeviceListModel *listModel = model.deviceList[i];
                    if (i == x.tag - 1) {
                        listModel.isSel = YES;
                    } else {
                        listModel.isSel = NO;
                        AKReplaceMachinItem *item = v.listView[i];
                        item.btn.selected = NO;
                    }
                }
            }];
            
            [v.botSingle subscribeNext:^(UIButton *x) {
                AKDeviceListModel *res = nil;
                for (int i = 0; i < model.deviceList.count; i++) {
                    AKDeviceListModel *listModel = model.deviceList[i];
                    if (listModel.isSel) {
                        res = listModel;
                    }
                }
                @strongify(view)
                actionTapedHandler(x.tag,view,res);
            }];
        }];
        
            
    }];
    
    [self centerDefaultAni:view];
    
    [view showAlertViewOnKeyWindow];
    return view;
}

+ (instancetype)waitView{
    
    BGAlertView *view = [BGAlertView createWaitCommon];
    [view showAlertViewOnKeyWindow];
    return view;
}

+ (instancetype)addWaitViewTo:(UIView *)superview{
    BGAlertView *view = [BGAlertView createWaitCommon];
    [view showAlertByAddToSupview:superview];
    return view;
}

+ (BGAlertView *)createWaitCommon{
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
    view.contentViewWidthRang = BGRangeMake(0, 38);
    view.contentViewHeightRang = BGRangeMake(0, 38);
    view.actionViewShowType = BGAlertViewShowTypeVertical;
    view.maskKeyboard = NO;
    view.isAlwaysVisible = YES;
    view.contentViewBottomKeyboardTop = 25.0f;
    view.paddingBot = 0;
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [UIColor clearColor];
        contentView.backgroundColor = [UIColor clearColor];
        [contentView union_addCornerRadius:15.0f];
    }];
    
    [view addCustomViewWithHandler:^(BGActionViewManager *action, UIView *customView) {
        action.bgEdge = BGEdgeMake(0, 0, 0, 38);
//        BGEdgeMake(0, 0, 0, 50);
        
        customView.backgroundColor = [UIColor clearColor];
        [customView union_addCornerRadius:19.5];
        [UIImageView lw_createView:^(__kindof UIImageView *v) {
            NSMutableArray *arr = [NSMutableArray array];
            for (int i = 1; i <= 35; i++) {
                NSString *imageStr = [NSString stringWithFormat:@"%@%d",@"ajloading",i];
                [arr addObject:[UIImage imageNamed:imageStr]];
            }
            v.animationImages = arr;
            v.animationDuration = 1;
            v.animationRepeatCount = 0;
            v.tag = BGAlertViewWaitViewTag;
            [customView addSubview:v];
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
            [v startAnimating];
        }];
        
//        [AKWaitingView lw_createView:^(__kindof AKWaitingView *waitV) {
//            waitV.tag = BGAlertViewWaitViewTag;
//            [customView addSubview:waitV];
//            [waitV mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.edges.mas_equalTo(0);
//            }];
//            [waitV startAnimation];
//        }];
    }];
    
    [self centerDefaultAni:view];
    return view;

}

- (void)modifyTipTitle:(NSString *)title {
    NSMutableArray *innerViews = [self valueForKeyPath:@"_innerViews"];
    for (BGActionViewManager *m in innerViews) {
        for (__kindof UIView *v in m.customView.subviews) {
            if (v.tag == BGAlertViewLableTag) {
                [(UILabel *)v setText:title];
            }
        }
    }
}

+ (void)autoHiddenTitleTip:(NSString *)title{
    
    
    [BGAlertView closeWindowAlert];
    
    CGSize size = [title union_stringSizeWithFontSize:16
                                              maxSize:CGSizeMake(
                                                                 MAXFLOAT,
                                                                 MAXFLOAT
                                                                 )];
    CGFloat h = ceilf(size.height);
    CGFloat w = ceilf(size.width);
    CGFloat padding_top = 7.;
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
    view.tag = BGAlertViewUnionTag;
    view.contentViewWidthRang = BGRangeMake(0, w + padding_top * 2);
    view.contentViewHeightRang = BGRangeMake(0, h + padding_top * 2);
    view.autoHideTimeInterval = 1.f;
    view.maskKeyboard = NO;
    view.paddingBot = 0;
    view.tapAlertViewClose = YES;
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [UIColor clearColor];
        contentView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
        [contentView union_addCornerRadius:15.0f];
    }];
    
    [view addCustomViewWithHandler:^(BGActionViewManager *action, UIView *customView) {

        action.bgEdge = BGEdgeMake(0, 0, 0, padding_top * 2 + h);
        customView.backgroundColor = [UIColor clearColor];
        [customView union_addCornerRadius:19.5];
        
        [UILabel lw_createView:^(__kindof UILabel *lb) {
            lb.tag = BGAlertViewLableTag;
            lb.numberOfLines = 0;
            lb.text = title;
            lb.font = [UIFont systemFontOfSize:16];
            lb.backgroundColor = [UIColor clearColor];
            lb.textAlignment = NSTextAlignmentCenter;
            [customView addSubview:lb];
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        }];
    }];
//    [view addActionViewIsBTType:NO withHandle:^(BGActionViewManager *action, UIButton *button) {
//        action.bgEdge = BGEdgeMake(0, 0, 0, 80);
//        //        action.size = 39.0f;
//        [button setTitle:title forState:0];
//        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
//        [button setTitleColor:[UIColor union_colorWithHex:0xffffff] forState:0];
//        button.backgroundColor = [UIColor clearColor];
//        [button union_addCornerRadius:19.5f];
//    } tapedOnHandler:nil];
    
    [self centerDefaultAni:view];
    
    
    
    [view showAlertViewOnKeyWindow];
    view.bounds = CGRectMake(0, 0, w, h);
}

+ (void)normalAlertWithTitle:(NSString *)title subBtnTitle:(NSArray *)btnTitles actionTapedHandler:(BGAlertViewActionHandler)actionHandler{
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
    view.actionViewShowType = BGAlertViewShowTypeLevel;
    view.contentViewWidthRang = BGRangeMake(270, 300);
    view.contentViewHeightRang = BGRangeMake(120, 150);
    view.maskKeyboard = NO;
    view.contentViewBottomKeyboardTop = 25.0f;
    view.paddingBot = 0;
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        contentView.backgroundColor = [UIColor whiteColor];
        [contentView union_addCornerRadius:15.0f];
    }];
    
    [view addTitleWithHandle:^(BGActionViewManager *action, UILabel *label) {
        action.bgEdge = BGEdgeMake(30, 20, 0, 40);
        label.text = title;
        label.font = [UIFont boldSystemFontOfSize:16.0f];
        label.textColor = [UIColor union_colorWithHex:0x333333];
    }];
    
   
    [view addActionViewIsBTType:NO withHandle:^(BGActionViewManager *action, UIButton *button) {
        action.bgEdge = BGEdgeMake(80, 20, 100, 40);
        [button setTitle:btnTitles.firstObject forState:0];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [button setTitleColor:[UIColor union_colorWithHex:0xffffff] forState:0];
        button.backgroundColor = [UIColor union_colorWithHex:0xe75887];
        [button union_addCornerRadius:19.5f];
    } tapedOnHandler:actionHandler];
    
    [view addActionViewIsBTType:NO withHandle:^(BGActionViewManager *manager, UIButton *button) {
        manager.bgEdge = BGEdgeMake(80, 30, 100, 40);
        [button setTitle:btnTitles.lastObject forState:0];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
        [button union_addCornerRadius:19.5f];
    } tapedOnHandler:actionHandler];
    
    
    [self alertDefaultAni:view];
    
    [view showAlertViewOnKeyWindow];
}
+ (void)alertTitle:(NSString *)title actionTitles:(NSArray *)titles actionTapedHandler:(BGAlertViewActionHandler)actionHandler closeOption:(void (^)(void))option{
    
    CGFloat Vright_Lwidth = -10.f;
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
    view.contentViewHeightRang = BGRangeMake(85 * titles.count, 85 * titles.count + 40);
    view.isAlwaysVisible = YES;
    view.maskKeyboard = NO;
    view.contentViewBottomKeyboardTop = 25.0f;
    view.paddingBot = 0;
    @weakify(view)
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [UIColor clearColor];
        [contentView union_addCornerRadius:15.0f];
        
        @strongify(view)
        contentView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            [view closeAlertView];
            if (option) {
                option();
            }
        }];
        [backgroundView addGestureRecognizer:tap];
    }];
    
    [view addTitleWithHandle:^(BGActionViewManager *action, UILabel *label) {
        //        action.size = 66.0f;
        action.bgEdge = BGEdgeMake(20, 20, -(Vright_Lwidth + 10), 40);
        label.text = title;
        label.font = [UIFont boldSystemFontOfSize:16.0f];
        label.textColor = [UIColor union_colorWithHex:0x333333];
    }];
    
    [titles enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [view addActionViewIsBTType:NO withHandle:^(BGActionViewManager *action, UIButton *button) {
            action.bgEdge = BGEdgeMake(20, 10, -10, 40);
            
            [button setTitle:obj forState:0];
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
            [button setTitleColor:[UIColor union_colorWithHex:0xffffff] forState:0];
            button.backgroundColor = [UIColor union_colorWithHex:0xe75887];
            [button union_addCornerRadius:19.5f];
        } tapedOnHandler:actionHandler];
    }];
    
    [self alertDefaultAni:view];
    
    [view showAlertViewOnKeyWindow];
}

+ (instancetype)botCommentPopActionTapedHandler:(void (^)(NSInteger index,BGAlertView *view))actionTapedHandler{
    
    CGFloat h = [AKCommentBotPopView height];
    CGFloat w = UNION_SCREEN_WIDTH;
    BGAlertView *view = [[BGAlertView alloc] initWithType:BGAlertViewTypeAlert];
    view.contentViewWidthRang = BGRangeMake(0, w);
    view.contentViewHeightRang = BGRangeMake(0, h);
    view.maskKeyboard = NO;
    view.tapAlertViewClose = YES;
    
    
    view.paddingBot = 0;
    [view setupSubviewsWithHandler:^(UIView *contentView, UIImageView *backgroundView) {
        backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75];
        contentView.backgroundColor = [UIColor whiteColor];
        
    }];
    
    [view masContentViewConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(h);
        make.width.mas_equalTo(w);
        make.bottom.mas_equalTo(0);
    }];
    @weakify(view)
    [view addCustomViewWithHandler:^(BGActionViewManager *action, UIView *customView) {
        action.bgEdge = BGEdgeMake(0, 0, 0, h);
        customView.backgroundColor = [UIColor clearColor];

        [AKCommentBotPopView lw_createAddToView:customView blockConfig:^(__kindof AKCommentBotPopView *v) {
            
            [v mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
            [v reload];
            [v.selSubject subscribeNext:^(NSNumber *x) {
                @strongify(view)
                if ([AKUserM isLogin]) {
                    actionTapedHandler([x integerValue],view);
                } else {
                    [view closeAlertView];
                    
                    [WDRouter openURL:JUMP_LOGIN_PAGE arg:nil error:nil completion:nil];
                }
                
            }];
        }];
    }];
    
    [self botAni:view];
    
    [view showAlertViewOnKeyWindow];
    return view;
}

#pragma mark - Animation
/** 从顶部滑到中间 */
+ (void)alertDefaultAni:(BGAlertView *)view {
    view.animationBeginHandler = ^(UIView *contentView, UIImageView *backgroundView, void (^completionHandler)(void)) {
        backgroundView.alpha = 0.0f;
        contentView.transform = CGAffineTransformMakeTranslation(0, -CGRectGetHeight(backgroundView.frame) / 2);
        [UIView animateWithDuration:0.25f
                         animations:^{
                             contentView.transform = CGAffineTransformIdentity;
                             backgroundView.alpha = 1.0f;
                         } completion:^(BOOL finished) {
                             completionHandler();
                         }];
    };
    
    view.animationCompletionHandler = ^(UIView *contentView, UIImageView *backgroundView, void (^completionHandler)(void)) {
        [UIView animateWithDuration:0.25f
                         animations:^{
                             contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(backgroundView.frame) / 2);
                             backgroundView.alpha = 0.0f;
                         } completion:^(BOOL finished) {
                             completionHandler();
                         }];
    };
}
/** 中央渐变 */
+ (void)centerDefaultAni:(BGAlertView *)view {
    view.animationBeginHandler = ^(UIView *contentView, UIImageView *backgroundView, void (^completionHandler)(void)) {
        backgroundView.alpha = 0.0f;
        [UIView animateWithDuration:0.25f
                         animations:^{
                             backgroundView.alpha = 1.0f;
                         } completion:^(BOOL finished) {
                             completionHandler();
                         }];
    };
    
    view.animationCompletionHandler = ^(UIView *contentView, UIImageView *backgroundView, void (^completionHandler)(void)) {
        [UIView animateWithDuration:0.25f
                         animations:^{
                             backgroundView.alpha = 0.0f;
                         } completion:^(BOOL finished) {
                             completionHandler();
                         }];
    };
}

/** 底部上滑动画 */
+ (void)botAni:(BGAlertView *)view {
    view.animationBeginHandler = ^(UIView *contentView, UIImageView *backgroundView, void (^completionHandler)(void)) {
        backgroundView.alpha = 0.0f;
        contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(contentView.frame) + 30.);
        [UIView animateWithDuration:0.5f
                         animations:^{
                             contentView.transform = CGAffineTransformIdentity;
                             backgroundView.alpha = 1.0f;
                         } completion:^(BOOL finished) {
                             completionHandler();
                         }];
    };
    
    view.animationCompletionHandler = ^(UIView *contentView, UIImageView *backgroundView, void (^completionHandler)(void)) {
        [UIView animateWithDuration:0.5f
                         animations:^{
                             contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(contentView.frame) + 50.);
                             backgroundView.alpha = 0.0f;
                         } completion:^(BOOL finished) {
                             completionHandler();
                         }];
    };
}
- (void)closeWaitView{
    NSMutableArray *innerViews = [self valueForKeyPath:@"_innerViews"];
    for (BGActionViewManager *m in innerViews) {
        for (__kindof UIView *v in m.customView.subviews) {
            if (v.tag == BGAlertViewWaitViewTag) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    dispatch_async_on_main_queue(^{
//                        [(AKWaitingView *)v stopAnimation];
                        [(UIImageView *)v stopAnimating];
                    });
                });
            }
        }
    }
    [self closeAlertView];
}

+ (void)closeWindowAlert{
    BGAlertView *alertV = [[UIApplication sharedApplication].keyWindow viewWithTag:BGAlertViewUnionTag];
    if (alertV) {
        alertV.hidden = YES;
        [alertV removeFromSuperview];
    } else {
        KCLog(@"mei 有找到 ");
    }
    
}
@end
