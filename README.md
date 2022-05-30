# people_tmdb

Displaying a list of popular people (actors, directors ..etc) using themoviedb.org API.

## App Images

![Flutter_project](https://user-images.githubusercontent.com/26501595/170995601-d1ada727-9a7c-4b52-b9b6-f5d4952c2a63.png)

## Configure

you need to take a api-token from https://www.themoviedb.org/

    ``String apiToken= "";'You need to write yor api token in here';``
    
this code is in lib/services/app_api.dart

## Features

☑︎ Displaying a list of popular people with infinite scrolling.  

☑︎ When a person entry is selected, a Details view is opened with the basic person info and grid view of his/her movies posters.

☑︎ When movie is selected, a Poster view in another Screen and from top-right you can download orignal image.   

☑︎ Getx is a state management package in this app. 

☑︎ Unit testing. 

