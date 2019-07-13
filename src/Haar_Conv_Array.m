function  [cnv_array]  = Haar_Conv_Array( src_arr)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
  x_dim = size(src_arr,2);
  y_dim = size(src_arr,1);
  
  cnv_array = zeros(y_dim , x_dim);
  square_flag = 1;
  
  for y = 1 : 1 :  y_dim
     cnv_row = Haar_Conv_Row( src_arr(y,:), square_flag);
     cnv_array(y,:) = cnv_row;
  end


end

