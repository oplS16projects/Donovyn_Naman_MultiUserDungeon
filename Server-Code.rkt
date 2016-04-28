#lang racket

(require racket/tcp)


;; User Name, address, inport, outport
(define (user inport outport)
  (let ([username (read-line)]
    [address "localhost"])
    (list username address)
  )
  )


(define (connection_message in out)
  (display "you connected" out))

;;borrowed code from Rosetta code
;;  https://rosettacode.org/wiki/Chat_server#Racket

(define outs (list (current-output-port)))
(define ((tell-all who o) line)
  (for ([c outs] #:unless (eq? o c)) (displayln (~a who ": " line) c)))

(define (chat-server listener)
  (define-values [i o] (tcp-accept listener))
  (for ([p (list i o)]) (file-stream-buffer-mode p 'none))
  (thread (user i o)) (set! outs (cons o outs)) (chat-server listener)
  ;(thread (connection_message i o)) (set! outs (cons o outs)) (chat-server listener)
  )
 
(void (thread (λ() (chat-server (tcp-listen 22231)))))




;;create port
;;create connection item
;;define a user item
;;create hash map to store users by name
;;define a message item
;;define acceptable commands
;;store acceptable commands into hashmap by name


;;open thread for connections
;;open thread for message recieving
;;open thread for message handling
;;open thread for message sending

