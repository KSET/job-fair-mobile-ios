# JobFair

[Job Fair](https://jobfair.fer.unizg.hr/) is the biggest career fair in Croatia which includes over 100 companies and is visited by over 3,000 students. The fair is held in the halls of the Faculty of Electrical Engineering and Computing in Zagreb. The goal is to offer students the chance to see what job and career opportunities there are in Croatia, as well as abroad, and to connect employers with the best students of the University of Zagreb. 

# Application

JobFair application provides all information for the [event]((https://jobfair.fer.unizg.hr/)). 

## Screens

- News list and details
- Presentations list per days and presentation details
- Workshops list per days and workshop details
- Companies list with industry filter and company details
- Booths location map
- Info

<p float="left">
  <img src="readme/about.png" width="150" />
  <img src="readme/news-list.png" width="150" /> 
  <img src="readme/workshops-list.png" width="150" /> 
  <img src="readme/presentation-details.png" width="150" /> 
  <img src="readme/companies-list.png" width="150" /> 
  <img src="readme/company-details.png" width="150" />
</p>

## Architecture
This project is written in clean architecture and it's covered with unit tests.

Following diagram briefly shows architecture used in the application:

![](readme/architecture-diagram.png "Application architecture diagram")

## Used libraries

CocoaPods is used as a dependency manager.

List of the main libraries used in the application:

- [Apollo](https://github.com/apollographql/apollo-ios) - used as a client for the GraphQL API
- [Kingfisher](https://github.com/onevcat/Kingfisher) - used for downloading and caching images from the web
- [FeedKit] (https://github.com/nmdias/FeedKit) - used as a client for fetching the RSS Feeds
- [RxSwift](https://github.com/ReactiveX/RxSwift) - used for reactive programming in Swift
- [XLPagerTabStrip](https://github.com/xmartlabs/XLPagerTabStrip) - used as Container View Controller that allows us to switch easily among a collection of view controllers

## Project setup

Some files or secrets should not be public. 

Below is the list of those files or values and instructions for the setup.

### Google Maps

- Add `Google-Service-Info.plist` and `Google-Service-Info-Test.plist` files to `SupportFiles` folder
- `Google-Service-Info-Test.plist` is used for `test` and `Google-Service-Info.plist` for `release` build.
- Add your Google Maps API key to proper google service plist under plist key `GOOGLE_MAPS_API_KEY`.

# Developed by Undabot

[![undabot_logo](https://user-images.githubusercontent.com/12301477/40064040-fcf22afe-585e-11e8-9315-9ecf70ebad7f.png)](https://undabot.com)

## About Undabot

We are coders, makers, thinkers, and creators of **#mobilemoments**. Would you like to join us? Check out the open positions at our [Careers](https://undabot.com/careers/) page!
