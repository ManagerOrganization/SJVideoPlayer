//
//  SJVideoPlayerMoreSettingsColCell.m
//  SJVideoPlayerProject
//
//  Created by BlueDancer on 2017/9/25.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SJVideoPlayerMoreSettingsColCell.h"
#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif
#if __has_include(<SJUIKit/SJAttributesFactory.h>)
#import <SJUIKit/SJAttributesFactory.h>
#else
#import "SJAttributesFactory.h"
#endif
#import "SJVideoPlayerMoreSetting+Exe.h"


@interface SJVideoPlayerMoreSettingsColCell ()

@property (nonatomic, strong, readonly) UIButton *itemBtn;

@end


@implementation SJVideoPlayerMoreSettingsColCell

@synthesize itemBtn = _itemBtn;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if ( !self ) return nil;
    [self _SJVideoPlayerMoreSettingsColCellSetupUI];
    return self;
}

- (void)clickedBtn:(UIButton *)btn {
    if ( self.model._exeBlock ) self.model._exeBlock(self.model);
}

- (void)setModel:(SJVideoPlayerMoreSetting *)model {
    _model = model;

    [_itemBtn setAttributedTitle:[NSAttributedString sj_UIKitText:^(id<SJUIKitTextMakerProtocol>  _Nonnull make) {
        if ( model.image ) {
            make.appendImage(^(id<SJUTImageAttachment>  _Nonnull make) {
                make.image = model.image;
            });
            
            if ( 0 != model.title.length ) {
                make.append(@"\n");
            }
        }
        
        make.append(model.title);
        make
        .font([UIFont systemFontOfSize:[SJVideoPlayerMoreSetting titleFontSize]])
        .textColor([SJVideoPlayerMoreSetting titleColor])
        .alignment(NSTextAlignmentCenter)
        .lineSpacing(6);
    }] forState:UIControlStateNormal];
}

- (void)_SJVideoPlayerMoreSettingsColCellSetupUI {
    [self.contentView addSubview:self.itemBtn];
    [_itemBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self->_itemBtn.superview);
    }];
}

- (UIButton *)itemBtn {
    if ( _itemBtn ) return _itemBtn;
    _itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_itemBtn addTarget:self action:@selector(clickedBtn:) forControlEvents:UIControlEventTouchUpInside];
    _itemBtn.titleLabel.numberOfLines = 0;
    _itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    return _itemBtn;
}

@end
