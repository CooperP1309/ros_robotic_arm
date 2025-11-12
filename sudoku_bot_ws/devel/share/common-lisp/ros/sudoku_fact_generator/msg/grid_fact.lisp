; Auto-generated. Do not edit!


(cl:in-package sudoku_fact_generator-msg)


;//! \htmlinclude grid_fact.msg.html

(cl:defclass <grid_fact> (roslisp-msg-protocol:ros-message)
  ((X
    :reader X
    :initarg :X
    :type cl:integer
    :initform 0)
   (Y
    :reader Y
    :initarg :Y
    :type cl:integer
    :initform 0)
   (Z
    :reader Z
    :initarg :Z
    :type cl:integer
    :initform 0))
)

(cl:defclass grid_fact (<grid_fact>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <grid_fact>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'grid_fact)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sudoku_fact_generator-msg:<grid_fact> is deprecated: use sudoku_fact_generator-msg:grid_fact instead.")))

(cl:ensure-generic-function 'X-val :lambda-list '(m))
(cl:defmethod X-val ((m <grid_fact>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sudoku_fact_generator-msg:X-val is deprecated.  Use sudoku_fact_generator-msg:X instead.")
  (X m))

(cl:ensure-generic-function 'Y-val :lambda-list '(m))
(cl:defmethod Y-val ((m <grid_fact>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sudoku_fact_generator-msg:Y-val is deprecated.  Use sudoku_fact_generator-msg:Y instead.")
  (Y m))

(cl:ensure-generic-function 'Z-val :lambda-list '(m))
(cl:defmethod Z-val ((m <grid_fact>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sudoku_fact_generator-msg:Z-val is deprecated.  Use sudoku_fact_generator-msg:Z instead.")
  (Z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <grid_fact>) ostream)
  "Serializes a message object of type '<grid_fact>"
  (cl:let* ((signed (cl:slot-value msg 'X)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <grid_fact>) istream)
  "Deserializes a message object of type '<grid_fact>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'X) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Z) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<grid_fact>)))
  "Returns string type for a message object of type '<grid_fact>"
  "sudoku_fact_generator/grid_fact")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'grid_fact)))
  "Returns string type for a message object of type 'grid_fact"
  "sudoku_fact_generator/grid_fact")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<grid_fact>)))
  "Returns md5sum for a message object of type '<grid_fact>"
  "f5d94d1f3fbdaeb95ae7a7c8fead8a5b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'grid_fact)))
  "Returns md5sum for a message object of type 'grid_fact"
  "f5d94d1f3fbdaeb95ae7a7c8fead8a5b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<grid_fact>)))
  "Returns full string definition for message of type '<grid_fact>"
  (cl:format cl:nil "int32 X~%int32 Y~%int32 Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'grid_fact)))
  "Returns full string definition for message of type 'grid_fact"
  (cl:format cl:nil "int32 X~%int32 Y~%int32 Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <grid_fact>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <grid_fact>))
  "Converts a ROS message object to a list"
  (cl:list 'grid_fact
    (cl:cons ':X (X msg))
    (cl:cons ':Y (Y msg))
    (cl:cons ':Z (Z msg))
))
