#lang racket/gui


; Create a dialog
(define frame (instantiate frame% ("ChatRoom")
                [height 500]
                [width 600]
                ))

; Add a text field to the dialog
(define textfield-1 
  (new text-field% [parent frame] [label "Please Enter Your Name"]))


(define-values [in out] (tcp-connect "localhost" 22231)); makes the tcp connection
;and stores the input port and output ports in globally available values

(define user1 "") ;name of the user
(define user1message "") ;contents of the user's message

(define msg-item "") ;outgoing message items are stored in this one
(define in-msg "") ;incoming message items are stored in this one

(define gbl-text "") ;Global text field variable, it's where all the chat messages go

(define (displUser1 user1)
  (string-append user1 ", type here: "))


(define (send-message msg);sends the message to the outport
  (write msg out)
  (flush-output out)
  )

(define myButton ;this button registers the users, and spawns the other buttons
  (new button%
       [parent frame]
       [label "Register New Users"]
       [style (list 'border)]
       [callback (lambda (button event)
                   (
                    (set! user1 (send textfield-1 get-value))
                    (send textfield-1 set-label (displUser1 user1))
                    (send textfield-1 set-value " ")
                    (send frame delete-child myButton)
                    (make-buttons)
                    )
                   );Weird error here: racket complains that the above is an application
                 ];not a procedure, and that it expected a procedure
       )
  )

(define (print-message msg) ;Appends the message item onto the global text string
  (set! gbl-text (string-append gbl-text "\n" (car msg) ": " (cadr msg)))
  gbl-text)


;======== Old attempt to make a recursive message retrieval system
;(define (process-message)
;  (set! in-msg (read in))
;  (send received-text set-value (print-message in-msg))
;  )

;(define (receive-message)
;  (define (receive-helper)
;  (when (char-ready? in) process-message)
;  (when (char-ready? in) receive-helper)
;    )
;    (receive-helper)
;  )
;==========================

; Add a horizontal panel to the dialog, with centering for buttons
(define panel1 (new horizontal-panel% [parent frame] ;hosts all the buttons
                    [alignment '(center center)]))

(define panel2 (new vertical-panel% [parent frame] ;hosts the chat text field
                    [alignment '(center bottom)]))

  (define received-text
    (new text-field% [parent panel2] [label ""] [min-height 400] [min-width 300])
    )
  
; Add Cancel and Ok buttons to the horizontal panel

(define (make-buttons) ;makes the buttons for send, fetch, and clear.
  
  (new button% [parent panel1] [label "Send!"]
       [callback (lambda (button event)
                   (set! user1message (send textfield-1 get-value))
                   (send textfield-1 set-value "")
                   (set! msg-item (list user1 user1message))
                   (send-message msg-item);added
                   ;(send received-text set-value (print-message msg-item));added
                   )
                 ]
       )
  
  (new button% [parent panel1] [label "Fetch Message"] [style (list 'border)]
       [callback (lambda (button event)
                   ;(for (#:when (char-ready? in))
                   (when (char-ready? in) (set! in-msg (read in)))
                   (when (not (eqv? in-msg "")) (send received-text set-value (print-message in-msg)))
                   (set! in-msg "")
                   ;  )
                   )
                 ]
       )
  
  (new button% [parent panel1] [label "Clear"]
       [callback (lambda (button event)
                   (set! gbl-text "")
                   (send received-text set-value gbl-text)
                   )
                 ]
       )
  
  )
;;add rollback functionality ----> clear all chat messages and reset frame


; Show the dialog
(send frame show #t)
