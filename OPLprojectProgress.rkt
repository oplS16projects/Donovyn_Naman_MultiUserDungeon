#lang racket/gui

; Create a dialog
(define frame (instantiate frame% ("ChatRoom")
                [height 150]
                [width 450]
                ))
 
; Add a text field to the dialog
(define textfield-1 
(new text-field% [parent frame] [label "Please Enter Your Name"]))

;;(define textfield-2
;;(new text-field% [parent frame] [label "Please Enter Your Name"] ))

(define user1 "")
(define user2 "")
(define user1message "")
(define user2message "")
(define msg-item "")

(define (displUser1 user1)
  (string-append user1 ", type here: "))

;;(define (displUser2 user2)
;;  (string-append user2 ", type here: "))

(define myButton
(new button% [parent frame] [label "Register New Users"]
     [callback (lambda (button event)
                 (
                 (set! user1 (send textfield-1 get-value))
                 ;(set! user2 (send textfield-2 get-value))
                 ;(display user1)
                 ;(display user2)
                 (send textfield-1 set-label (displUser1 user1))
                 ;(send textfield-2 set-label (displUser2 user2))
                 (send textfield-1 set-value " ")
                 
                 ;(send textfield-2 set-value " ")
                 ))]))

                 



  



; Make a static text message in the frame
(define msg (new message% [parent frame]
                          [label ""]))




; Add a horizontal panel to the dialog, with centering for buttons
(define panel1 (new horizontal-panel% [parent frame]
                                     [alignment '(center center)]))


(define panel2 (new vertical-panel% [parent frame]
                                     [alignment '(center center)]))


; Add Cancel and Ok buttons to the horizontal panel
(new button% [parent panel1] [label "Send!"]
     [callback (lambda (button event)
                 
                 ;(send textfield-2 set-value "")
                 (set! user1message (send textfield-1 get-value))
                 (send textfield-1 set-value "")
                 (set! msg-item '('user1 'user1message))
                 ;(set! user2message (send textfield-2 get-value))
                 ;;create textfield based on user 1 or user 2
                 (new text-field% [parent panel2](label user1)
                      ;(set-value user1)
                      ))])

;(define (getVar user1message user2message user1 user2)
  ;(cond
   ; ((eq? user1message "")(user2))
   ; ((eq? user2message "") (user1))
   ; ))

(new button% [parent panel1] [label "Clear"])
;;add rollback functionality ----> clear all chat messages and reset frame


; Show the dialog
(send frame show #t)