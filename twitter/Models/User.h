//
//  User.h
//  twitter
//
//  Created by amandahar on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSString *profileImageURL;

// create initializer to set all properties of a user based off the dictionary returned
// initializerd are kind of like contructors
// instance type refers to the type of the file so this initializer will return a user
-(instancetype)initWithDictionary:(NSDictionary *) dictionary;


@end

NS_ASSUME_NONNULL_END
