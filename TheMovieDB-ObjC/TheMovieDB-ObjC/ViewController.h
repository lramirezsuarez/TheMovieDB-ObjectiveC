//
//  ViewController.h
//  TheMovieDB-ObjC
//
//  Created by Jaime Laino on 2/27/17.
//  Copyright © 2017 LuisRamirez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *tableViewMovies;
}

@end

