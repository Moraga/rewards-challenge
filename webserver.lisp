(ql:quickload :clack)
(ql:quickload :ningle)

(load "rewards")

(defvar *app* (make-instance 'ningle:<app>))

(defun scoreboard-jsonview ()
  (format nil "[~{~a~^,~}]"
	  (mapcar #'
	   (lambda (n) (format nil "{\"id\": ~d, \"score\": ~$}" (first n) (first (last n)))) *scoreboard*)))

(setf (ningle:route *app* "/")
      #'(lambda (params)
	  (scoreboard-jsonview)))

(setf (ningle:route *app* "/" :method :POST)
      #'(lambda (params)
	  (apply #'register-invitation (mapcar #'(lambda (name) (parse-integer (cdr (assoc name params :test #'string=)))) '("user" "invited")))
	  ""))

(clack:clackup *app*)
