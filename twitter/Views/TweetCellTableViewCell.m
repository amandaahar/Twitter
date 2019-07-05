//
//  TweetCellTableViewCell.m
//  twitter
//
//  Created by amandahar on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCellTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

//defining custom table cell
@interface TweetCellTableViewCell ()


@end

@implementation TweetCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    
}

-(void) refreshLikeData {
    if(self.tweet.favorited) {
        
        [self.likeButton setImage:[UIImage imageNamed:@"favor-icon-red.png"] forState:UIControlStateSelected | UIControlStateHighlighted];
        NSString *numLikes = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
        self.likeCountLabel.text = numLikes;
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
        
    }
    
        [self.likeButton setImage:[UIImage imageNamed:@"favor-icon.png"] forState:UIControlStateSelected | UIControlStateHighlighted];
        NSString *numLikes = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];
        self.likeCountLabel.text = numLikes;
        [[APIManager shared] unFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    
    

}

-(void) refreshRetweetData {
    if (self.tweet.retweeted) {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green.png"] forState:UIControlStateSelected | UIControlStateHighlighted];
        NSString *numRetweets = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
        self.retweetCountLabel.text = numRetweets;
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
        
    }
    
    if(!self.tweet.retweeted) {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon.png"] forState:UIControlStateSelected | UIControlStateHighlighted];
        NSString *numRetweets = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
        self.retweetCountLabel.text = numRetweets;
        [[APIManager shared] unRetweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    
    
}
        

- (IBAction)didTapLike:(id)sender {
    
    if (self.tweet.favorited) {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self.likeButton setSelected:NO];
    } else if (!self.tweet.favorited) {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self.likeButton setSelected:YES];
        
    }
    
    [self refreshLikeData];
    
}
- (IBAction)didTapRetweet:(id)sender {
    NSLog(@"retweet button clicked");
    if (self.tweet.retweeted) {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self.retweetButton setSelected:NO];
    } else if (!self.tweet.retweeted) {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self.retweetButton setSelected:YES];
        
    }
    
    [self refreshRetweetData];
}



@end
