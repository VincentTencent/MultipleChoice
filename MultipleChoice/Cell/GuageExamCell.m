//
//  GuageExamCell.m
//  Test
//
//  Created by TOUCH on 16/9/14.
//  Copyright © 2016年 shikun. All rights reserved.
//

#import "GuageExamCell.h"

@implementation GuageExamCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView = ({
            CGRect frame = CGRectMake(10, 12, 20, 20);
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:frame];
            [self addSubview:imgView];
            imgView;
        });
        
        self.optionLabel = ({
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(CGRectGetMaxX(self.imgView.frame)+20, 0, self.frame.size.width-50, 44);
            [self addSubview:label];
            label;
        });
        
    }
    return self;
}

@end
