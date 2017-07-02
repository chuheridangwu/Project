//
//  ProductDisplayView.m
//  ManMao
//
//  Created by DYM on 16/7/1.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "ProductDisplayView.h"
#import "HomeDataEntity.h"

@interface ProductDisplayView ()
{
    UIImageView *_imageView;
    UILabel *_title;
    UILabel *_priceL;
    
    UILabel *_shareBtn;
}
@end

@implementation ProductDisplayView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 3);
        [self addSubview:btn];
        [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchDown];
        btn.backgroundColor = [UIColor whiteColor];
        
        //价格
        _priceL = [UILabel new];
        _priceL.numberOfLines = 1;
        _priceL.font = [UIFont systemFontOfSize:11];
        _priceL.textAlignment = NSTextAlignmentLeft;
        _priceL.textColor = [UIColor grayColor];
        [self addSubview:_priceL];
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(5);
            make.centerY.offset(0);
            make.width.height.equalTo(self.mj_h - 10);
        }];
        
        
        _title = [UILabel new];
        _title.numberOfLines = 2;
        _title.font = [UIFont systemFontOfSize:14];
        _title.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_title];
        
        [_title makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView.mas_right).offset(6);
            make.right.offset(-5);
            make.bottom.equalTo(_priceL.mas_top).offset(-2);
            make.top.equalTo(_imageView.mas_top).offset(5);
        }];
        
       
        [_priceL makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView.mas_right).offset(5);
            make.right.offset(-5);
            make.bottom.equalTo(_imageView.mas_bottom).offset(-2);
        }];
        
    }
    return self;
}


-(void)setModel:(HomeDataEntity *)model{
    _model = model;
    
    if ([model.icon isValidUrl]) {
      [_imageView sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"zhanwei"] completed:nil];
    }else{
        [_imageView  setImage:[UIImage imageNamed:model.icon]];
    }
    
    _title.text = model.name;
    _priceL.text = [NSString stringWithFormat:@"%@",model.cardDesc];
}

- (void)clickBtn{
    [self.delegate ProductDisplayViewWith:self.model];
}
@end
