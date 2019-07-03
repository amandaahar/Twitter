//
//  User.m
//  twitter
//
//  Created by amandahar on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    // [super init] initializes an object with the parent's class initializer
    self = [super init];
    
    if(self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profileImageURL = dictionary[@"profile_image_url_https"];
    }
    return self;
    
}

@end
