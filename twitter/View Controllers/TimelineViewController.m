//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "../Models/Tweet.h"
#import "TweetCellTableViewCell.h"
#import "UIImageView+AFNetworking.h"


@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *tweets;
@property (weak, nonatomic) IBOutlet UITableView *tweetTableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tweetTableView.dataSource = self;
    self.tweetTableView.delegate = self;
    
    [self fetchTweets];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    
    [self.refreshControl addTarget:self action:@selector(fetchTweets) forControlEvents:UIControlEventValueChanged];
    [self.tweetTableView insertSubview:self.refreshControl atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchTweets {
    self.tweets = [NSArray new];
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweetsArray, NSError *error) {
        if (tweetsArray) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            self.tweets = tweetsArray;
            [self.tweetTableView reloadData];
            
            for (Tweet *tweet in self.tweets) {
                NSLog(@"%@", [tweet text]);
            }
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        
        [self.refreshControl endRefreshing];
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


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TweetCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCellTableViewCell"];
    
    Tweet *tweet = self.tweets[indexPath.row];
    
    NSString *profileImage = tweet.user.profileImageURL;
    NSURL *profileImageURL = [NSURL URLWithString:profileImage];
    cell.profilePictureImage.image = nil;
    [cell.profilePictureImage setImageWithURL:profileImageURL];
    
    cell.nameLabel.text = tweet.user.name;
    cell.screenNameLabel.text = tweet.user.screenName;
    cell.tweetTextLabel.text = tweet.text;
    NSString *numRetweets = [NSString stringWithFormat:@"%i", tweet.retweetCount];
    cell.retweetCountLabel.text = numRetweets;
    NSString *numLikes = [NSString stringWithFormat:@"%i", tweet.favoriteCount];
    cell.likeCountButton.text = numLikes;
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tweets.count;
     /*
    NSInteger *numOfTweetsOnTimeline = self.tweets.count;
    return numOfTweetsOnTimeline;
    */
}



@end
