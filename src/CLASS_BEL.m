function class = CLASS_BEL( FIGURE, FIGURE_WIDTH, FIGURE_HEIGHT, FIG_LIB_LEN, FIG_LIB )
  classf = zeros(FIG_LIB_LEN,1);
%   for i = 1 : FIG_LIB_LEN
%       ResFigure = ScaleFigureWidth( FIG_LIB(i).width, FIGURE_WIDTH, FIGURE );
%       ResFigure1 = ScaleFigureHeight( FIG_LIB(i).height, FIGURE_HEIGHT, ResFigure );
%       res =  CompareFigures( ResFigure, FIG_LIB(i).points );
%       class = CompareFCL( FIGURE, FIG_LIB(i).square );
%       title = FIG_LIB(i).title;
%       classf(i,1)= class;
%   end 
%   mc = min(classf);
%   class = FIG_LIB(find(classf==mc)).title;
%   disp(class);
    class = CompareFCL( FIGURE );
end

