//
//  ViewController.m
//  TableCellCardDropAnimationExample
//
//  Created by subhajit halder on 25/11/16.
//  Copyright © 2016 SubhajitHalder. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (assign, nonatomic) CATransform3D initialTransformation;
@property (assign, nonatomic) CATransform3D secondTransformation;

@property (weak, nonatomic) IBOutlet UITableView *tableViewFeed;

@property (nonatomic, strong) NSMutableArray *shownIndexes;


@end

@implementation ViewController {
    NSIndexPath *currentIndexPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _shownIndexes = [NSMutableArray array];
    
        CGFloat rotationAngleDegrees = -15;
        CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/180);
        CGPoint offsetPositioning = CGPointMake(0, 280);
    
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, rotationAngleRadians, 1.0, 0.0, 0.0);
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, 0.0);
        self.initialTransformation = transform;
    
        offsetPositioning = CGPointMake(0, -280);
    
        transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, rotationAngleRadians, 1.0, 0.0, 0.0);
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, 0.0);
        
        self.secondTransformation = transform;

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5.f;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (![self.shownIndexes containsObject:indexPath]) {

        currentIndexPath = indexPath;

        [self.shownIndexes addObject:indexPath];

        UIView *card = [(TableViewCell *)cell mainView];
        card.layer.transform = self.initialTransformation;
        card.layer.opacity = 0.75f;
        [UIView animateWithDuration:0.8f animations:^{
            card.layer.transform = CATransform3DIdentity;
            card.layer.opacity = 1.f;
        }];

    }
    else
    {

        currentIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section + 1];

        UIView *card = [(TableViewCell *)cell mainView];

        card.layer.transform = self.secondTransformation;
        card.layer.opacity = 0.75f;
        [UIView animateWithDuration:0.8f animations:^{
            card.layer.transform = CATransform3DIdentity;
            card.layer.opacity = 1.f;
        }];


    }

}


- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSIndexPath *lastPath = [self.shownIndexes lastObject];

    if([indexPath compare:lastPath] == NSOrderedSame)
    {
        [self.shownIndexes removeLastObject];

    }


}


@end
