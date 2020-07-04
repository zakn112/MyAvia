//
//  NewsContentViewController.m
//  MyAvia
//
//  Created by Андрей Закусов on 31.05.2020.
//  Copyright © 2020 Андрей Закусов. All rights reserved.
//

#import "NewsContentViewController.h"

@interface NewsContentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentTopConstr;

@end

@implementation NewsContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _newsTitle.text = _news.title;
    _content.text = _news.content;
    
    self.newsTitle.alpha = 0.0;
    
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
        self.contentTopConstr.constant = 100.0;
        
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            self.newsTitle.alpha = 1.0;
        } completion:
         ^(BOOL finished) {
            self.content.alpha = 1.0;
        }];
        
    }];
    

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
