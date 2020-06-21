//
//  CitiesViewController.m
//  MyAvia
//
//  Created by Андрей Закусов on 23.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "CitiesViewController.h"
#import "CityTableViewCell.h"
#import "DataManager.h"
#import "CityMapViewController.h"

@interface CitiesViewController ()

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) CitiesViewController *resultsController;

@end

@implementation CitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDataComplete:) name:kDataManagerLoadDataDidComplete object:nil];
    [[DataManager sharedInstance] loadData];
    
    if (!_isSearch){
        _resultsController = [[CitiesViewController alloc] init];
        _resultsController.isSearch = YES;
        _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultsController];
        _searchController.searchResultsUpdater = self;
        self.tableView.tableHeaderView = _searchController.searchBar;
    }else{
        [self.tableView setContentOffset:CGPointMake(0.0f, 40) animated:NO];
    }

}

- (void)loadDataComplete:(NSNotification *)notification {
    _citiesArray = [[DataManager sharedInstance] cities];
    [self.tableView reloadData];
}

- (void)update {
    [self.tableView reloadData];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_citiesArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CitieIdentifier"];
    if (!cell) {
        cell = [[CityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CitieIdentifier"];
    }
    
    City *city = [_citiesArray objectAtIndex:indexPath.row];
    cell.leftLabel.text = city.name;
    cell.rightLabel.text = city.code;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    City *city = [_citiesArray objectAtIndex:indexPath.row];
    
    CityMapViewController *controller = [CityMapViewController new];
    controller.currentCity = city;
    [self.navigationController pushViewController: controller animated:YES];
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchBar.text) {
        _resultsController.citiesArray = [self.citiesArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd] %@", searchController.searchBar.text]];
        [_resultsController update];
    }
}


@end
