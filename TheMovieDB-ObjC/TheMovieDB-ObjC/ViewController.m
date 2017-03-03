//
//  ViewController.m
//  TheMovieDB-ObjC
//
//  Created by Jaime Laino on 2/27/17.
//  Copyright © 2017 LuisRamirez. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIImageView+AFNetworking.h>
#import "ViewController.h"
#import "Movie.h"
#import "MoviesFacade.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *moviesArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MoviesFacade *facade = [[MoviesFacade alloc] init];
     [facade retrieveMovies:^(NSArray *movies){
         self.moviesArray = movies;
         [tableViewMovies reloadData];
    }];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.moviesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Movie *movie = self.moviesArray[indexPath.row];//[moviesArray objectAtIndex:indexPath.row];
    
    [cell.textLabel setText: movie.name];
    [cell.detailTextLabel setText:movie.overview];
    [cell.imageView setImageWithURL:movie.poster];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Movie *movie = self.moviesArray[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"Movie with %@", movie.name];
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Movie"
                                 message:str
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
    
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
