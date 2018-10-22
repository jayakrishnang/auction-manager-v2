# Auction Manager v2.0

## OVERVIEW
The new version of Auction Manager will bring in all the latest technologies in the world, to create an extremely intuitive and fun platform to host your auctions. This would mean we’ll be creating a new app from the scratch, rectifying all the missteps in the backend design of v1.0.

## ROLES
Super Admin - This guy creates the admins and handles the environment related content.
Admin/Auctioneer - This guy creates the auctions and hosts them.
Team Owners - This guy handles a team or more and participates in an auction.
Player - The players can track their stats, auction info and other stuff.

## NEW FEATURES
###### Multiple Auctions
Ability to create an auction and carry it out with the chosen teams and players, rather than creating a new system for every auction.
###### Super Admin Module
This is where the admin creates the users and manages content in the app.

###### Admin / Auctioneer Module
The auctioneer can create auctions, add players and teams to the process. The user can also track history of all the auctions conducted and everything in the world he possibly wants to know.

###### New Auction Arena
New UI that is more attractive, but the process is mostly the same as the current UI.

###### Team Dashboard
The team owners/ admins can use this view to find info on each team.

###### Player Dashboard
The player info, stats and auction data can be viewed in this page
Wishlist - This can be a feature that will allow the team owners to create a priority of players he might want to pick in the auction. This is a fragile process considering this might not be a one dimensional choice.

###### New Auction Arena
Bring in Node JS with Socket IO to create a hiccup free, lightning speed auction process

###### New DB Design
A backend design that is much more tied to the real world entities.

## NEW PAGES
###### Auction List
This would be the home page for now, at least for admin users. The page would list all the auctions for admin where they can edit the details. And for team owners, they can view the auctions they are associated with

###### Team Show Page
This would be the homepage for the team owners. This will show a drop down of all the auctions the team has taken part in. On selecting one, it will show the team, the purse details of the team in this auction.

###### Players List page
This will show the list of all users. It will have a show button for the team owners which would show their info. For admin, they will have a ‘PICK FOR AUCTION’ button that would set it as the current_bidding_player

###### Player Show Page
This UI would show the info of a user

###### Auction Arena (Auction show page)
This is where the auction takes place.

## FAQ
Role based models
Throughout the app, users with player role will be called players.
