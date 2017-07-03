//
//  XMGChatingViewController.m
//  07-聊天布局
//
//  Created by xiaomage on 15/6/5.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGChatingViewController.h"
#import "XMGMessage.h"
#import "XMGMessageCell.h"
//#import "XMGMeCell.h"
//#import "XMGOtherCell.h"

@interface XMGChatingViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *messages;
@property (weak, nonatomic) IBOutlet UITextField *messageField;
@end

@implementation XMGChatingViewController

- (NSArray *)messages
{
    if (_messages == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *messageArray = [NSMutableArray array];
        // 用来记录上一条消息模型
        XMGMessage *lastMessage = nil;
        for (NSDictionary *dict in dictArray) {
            XMGMessage *message = [XMGMessage messageWithDict:dict];
            message.hideTime = [message.time isEqualToString:lastMessage.time];
            [messageArray addObject:message];
            
            lastMessage = message;
        }
        
        _messages = messageArray;
    }
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"客服中心";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置文本框左边的内容
    UIView *leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(0, 0, 10, 0);
    self.messageField.leftView = leftView;
    self.messageField.leftViewMode = UITextFieldViewModeAlways;
    
    // 监听键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(clickView)];
    [self.view addGestureRecognizer:pan];
}

- (void)clickView{
    // 退出键盘
    [self.view endEditing:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 键盘处理
- (void)keyboardWillChangeFrame:(NSNotification *)note {
    // 取出键盘最终的frame
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 取出键盘弹出需要花费的时间
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 修改transform
    [UIView animateWithDuration:duration animations:^{
        CGFloat ty = [UIScreen mainScreen].bounds.size.height - rect.origin.y;
        self.view.transform = CGAffineTransformMakeTranslation(0, - ty);
    }];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出模型
    XMGMessage *msg = self.messages[indexPath.row];
    
    // 重用标识（决定了cell的类型）
    NSString *ID = (msg.type == XMGMessageTypeMe) ? @"me" : @"other";
    
    // 加载cell
    XMGMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.message = msg;
    
    return cell;
   
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGMessage *message = self.messages[indexPath.row];
    return message.cellHeight;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 退出键盘
    [self.view endEditing:YES];
}
@end
