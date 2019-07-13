function [ x_max_array ] = Optimization_Array( src_arr, start_x1, e_diff, wave_step, jump_coef, min_max_direction, max_iter )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
  global max_point_in_line;
  
  x_dim = size(src_arr,2);
  y_dim = size(src_arr,1);
  
  x_max_array = zeros(y_dim , max_point_in_line);
  
  for y = 1 : 1 :  y_dim                 
     x_max_row = Optimization_Row( src_arr(y,:), start_x1, e_diff, wave_step , min_max_direction, max_iter);
     hh = src_arr(y,:);
     gg = x_max_array(y,:);
     x_max_array(y,:) = x_max_row;
  end
  
end

