# *Racket Chat* 
<!-- This is a template for using your repo's README.md as your project web page. I recommend you copy and paste into your README file. Delete this line and the one above it, customize everything else. Make it look good!
-->
##*Authors:*

####Donovyn Pickler

####Naman Jiandani


##*Overview:*

<!-- A brief description of the project is given here. The description is 1 to 3 sentences long. Be concise and clear.-->

This project is a client-server chat application. Once connected, clients are able to communicate with other users on the server.  The server acts as a relay that all messages pass through.

![There should be a diagram here](https://github.com/oplS16projects/Donovyn_Naman_MultiUserDungeon/blob/master/updated%20racket%20diagram.png?raw=true "Architecture Diagram")


##*Screenshot:*
![There should be a screenshot here here](https://github.com/oplS16projects/Donovyn_Naman_MultiUserDungeon/blob/master/Screenshot.png?raw=true "It actually works!")

##*Concepts Demonstrated:*

Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient.

Data abstraction is used to in the storage of connection info.
Recursion is used to ensure that no messages are missed by the server, and that all messages get sent to all users.

<!-- examples
Data abstraction is used to provide access to the elements of the RSS feed.
The objects in the OpenGL world are represented with recursive data structures.
Symbolic language processing techniques are used in the parser.
External Technology and Libraries

Briefly describe the existing technology you utilized, and how you used it. Provide a link to that technology(ies).
-->

##*Favorite Scheme Expressions:*

<!-- Each team member should identify a favorite expression or procedure, written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody? Remember code looks something like this: 

(map (lambda (x) (foldr compose functions)) data)
-->

####*Donovyn:*
```racket 
(define (get-connection port) ;;Gets the ports from a connection and shoves them into a list
  (let-values ([(i o) (tcp-accept (tcp-listen port))])
    (when (not (eqv? i null))
      (add-connection i o)
      ;(write "You have connected, waiting for another user" o) ;confirmation message
      ;(flush-output o)
      )
    )
  )
  ```
  
  paird with
  
  ```racket
  (define (add-connection in out) ;;Adds a pair of in and out ports to a list of pairs of in and out ports
  (set! conn_list (cons (list in out) conn_list))
  )
```
With a little more understanding on how to dynamically recognize when someone is trying to connect, these two could easily allow for connecting to and cataloging an arbitrary number of users

####*Naman:*

This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....
```racket
(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
  ```
  
##*Additional Remarks:*

**D:** This is probably equivilant to a checkponint 1, not a final product.

<!-- Anything else you want to say in your report. Can rename or remove this section.  -->

##*How to Download and Run:*

A downloadable version of the project is available in tar.gz format, just click [*HERE*](https://github.com/oplS16projects/Donovyn_Naman_MultiUserDungeon/blob/master/Racket%20Chat.tar.gz?raw=true "Click me to download the racket files in tar.gz format").

###How to run:
(Due to crappy school internet, all future tests of this must be done on the same machine)

1) extract the contents of the tar.gz archive completely

2) Open each of the racket files with DrRacket or your compiler of choice.

3) First start by running the server software.
    3a) A window should pop up with a large button that says "Run the server!", click that button.
    
4) Now run the software labeled "User 1.rkt".
   4a) Enter your desired username in the slim text field at the top of the window, then click "Register Users"
   
5) Now run the software labeled "user 2.rkt".
   5a) Enter your desired username in the slim text field at the top of the window, then click "Register Users"
   
   *The following may be done on either or both User chat windows.*
6) Additional text may be entered in the text field at the top of the window.
  6a) That text may be sent to all connected users by clicking the "Send!" button.
  
7) To recieve messages from the server, click the "Fetch Message" button.
   7a) each time you press the "Fetch Message" button, you will recieve one message from the server. (Had issues making it recursive)

8) Pressing the "Clear" button will clear the chat field, leaving it open for additional dialogue.
<!-- You may want to link to your latest release for easy downloading by people (such as Mark).
Include what file to run, what to do with that file, how to interact with the app when its running, etc.


-->
