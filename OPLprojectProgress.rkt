#lang racket/gui


; Create a dialog
(define frame (instantiate frame% ("ChatRoom")
                [height 150]
                [width 450]
                ))
 
; Add a text field to the dialog
(define textfield-1 
(new text-field% [parent frame] [label "Please Enter Your Name"]))

(define (make-field)
    (new text-field% [parent frame] [label "look a label"])
  )

;;(define textfield-2
;;(new text-field% [parent frame] [label "Please Enter Your Name"] ))


(define-values [in out] (tcp-connect "localhost" 22231));added

(define user1 "")
(define user1message "")
(define msg-item "")

(define gbl-text "")

(define (displUser1 user1)
  (string-append user1 ", type here: "))

(define (send-message msg);added
  (write msg out)
  (flush-output out)
  )


;;(define (displUser2 user2)
;;  (string-append user2 ", type here: "))
(define myButton
(new button% [parent frame] [label "Register New Users"]
     [style (list 'border)]
     [callback (lambda (button event)
                 (
                 (set! user1 (send textfield-1 get-value))
                 (send textfield-1 set-label (displUser1 user1))
                 (send textfield-1 set-value " ")
                 (send frame delete-child myButton)
                 ))]

     
     ))

                 
(define (print-message msg)
  (set! gbl-text (string-append gbl-text "\n" (car msg) ": " (cadr msg)))
  gbl-text)


 



; Make a static text message in the frame
(define msg (new message% [parent frame]
                          [label ""]))




; Add a horizontal panel to the dialog, with centering for buttons
(define panel1 (new horizontal-panel% [parent frame]
                                     [alignment '(center center)]))


(define panel2 (new vertical-panel% [parent frame]
                                     [alignment '(center center)]))

(define received-text
(new text-field% [parent panel1] [label ""] [min-height 400] [min-width 500])
)
; Add Cancel and Ok buttons to the horizontal panelasdasdas
(new button% [parent panel1] [label "Send!"]
     [callback (lambda (button event)
                 
                 ;(send textfield-2 set-value "")
                 (set! user1message (send textfield-1 get-value))
                 (send textfield-1 set-value "")
                 (set! msg-item (list user1 user1message))
                 (send-message msg-item);added
                 
                 (send received-text set-value (print-message msg-item));added
                      ;(set-value user1)
                      )])


(new button% [parent panel1] [label "Clear"]
     [callback (lambda (button event)
                 (set! gbl-text ""))])
;;add rollback functionality ----> clear all chat messages and reset frame


; Show the dialog
(send frame show #t)
