% IQB HOMEWORK 6
% Aarushi Agarwal - 2016216
% Shravika Mittal - 2016093
% Surabhi S Nath - 2016271

num_mol =100;
grid_size = 50;
num_simulation = 1000;

% Make arrays for x, y coordinates.
xcoord = zeros(1,num_mol);
ycoord = zeros(1,num_mol);
xinitial = zeros(1, num_mol);
yinitial = zeros(1, num_mol);

% Initialize the 50 by 50 grid
grid = zeros(grid_size);


% Initialize the grid
i=1;
while(i<=num_mol)
    x=randi([1,grid_size]);
    y=randi([1,grid_size]);
    
    if(grid(x,y)==0)
        grid(x,y) = 1;
        xcoord(i) = x;
        ycoord(i) = y;
        xinitial(i) = x;
        yinitial(i) = y;
        i=i+1;
    end
end


%Do simulation
for j = 1:num_simulation
   for k = 1:num_mol
      prob = randi([1,100]);
      if(prob<=25)                      %Left
        if(xcoord(k)>1 && grid(xcoord(k)-1,ycoord(k))==0)       % Accounting for reflective boundry and ensuring no 2 points can have same coordinates
            xcoord(k) = xcoord(k) - 1;
        end
      elseif(prob>25 && prob<=50)       %Right
        if(xcoord(k)<50 && grid(xcoord(k)+1,ycoord(k))==0)      % Accounting for reflective boundry and ensuring no 2 points can have same coordinates
            xcoord(k) = xcoord(k) + 1;
        end
      elseif(prob>50 && prob<=75)       %Up
        if(ycoord(k)<50 && grid(xcoord(k),ycoord(k)+1)==0)      % Accounting for reflective boundry and ensuring no 2 points can have same coordinates
            ycoord(k) = ycoord(k) + 1;
        end
      else                              %Down
        if(ycoord(k)>1 && grid(xcoord(k),ycoord(k)-1)==0)       % Accounting for reflective boundry and ensuring no 2 points can have same coordinates
            ycoord(k) = ycoord(k) - 1;
        end
      end
   end
end


%Find mean displacement
xdisp = zeros(1, num_mol);
ydisp = zeros(1, num_mol);
rsquared = zeros(1, num_mol);
xsum = 0;
ysum = 0;
rsqsum = 0;


for i=1:num_mol
   xdisp(i) = xcoord(i) - xinitial(i);
   xsum = xsum + xdisp(i);
   ydisp(i) = ycoord(i) - yinitial(i);
   ysum = ysum + ydisp(i);
   rsquared(i) = xdisp(i)*xdisp(i) + ydisp(i)*ydisp(i);
   rsqsum = rsqsum + rsquared(i);
end

meanx = xsum/num_mol;
meany = ysum/num_mol;
meanrsq = rsqsum/num_mol;

