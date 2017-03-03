//
//  Movie.h
//  TheMovieDB-ObjC
//
//  Created by Jaime Laino on 2/27/17.
//  Copyright © 2017 LuisRamirez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, assign) NSInteger identification;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSURL *poster;

//-(id)initWithIdentification: (NSInteger)identification name:(NSString*)name overview:(NSString*)overview poster:(NSString*)poster;
- (id)initWithDictionary:(NSDictionary *)result;

+ (instancetype)buildWithDictionary:(NSDictionary *)result;

@end
