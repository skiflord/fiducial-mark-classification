function [ RESM ] = CompareFCL( Fig1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  x1_dim = size(Fig1,2);
  y1_dim = size(Fig1,1);
   
  sp = 0;
  ep = 0;
  
  mpo = 0;
  mpt = 0;
  
  RES = zeros(1,y1_dim); 
  for y = 1:y1_dim 
      for x = 1:x1_dim
          p1 = Fig1(y,x);
          if p1 > 0 && sp == 0
             sp = p1;
          end  
          if p1 > 0 && mpo == 0 && sp ~= p1 && sp ~= 0
              mpo = p1;
          end
          if p1 > 0 && mpt == 0 && mpo ~= 0 && mpo ~= p1 && sp ~= p1 && sp ~= 0
              mpt = p1;
          end
          if p1 > 0 
              ep = p1;
          end
      end
      RES(y)= abs(ep-mpt+mpo-sp);
      if RES(y) ~= 0
          RES(y) = 1/RES(y)
      end
      sp = 0;
      ep = 0;
      mpo = 0;
      mpt = 0;
  end
  RESM = RES;
end

