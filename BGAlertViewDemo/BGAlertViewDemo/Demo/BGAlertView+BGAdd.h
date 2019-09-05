//
//  BGAlertView+BGAdd.h
//  BGAlertViewDemo
//
//  Created by Little.Daddly on 2018/6/19.
//  Copyright © 2018年 Little.Daddly. All rights reserved.
//

#import "BGAlertView.h"
#import "AKGetDeviceListModel.h"
@interface BGAlertView (BGAdd)
/**
 输入框
 包含一个标题
 包含两个输入框,一个姓名,一个身份证
 包含确认、取消
 */
+ (void)showAlertViewWithEditingChangedHandler:(void(^)(NSString *string))editHandler
                            actionTapedHandler:(BGAlertViewActionHandler)actionHandler;

+ (void)showSheetViewWithEditingChangedHandler:(void (^)(NSString *))editHandler
                            actionTapedHandler:(BGAlertViewActionHandler)actionHandler;

+ (void)showSheetViewLevelWithEditingChangedHandler:(void (^)(NSString *))editHandler
                                 actionTapedHandler:(BGAlertViewActionHandler)actionHandler;


/**
 自动隐藏 文本提示窗
 换行 请 加入\n 自动适配 提示宽度
 
 @param title 提示
 */
+ (void)autoHiddenTitleTip:(NSString *)title;



/** title + 水平按钮左右按钮 */
+ (void)normalAlertWithTitle:(NSString *)title subBtnTitle:(NSArray *)btnTitles actionTapedHandler:(BGAlertViewActionHandler)actionHandler;

/** 常在任务弹窗 垂直布局*/
+ (void)alertTitle:(NSString *)title actionTitles:(NSArray *)titles actionTapedHandler:(BGAlertViewActionHandler)actionHandler closeOption:(void (^)(void))option;
/** 底部自动隐藏 */
+ (instancetype)botAutoHiddenWithTit:(NSString *)title;
/** 常驻不消失 */
+ (instancetype)titleTip:(NSString *)title;
- (void)modifyTipTitle:(NSString *)title;

/** 默认加入window */
+ (instancetype)waitView;
+ (instancetype)addWaitViewTo:(UIView *)superview;
- (void)closeWaitView;


+ (void)errorTip:(NSString *)title actionTapedHandler:(BGAlertViewActionHandler)actionHandler;

+ (instancetype)replaceMachineAlertWithModel:(AKGetDeviceListModel *)model
                          actionTapedHandler:(void (^)(NSInteger index,BGAlertView *view,AKDeviceListModel *model))actionTapedHandler;
/** 评论底部通用弹窗 */
+ (instancetype)botCommentPopActionTapedHandler:(void (^)(NSInteger index,BGAlertView *view))actionTapedHandler;
@end
