function [ ret ] = haar_f( f, s, b )
%HAAR_F Summary of this function goes here
%   Detailed explanation goes here
    f_len = length(f);
    ret = double(0);
    
    for t = b - s + 1   : b
          if t < 1
             ret = ret - (f(1)+f(2)+f(3)+f(4))/4;
          else   
             ret = ret - f(t);
          end   
          
    end
      
    for t = b + 1 : b + s
          if t < f_len
             ret = ret + f(t);
          else   
             ret = ret + (f(f_len)+f(f_len-1)+f(f_len-2)+f(f_len-3))/4;
          end  
    end
     
      %ret = ret * ret;
         
end
