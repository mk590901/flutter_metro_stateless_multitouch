# flutter_metro_mb

Collage via BLoC

## Introduction

This project is based on using the https://github.com/letsar/flutter_staggered_grid_view repository. This library allows you to compose various views into one single widget in style, close to the style of MS windows metro. Also additional styles of composing of widgets are also implemented in the library. I decided to take advantage of this project to write an application that not only displays a set of photos from the site https://picsum.photos, but also allows you to update this set either completely or each photo individually.

## Brief description of application

I'm not using the whole flutter_staggered_grid_view library. One metro style is enough for me. The rest are of no interest to me. Therefore, I extracted several classes from the project that suit me and added them to my project. I hope that the authors will forgive me such liberties.

The main emphasis was placed on the method of updating the collage. I once again used the BLoB pattern, which is a wrapper for the flat state machine shown below:

![metro_style](https://user-images.githubusercontent.com/125393245/226953592-2e1b8076-96f8-480c-a9f5-27e15053d0af.svg)

Unlike the previous project, the "Refreshing" state doesn’t need a special data structure for rendering. This data structure is predefined and contained in the tiles container of the widget described in the MetroPage class (file: metro.dart). Accordingly, event used also doesn't contain a link to the data. Rather, this link is empty.
The link to data container is permanent. Each iteration only changes the filename of the image to be rendered in the CustomGridTile element.

## App in action

https://user-images.githubusercontent.com/125393245/226953996-599ee82c-97d4-45c2-9a31-41b7e5116527.mp4

