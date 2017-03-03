//
//  MoviesFacade.m
//  TheMovieDB-ObjC
//
//  Created by Jaime Laino on 2/28/17.
//  Copyright © 2017 LuisRamirez. All rights reserved.
//

#import "MoviesFacade.h"
#import <AFNetworking.h>

static NSString * const BaseURLString = @"https://api.themoviedb.org/3/movie/now_playing";

@implementation MoviesFacade

-(void)retrieveMovies: (void (^)(NSArray *movies))completionHandler{
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    NSDictionary *parameters = @{@"api_key": @"1f4d7de5836b788bdfd897c3e0d0a24b", @"page": @"1"};
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:BaseURLString parameters:parameters error:nil];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *jsonResults = (NSDictionary*)responseObject;
            NSArray *results = [jsonResults objectForKey:@"results"];
            for (id result in results){
                if([result isKindOfClass:[NSDictionary class]]){
                    //Movie *movie = [[Movie alloc]init];
                    Movie *movie = [[Movie alloc]initWithDictionary:result];
                    //Movie *movie1 = [Movie buildWithDictionary:result];
                    [movies addObject: movie];
                }
            }
            completionHandler(movies);
        }
    }];
    [dataTask resume];
}

@end
