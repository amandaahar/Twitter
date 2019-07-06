# Project 3 - Twitter

Twitter is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **X** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User sees app icon in home screen and styled launch screen
- [X] User can sign in using OAuth login flow
- [X] User can Logout
- [X] User can view last 20 tweets from their home timeline
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] User can pull to refresh.
- [X] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [X] User can compose a new tweet by tapping on a compose button.
- [X] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation.

The following **optional** features are implemented:

- [ ] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [ ] User can view their profile in a *profile tab*
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] Profile view should include that user's timeline
- [ ] User should display the relative timestamp for each tweet "8m", "7h"
- [X] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [ ] Links in tweets are clickable.
- [ ] User can tap the profile image in any tweet to see another user's profile
- Contains the user header view: picture and tagline
- Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 140) (**1 point**)
- [X] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [ ] User sees embedded images in tweet if available
- [ ] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I would like to dicuss more on how to wire up the network request for the infinite scroll. (fetch tweets?)
2. How to use outside pods and projects etc from GitHub in our own project

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/B9N8eCSrhr.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/fYEHKwTXJi.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

This app was very challenging to make and more time consuming than I anticipated. One of the most challenging aspects was figuring out the connection between the API Manager and the data then trying to get it to display on my app. Particularly when trying to compose new tweets it was challenging trying to get the tweet to show up on my timeline and update on twitter. I attempted the infinite scroll stretch feature, and it was challenging trying to figure out where to place all of the code. 

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

Copyright [2019] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
