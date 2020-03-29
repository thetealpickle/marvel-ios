# Marvel Pickle

HELLO! <a href="https://www.thetealpickle.com">@THETEALPICKLE</a> HERE. Do you have an affinity for superheros and all things Marvel? New to SwiftUI and the Marvel API? Are you part of the Marvel Mobile Engineering Team? If you answered yes to any of these questions, then this is the repo for YOU!<br>

A recreation of the Marvel comic detail view through @thetealpickle lense 👀<br>

## Project Summary
This recreation, pulls in public comic data from the Marvel API.<br>
The comics are displayed in a list view once the data loads. The lsit rows are selectable and click to a child comic detail view.

## Folder Navigation
ALRIGHT, here's the layout

### marvel
- Info.plist
+ Delegates
  - AppDelegate
  - SceneDelegate

+ Models
  - App
  - Model
  - SampleData
  + Comic
    - Comic
    - ComicImage
  + Extensions
    - X10+Swift
  + View Models
    - ComicUserBackgroundTask
    - ComicCycleType
  
+ Resources
  - Assets
  + Fonts
    - Roboto-Regular
    - Roboto-Black
  + Storyboards
    - LaunchScreen
  
+ Utilities
  - Constants
  
+ Views
  - RootView
  + Comic List
    - ComicListView
    - ComicListRowView
  + Comic Detail
    - ComicDetailView
    - ComicUserBackgroundTaskListView
    - ComicDetailHeaderView
    - ComicDetailCycleBarView
  + Elements
    + Comic Detail
      - ComicUserBackgroundButton
      - ComicCycleButton
      
### marvelTests target
- ComicTests
- ModelTests
- Info.plist

### marvelUITests target
- marvelUITests
- Info.plist

## Setup
To run this project update the Model file apiKey and privateKey properties with your Marvel developer api public key and private key. Otherwise, where will the data come from? 🤯

## Features
This project has 
- live data pulling
- dark/light mode support (try it out 🌚🌝)
- dynamic text sizing #accessibility 💋
- tests [ui/unit]

## Third Party Libraries and Frameworks
None 😜 

## Data
Data is retrieved from the <a href="https://developer.marvel.com">Marvel API</a> 

## Networking 
Handled with URLSession.

THIS IS A THETEALPICKLE CREATION. © 2020 JESSICA JEAN JOSEPH 
