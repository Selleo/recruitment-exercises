# Look at NodeJS

In this exercise we’d like to create a storage app that will ressemble popular apps like dropbox. Proceed with the features as much as you can.

## Tier 1

We’d like to create a Node/Bun API server in Typescript (you can use any package you’d like to) that will have the following functionalities and endpoints.

- folder on the disk containing any files
- Ability to list the files and directories
- Ability to display the content of given files
- Ability to create a new directory
- Ability to upload new file in given directory

## Tier 2

More advanced use case

Fake role based access system.

Using a custom header `role`  - adjust the app to check user access with the following policies

- only role=”admin” should be able to create directories
- only role=”admin should be able to display files in /admin directory

## Tier 3

Advanced use case

- add ability to store videos
- add ability to stream videos in the api
