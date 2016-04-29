#lang racket

(require racket/tcp)
(require racket/gui)

;Connection stuff
(define conn_list '()) ;should hold a list of connected parties
(define (add-connection in out) ;;Adds a pair of in and out ports to a list of pairs of in and out ports
  (set! conn_list (cons (list in out) conn_list))
  )

(define message ""); globally stores the a message

;get the in and out ports and put them in a cons cell
;(define-values (in out) (tcp-accept (tcp-listen 22231)))
;globally bind a reference to the inport
;globally bind a reference to the outport


(define (push-message msg); Pushes the message to all connected users
  (define (push-helper in out list)
    (write msg out)
    (flush-output out)
    (when (not (null? list))
      (push-helper (caar list) (cadar list) (cdr list))
      )
    )
  (push-helper (caar conn_list) (cadar conn_list) (cdr conn_list))
  )

(define (process-message in out); displays all recieved messages in the server console, then pushes them
  (set! message (read in))
       (displayln message)
       ;(write "message recieved" out) ;confirmation message
       ;(flush-output out)
       (push-message message)
  )


(define (check-messages);checks to see if there are any messages, and if so, call to process them
  (define (check-helper in out list)
    (when (char-ready? in)
       (process-message in out)
      )
    (when (not (null? list)); (and (not (null? list)) (not (null? (cdr list))))
      (check-helper (caar list) (cadar list) (cdr list) )      
      )    
    )
  (check-helper (caar conn_list) (cadar conn_list) (cdr conn_list))
  )




;Old message handler code
;(define (wait-for-messages in out); respond to recieved messages
;  (thread (lambda ()
;            (let loop()
;              (when (char-ready? in)
;                (
;                 (displayln (read in))
;                 (write "message recieved" out)
;                 (flush-output out)
;                 )     
;                )
;              )
;            )
;          )
;  (sleep 2.5)
;  )


(define (get-connection port) ;;Gets the ports from a connection and shoves them into a list
  (let-values ([(i o) (tcp-accept (tcp-listen port))])
    (when (not (eqv? i null))
      (add-connection i o)
      ;(write "You have connected, waiting for another user" o) ;confirmation message
      ;(flush-output o)
      )
    )
  )


;============== Old Connection handler, gave issues when trying it this way
;(define (wait-for-connection conn_port)
;  (define (connection-helper cport)
;    (when (< cport 22233) (
;                         (let-values ([(i o) (tcp-accept (tcp-listen cport))])
;                           (when (not (eqv? i null))
;                             (add-connection i o)
;                             (write "You have connected, waiting for another user" o)
;                             (flush-output o)
;                           )
;                           (connection-helper (+ cport 1))
;                           )
;                         )
;       )   
;    )
;  (connection-helper conn_port)
;  )
;The reason the above didn't work is because I tried to put a block of code in the when block.
;==========================

(define (run-server); base command that runs the server
  (get-connection 22231); get user1
  (get-connection 22232); get user2
  (let loop ()
    (check-messages);(thread (wait-for-messages (car ))
    (loop))
  )



;GUI stuff for the server, all one button of it!
(define frame (instantiate frame% ("server box")
                [height 150]
                [width 450]
                ))
(define panel2 (new vertical-panel% [parent frame]
                                     [alignment '(center center)]))
(define startButton ;simple button that calls the "run-server" command
(new button% [parent panel2] [label "Run the server!"]
      [min-width 250]	 
   	 	[min-height 75]
                [style '(border)]
     [callback (lambda (button event)
                 (
                 
                  (send startButton set-label "The server is currently running")
                  ;(send panel2 delete-child
                 (run-server)
                 
                 ;make sure the server is running
                 
                 ))]))

(send frame show #t)
