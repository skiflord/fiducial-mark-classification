function [ x_max_row ] = Optimization_Row( src_row, start_x1, e_diff, wave_step, min_max_direction, max_iter )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  
  global max_point_in_line;
  global signal_max_value;
  
  x_max_row  = zeros(1, max_point_in_line);
  x_dim = length(src_row);
  
  max_value = max(src_row);
  max_value = signal_max_value;
  
  jump_coef = ((wave_step)^ 2/ max_value) * 0.8;          
  
  cnt       = 1;

  while start_x1 ~= -1  &&  cnt < max_point_in_line + 1            
      
    [x_max,  next_x , iter_count, process] = Optimization_SingleValue( src_row, start_x1, e_diff, wave_step , jump_coef, min_max_direction, max_iter), ;
    
    start_x1 = next_x;
    min_max_direction = -1 * min_max_direction;
    x_max_row(cnt) = x_max;
    cnt = cnt + 1;
    
  end 

end

