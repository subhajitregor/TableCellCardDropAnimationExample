//
//  TableViewCell.m
//  TableCellCardDropAnimationExample
//
//  Created by subhajit halder on 25/11/16.
//  Copyright © 2016 SubhajitHalder. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
