//
//  AirportTableViewCell.m
//  MyAvia
//
//  Created by Андрей Закусов on 23.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "AirportTableViewCell.h"
#import "AirportsViewController.h"

@implementation AirportTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width - 60, 44.0)];
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_leftLabel];
        
        _rightSwitch = [[UISwitch alloc] initWithFrame: CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 7.0, 50, 30.0)];
        [self.contentView addSubview:_rightSwitch];
        
        [_rightSwitch addTarget:self action:@selector(rightSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        
        
        
    }
    return self;
}

- (void)rightSwitchChanged:(id)sender {
    UISwitch *switchControl = sender;
    [_delegate airortSwithChangedON:switchControl.on inCell: self];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setON {
   [_rightSwitch setOn:YES];
}
@end
