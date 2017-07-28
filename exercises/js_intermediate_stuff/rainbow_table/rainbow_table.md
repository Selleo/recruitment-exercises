# Rainbow Table

You and your group of hackers, get the secret database of the Linkedin company. One of the records from the DB caught your
attention especially:

Name | Email | Password
--- | --- | ---
Dariusz Wylon | d.wylon@selleo.com | c8e095e2a26f8540afabb36dcdaee3b1

It looks like you have credentials but, ehmm.. the password is encrypted. 
The good news is that one of the team members get information about which encryption algorithm was used - it was MD5.  After doing some observations and using some social technics you've figured out that Dariusz is a big fan of a Polish book called "Pan Tadeusz". It is a good point to start. Maybe his password is the same as the name of one of the heroes of this book.

## Your mission
1) Create a word list from provided "pan_tadeusz.txt" file - it should contain unique words from the book(one for line)
   ex. "some fancy line of fancy book" - should be parsed to:

   ```
   some
   fancy
   line
   of
   book
   ```

   - the size of letter matter(upper/lower case)
   - it should contain only unique words(remove repetitions)
   - one word per line
   - save output to "word_list.txt" file

2) Create "rainbow table"(https://en.wikipedia.org/wiki/Rainbow_table) from word list created in the   previous task(look at 1. point of your mission), if you are not familiar with rainbow tables don't  worry - look at the bottom for Wikipedia link and try to understand the example. Basically, it is used for speed up computations. Rainbow table can be a text file that contains a string and its representation as a hash (hashed by suitable algorithm - in our case MD5(you can use js-md5 package

   ex.
   If we provide to our script word list containing:

   Input:

   ```
   hello
   from
   rainbow
   table
   ```

   We should receive

   Output:

   ```
   hello   5d41402abc4b2a76b9719d911017c592
   from    d98a07f84921b24ee30f86fd8cd85c3c
   rainbow cd13b6a6af66fb774faa589a9d18f906
   table   aab9e1de16f38176f86d7a92ba337a8d
   ```

   So basicly it is <string string_as_hash>

   - interface to your script should look like ```node word_list.txt``` and it should produce ```rainbow_word_list.txt```
   - every line should contain string and its representation as a md5

3) The final step to get Mr. Wylon's password is to create a script that will break it. Implement script that will get the victim's password and uses rainbow table and outputs it as a string representation of password. You can reach this by comparing each hash from the rainbow table with the hash of Mr. Wylon's password. The matching one is the result.

  - interface to your script should look like ```node rainbow_word_list.txt aab9e1de16f38176f86d7a92ba337a8d``` and it
    should outputs ```table``` - in your case hash, and output will be different

To summarize - you need to implement 3 scripts and a result file:
- first for create word list from the book
- second for transform word list into a rainbow table
- third one that will match password with hash
- after that create file result.txt and paste there Mr. Wylon password


## Prerequisites
- use node.js for all tasks(if you are not familiar with - it is JavaScript environment like in browser but runs on the system level)
- name of the scripts are up to you
- pan_tadeusz.txt can be found in exercise directory

## Helpful links
- https://en.wikipedia.org/wiki/Rainbow_table
- https://www.npmjs.com/package/js-md5
- https://nodejs.org/docs/latest/api/process.html#process_process_argv
- https://nodejs.org/docs/latest/api/fs.html
- https://en.wikipedia.org/wiki/MD5

