function [ x_max, next_x, iter_count, process] = Optimization_SingleValue( src, start_x1, e_diff, wave_step, jump_coef, min_max_direction, max_iter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  show_haar_stair = 0;
  global show_jump;
    
  x_dim = length(src);
 
  step_coef = jump_coef;
  norm_a = wave_step^(-2);
  process = zeros(4 , max_iter);
  iter_count = 1;
  diff = 1;
  next_x = -1;
  
  x1 = start_x1;
    
  direction  = 1;  
  prev_wave_sign = 0;
  reverse_flag = 0;
  skip_flag = 1;
  
  x_max = 0;
  
  x =  zeros(1,2);
  y =  zeros(1,2);
  
  x(iter_count) = x1;
  y(iter_count) = src(x1);

 
  short_jamp_flag = 1;
  while iter_count < max_iter 
    if show_jump
      if(x1 >= 1)  
          x2 = floor(x1)+1;
          f2 = floor(src(x1))-20;
          text(double(x2), double(f2), num2str(double(iter_count)), 'Color','red');
      end
    end
    
    wave_value     = norm_a * haar_f( src, wave_step, x1 );
    wave_sign      = sign(wave_value);
    abs_wave_value = abs( wave_value);    
     
    if abs_wave_value < 5 
       abs_wave_value = 0;
       wave_sign = prev_wave_sign;
    end 
    
    step1 = step_coef * abs_wave_value;
    
        
    if prev_wave_sign ~= wave_sign 
        
       if prev_wave_sign == min_max_direction  && wave_sign == -prev_wave_sign
           
          reverse_flag = 1;
          
          skip_flag = 0;
          if next_x == -1
             next_x = x1;
          end
       end   
       prev_wave_sign = wave_sign;     
    end
    
    if skip_flag
      step1 = 1; %floor(wave_step/2);
    else       
    
      if wave_sign ~= 0 
         direction = wave_sign * min_max_direction;
      end
      
    end  
    step = max(1, floor(step1));  
    
    x1 = uint32( x1 + direction * step);
 
    if x1 >= x_dim || x1 < 1
       x1 = 0; %error
       next_x = -1;
       break;
    end
    
       
   process(1,iter_count) = wave_value;
   process(2,iter_count) = step1;
   process(3,iter_count) = step;      
   process(4,iter_count) =  x1; 
   
    if reverse_flag && step1 < e_diff
        x_max = x1;
        break;
    end

    
    iter_count = iter_count + 1;
    x(iter_count) = x1;
    y(iter_count) = src(x1);
   
    if show_haar_stair 
       harr_stair( src(x1), wave_step, x1  );
    end
   
  end
    
  if iter_count == max_iter
      disp('MAX ITER');
  end
  
  if show_jump
    plot (x,y,'ro-');    
  end  
 end

