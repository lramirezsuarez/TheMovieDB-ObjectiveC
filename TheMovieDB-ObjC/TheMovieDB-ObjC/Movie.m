//
//  Movie.m
//  TheMovieDB-ObjC
//
//  Created by Jaime Laino on 2/27/17.
//  Copyright © 2017 LuisRamirez. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Movie.h"

@implementation Movie

static NSString * const BaseImageURLString = @"https://image.tmdb.org/t/p/w780";

//-(id)initWithIdentification: (NSInteger)identification name:(NSString*)name overview:(NSString*)overview poster:(NSString*)poster {
//    self = [super init];
//    self.identification = identification;
//    self.name = name;
//    self.overview = overview;
//    self.poster = poster;
//    
//    return self;
//}

-(id)initWithDictionary:(NSDictionary*)result {
    
    self = [super init];
    self.identification = [[result objectForKey:@"id"] intValue];
    self.name = [result objectForKey:@"title"];
    self.overview = [result objectForKey:@"overview"];
    NSString *posterUrl = [NSString stringWithFormat:@"%@%@", BaseImageURLString, [result objectForKey:@"poster_path"]];
    self.poster = [NSURL URLWithString:posterUrl];
    
    return self;
}

+ (instancetype)buildWithDictionary:(NSDictionary *)result {
    Movie *m = [Movie new];
    
    m.identification = [[result objectForKey:@"id"] intValue];
    m.name = [result objectForKey:@"title"];
    m.overview = [result objectForKey:@"overview"];
    NSString *posterUrl = [NSString stringWithFormat:@"%@%@", BaseImageURLString, [result objectForKey:@"poster_path"]];
    m.poster = [NSURL URLWithString:posterUrl];
    
    return m;
}

@end
