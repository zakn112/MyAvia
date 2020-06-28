//
//  AirportsViewController.m
//  MyAvia
//
//  Created by Андрей Закусов on 23.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "AirportsViewController.h"

#import "DataManager.h"


@interface AirportsViewController ()

@property (nonatomic, strong) NSArray *airportsArray;


@end

@implementation AirportsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataComplete:) name:kDataManagerLoadDataDidComplete object:nil];
    [[DataManager sharedInstance] loadData];
    
    _tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

}

- (void)loadDataComplete:(NSNotification *)notification {
    _airportsArray = [[DataManager sharedInstance] airports];
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_airportsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AirportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AirportIdentifier"];
    if (!cell) {
        cell = [[AirportTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AirportIdentifier"];
    }
    
    Airport *airport = [_airportsArray objectAtIndex:indexPath.row];
    cell.leftLabel.text = airport.name;
    cell.delegate = self;
    cell.airport = airport;
    
    if ([self.firstViewController.airportsArray containsObject:airport.name]) {
        [cell setON];
    }
    
    return cell;
}


-(void) airortSwithChangedON: (BOOL) on inCell: (AirportTableViewCell *) airportTableViewCell{
    if (on) {
        [_firstViewController addAirportInList: airportTableViewCell.airport];
    }
    else{
        [_firstViewController removeAirportInList: airportTableViewCell.airport];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
