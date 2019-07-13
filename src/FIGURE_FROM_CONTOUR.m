function [ FIGURE, X_OFFSET,Y_OFFSET,FIGURE_WIDTH, FIGURE_HEIGHT ] = FIGURE_FROM_CONTOUR( CONTOUR )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
  ColCount = size(CONTOUR, 2); 
  RowCount = size(CONTOUR, 1);
  
  FIGURE = zeros(RowCount , ColCount);
  
  
  MIN_Y = 0;  
  MAX_Y = 0; 
  
  MAX_X = 0; 
  MIN_X = 0; 
  
  %определяем габариты объекта MIN MAX
  for y = 1:1:RowCount
      for x = 1:1:ColCount
          if CONTOUR(y,x) > 0
             if MIN_X == 0
                MIN_X = CONTOUR(y,x); 
             else    
                MIN_X = min(MIN_X,CONTOUR(y,x)); 
             end 
             MAX_X = max(MAX_X,CONTOUR(y,x));
          end              
      end  
      if CONTOUR(y,1) > 0
         if(MIN_Y == 0)
            MIN_Y = y;
         end            
         MAX_Y = y;
      end
  end   
 
  %MIN X = X_OFFSET, MIN Y = Y_OFFSET
  %переводим координаты объекта в начало координат
  FIGURE_HEIGHT = 0; 
  for y = MIN_Y:1:MAX_Y      
     FIGURE_HEIGHT = FIGURE_HEIGHT +1;
     for x = 1:1:ColCount
         if CONTOUR(y,x) > 0
            FIGURE(FIGURE_HEIGHT,x) = CONTOUR(y,x) - MIN_X + 1;
         else
            break;                           
         end
     end     
  end    
  
 
   X_OFFSET = MIN_X;
   Y_OFFSET = MIN_Y;
   FIGURE_WIDTH = MAX_X - MIN_X;
   FIGURE_HEIGH = MAX_Y - MIN_Y;
end

