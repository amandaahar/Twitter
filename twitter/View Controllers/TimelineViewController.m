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
#import "ComposeViewController.h"


// VC becomes TV's data source and delegate 
@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *tweets;
// VC has a tableView that is a subview
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
    // self.tweets = [NSArray new];
    // Get timeline
    // these API completion blocks allow us to hand code ot the API manager thanit can execute later so
    // that your programis stuck waitintg on the data
    // API manager calls completion handler; completion black is denoted by the ^
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweetsArray, NSError *error) {
        if (tweetsArray) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            // VC stores data passed into completion handler/block
            self.tweets = tweetsArray;
            // reload table view
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
    


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}



//table view asks datasource for cell for row at

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    //setting TV reuse identifier
    TweetCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCellTableViewCell"];
    
    // getting specific tweet
    Tweet *tweet = self.tweets[indexPath.row];
    
    NSString *profileImage = tweet.user.profileImageURL;
    NSURL *profileImageURL = [NSURL URLWithString:profileImage];
    cell.profilePictureImage.image = nil;
    [cell.profilePictureImage setImageWithURL:profileImageURL];
    
    cell.tweet = tweet;
    cell.nameLabel.text = tweet.user.name;
    cell.screenNameLabel.text = tweet.user.screenName;
    cell.tweetTextLabel.text = tweet.text;
    NSString *numRetweets = [NSString stringWithFormat:@"%i", tweet.retweetCount];
    cell.retweetCountLabel.text = numRetweets;
    NSString *numLikes = [NSString stringWithFormat:@"%i", tweet.favoriteCount];
    cell.likeCountLabel.text = numLikes;
    
    
    return cell;
}

// TV asks datasource for # of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //the # of items returned from the API is returned to this function
    return self.tweets.count;
     /*
    NSInteger *numOfTweetsOnTimeline = self.tweets.count;
    return numOfTweetsOnTimeline;
    */
}



- (void)didTweet:(nonnull Tweet *)tweet {
    // NSArray *newTweet = [NSArray arrayWithObjects:tweet, nil];
    // self.tweets = [newTweet arrayByAddingObjectsFromArray:self.tweets];
    [self.tweets insertObject:tweet atIndex:0];
    [self.tweetTableView reloadData];
}



@end
