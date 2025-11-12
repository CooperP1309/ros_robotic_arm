;; Auto-generated. Do not edit!


(when (boundp 'sudoku_fact_generator::grid_fact)
  (if (not (find-package "SUDOKU_FACT_GENERATOR"))
    (make-package "SUDOKU_FACT_GENERATOR"))
  (shadow 'grid_fact (find-package "SUDOKU_FACT_GENERATOR")))
(unless (find-package "SUDOKU_FACT_GENERATOR::GRID_FACT")
  (make-package "SUDOKU_FACT_GENERATOR::GRID_FACT"))

(in-package "ROS")
;;//! \htmlinclude grid_fact.msg.html


(defclass sudoku_fact_generator::grid_fact
  :super ros::object
  :slots (_X _Y _Z ))

(defmethod sudoku_fact_generator::grid_fact
  (:init
   (&key
    ((:X __X) 0)
    ((:Y __Y) 0)
    ((:Z __Z) 0)
    )
   (send-super :init)
   (setq _X (round __X))
   (setq _Y (round __Y))
   (setq _Z (round __Z))
   self)
  (:X
   (&optional __X)
   (if __X (setq _X __X)) _X)
  (:Y
   (&optional __Y)
   (if __Y (setq _Y __Y)) _Y)
  (:Z
   (&optional __Z)
   (if __Z (setq _Z __Z)) _Z)
  (:serialization-length
   ()
   (+
    ;; int32 _X
    4
    ;; int32 _Y
    4
    ;; int32 _Z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _X
       (write-long _X s)
     ;; int32 _Y
       (write-long _Y s)
     ;; int32 _Z
       (write-long _Z s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _X
     (setq _X (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Y
     (setq _Y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Z
     (setq _Z (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sudoku_fact_generator::grid_fact :md5sum-) "f5d94d1f3fbdaeb95ae7a7c8fead8a5b")
(setf (get sudoku_fact_generator::grid_fact :datatype-) "sudoku_fact_generator/grid_fact")
(setf (get sudoku_fact_generator::grid_fact :definition-)
      "int32 X
int32 Y
int32 Z

")



(provide :sudoku_fact_generator/grid_fact "f5d94d1f3fbdaeb95ae7a7c8fead8a5b")


