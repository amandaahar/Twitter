//
//  ComposeViewController.m
//  twitter
//
//  Created by amandahar on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "Tweet.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *composeTweetText;
@property (nonatomic, strong) Tweet *composedTweet;

- (IBAction)closeButton:(id)sender;
- (IBAction)composeTweetButton:(id)sender;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *tweetText = _composeTweetText.text;
    _composedTweet = [Tweet new];
    //NSError *error = [NSError new];
    [[APIManager shared] postStatusWithText:tweetText completion:_composedTweet];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)composeTweetButton:(id)sender {
}
@end
