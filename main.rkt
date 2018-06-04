#lang racket/base

(require (prefix-in unchecked:
                    "unchecked.rkt")
         (prefix-in contracts:
                    "contracts.rkt")
         racket/file)

(define (run-file! ps)
  (displayln ps)
  (define str* (file->lines ps))
  (displayln "Unchecked")
  (time
   (for ([str (in-list str*)])
     (unchecked:string->jsexpr str)))
  (displayln "Contracts")
  (time
   (for ([str (in-list str*)])
     (contracts:string->jsexpr str)))
  (printf "\n\n\n"))

(module+ main
  (run-file! "python.json")
  (run-file! "house.json"))
