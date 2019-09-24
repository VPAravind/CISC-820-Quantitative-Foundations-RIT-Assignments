%Square Error
function error = Square_Error (y_true , y_pred)
diff = y_true - y_pred;
error = dot (diff , diff);