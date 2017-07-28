# The Konami Code

You are the leader of Anonymous - the group of hackers. For the last couple of months your main way of communication with your teammates was Twitter. Now FBI knows about it, and they are following all your Twitter accounts. Before your group started using tweets, the Anonymous hackers were using a secret website to share information. It looked like a standard website with sweet kittens, but after typing the Konami Code, all of the secret messages were shown. Unfortunately, the website is down, and the source code is lost. Your challenge is to develop this kind of site from scratch to provide a way of communication for your teammates.

## Tasks
1) Create basic page with "Sweet kittens" header
2) Add JavaScript code that will do the following things:
    - After typing Konami Code 'inject<enter>s3crets' make a request for secret data(described under the task)
    - Display 5 newest issues names and nickname of the author
    - After 15 seconds hide all issues

## Source of data

As a smart hacker, you've found a safe way to communicate - Using the names of the Github issues to receive messages. Every day your teammates are posting
issues on a different repository and the name of every one is another secret message. Today you and your team have choosed
elixir language repository. To get the data just fetch JSON form this URL: https://api.github.com/repos/elixir-lang/elixir/issues

## Prerequisites
1) 'ESC' key cancels currently written part of the Konami Code
2) Max timestamp between each next pressed key is 5 seconds(after that time Konami Code should be reset)
3) Size of the letter matters(upper/lower case)
4) Do not use jQuery

## Helpful Links
If you don't know how the Konami Code looks like check this:
- https://en.wikipedia.org/wiki/Konami_Code
