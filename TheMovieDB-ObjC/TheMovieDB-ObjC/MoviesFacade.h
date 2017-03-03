//
//  MoviesFacade.h
//  TheMovieDB-ObjC
//
//  Created by Jaime Laino on 2/28/17.
//  Copyright © 2017 LuisRamirez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface MoviesFacade : NSObject

@property (nonatomic, strong) NSMutableArray *movies;

-(void) retrieveMovies: (void (^)(NSArray *movies))completionHandler;

@end
