
(defvar *scoreboard* '((1 nil t 0)))

(defun register-invitation (user-id invited-id)
  (let ((user (assoc invited-id *scoreboard*))
	(parent (assoc user-id *scoreboard*)))
    (or (third parent) (validate-user parent))
    (cond ((null user)
	   (setf *scoreboard* (cons (list invited-id (list user-id) nil 0) *scoreboard*)))
	  (t (setf (second user) (cons user-id (second user)))))))

(defun validate-user (node)
  (setf (third node) t)
  (distribute-points node))

(defun distribute-points (node &optional (distance 0))
  (let ((n (assoc (first (last (second node))) *scoreboard*)))
    (when n
      (setf (fourth n) (+ (fourth n) (expt 1/2 distance)))
      (distribute-points n (1+ distance)))))
