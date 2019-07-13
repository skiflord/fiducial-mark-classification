function  [cnv_row, max_value]  = Haar_Conv_Row( f_row, square_flag)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
  global conv_wave_step;
  global signal_max_value;
  
  max_value = 0;
  f_len = length(f_row);
  cnv_row = double(zeros(1,f_len));

  norm_a = (conv_wave_step)^(-2);
  
  ft = 0;   
  
  for b = 1 : f_len
      cnv_row(b) = haar_f(f_row,conv_wave_step,b);
      cnv_row(b) = norm_a *cnv_row(b);
      
      if 0 && abs(cnv_row(b)) < 5
         cnv_row(b) = 0;
      end
         
      if  square_flag
          cnv_row(b) = sign(cnv_row(b))* cnv_row(b) * cnv_row(b);
      end
      max_value = max(max_value, abs(cnv_row(b)));
  end    
  signal_max_value = max(max_value,signal_max_value);
end

