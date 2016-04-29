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


<!-- Anything else you want to say in your report. Can rename or remove this section.  -->

##*How to Download and Run:*
<!-- You may want to link to your latest release for easy downloading by people (such as Mark).

Include what file to run, what to do with that file, how to interact with the app when its running, etc.


-->
