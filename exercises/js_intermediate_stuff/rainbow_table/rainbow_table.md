# Rainbow Table

You and your group of hackers, get the secret database of the Linkedin company. One of the records from the DB caught your
attention especially:

Dariusz Wylon | d.wylon@selleo.com | c8e095e2a26f8540afabb36dcdaee3b1

It looks like you have credentials but, ehmm.. the password is hashed. The good news is that one of the team members get
information about which hashing algorithm was used - it was MD5. This is great but brute forcing this will take years.
After observations and using some social technics you know that Dariusz is big fan of Polish book called "Pan
Tadeusz". It is a good point to start, maybe his password is the same as name one of heroes from the book.

## Task
1) Create word list from provided "pan_tadeusz.txt" file - it should contain unique words from the book(one for line)
   ex. "some fancy line of fancy book" - should be parsed to:

   some
   fancy
   line
   of
   book

   - size of letter matter
   - only unique words(remove repetitions)
   - one word per line
   - save output to "word_list.txt" file

2) Create rainbow table from word list created in previous task(look at 1. point of this task), if you are not familiar
   with rainbow tables don't worry - look at the botom for wikipedia link and try to understand the example. Basicly it is used
   for speed up computations. Rainbow table can be a text file that contains a string and its representation as a hash
   (hashed by suitable algorithm - in our case MD5(you can use this package https://www.npmjs.com/package/js-md5))

   ex.
   If we provide to our script word list containing:

   Input:

   hello
   from
   rainbow
   table

   We should receive

   Output:

   hello   5d41402abc4b2a76b9719d911017c592
   from    d98a07f84921b24ee30f86fd8cd85c3c
   rainbow cd13b6a6af66fb774faa589a9d18f906
   table   aab9e1de16f38176f86d7a92ba337a8d

   So basicly it is <string string_as_hash>

   - interface to your script should looks like 'node word_list.txt' and it should produce 'rainbow_word_list.txt'
   - every line should contain string and it's representation as a md5

3) The final step to get Mr. Wylon password is create script that will break it. Implement script that will get the
victim password and rainbow table and outputs string respresentation of password. You can reach this by comparing each
hash from the rainbow table with hash of Mr. Wylon password. The matching one is the result.

  - interface to your script should looks like 'node rainbow_word_list.txt aab9e1de16f38176f86d7a92ba337a8d ' and it
    should outputs 'table' - in your case hash and output will be different

To sumarize - you need to implement 3 scripts:
- first for create word list from book
- second for transform word list into rainbow table
- third one that will match password with hash
- after that create file result.txt and paste there Mr. Wylon password


## Assumptions
- use node.js for all tasks(if you are not familiar with - it is the js environment like in browser but in system level)
- name for scripts are up to you
- pan_tadeusz.txt can be found there: <add link there>

## Helpful links
- https://en.wikipedia.org/wiki/Rainbow_table
- https://www.npmjs.com/package/js-md5
- https://nodejs.org/docs/latest/api/process.html#process_process_argv
- https://nodejs.org/docs/latest/api/fs.html
- https://en.wikipedia.org/wiki/MD5

