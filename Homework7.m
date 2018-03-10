% IQB HOMEWORK 6
% Aarushi Agarwal - 2016216
% Shravika Mittal - 2016093
% Surabhi S Nath - 2016271


grid_size = 50;
num_simulation = 1000;

% initialise the bias array
probgrid = [0.3,0.3,0.2,0.2;0.35,0.35,0.15,0.15;0.5,0.5,0,0];

num_turns = 0;
finalans = zeros(1, 3);

for bias = 1:3
    count = 0;
    for i=1:100
        
        xcoord=randi([-25,25])
        ycoord=randi([-25,25])
        
        while(xcoord ~= 0 || ycoord ~= 0)
            if(xcoord>=0 && ycoord>0) %Quadrant 1
                prob=rand;
                if(prob<probgrid(bias,1))   %Left
                    xcoord = xcoord - 1;
                elseif(prob>=probgrid(bias, 1) && prob<2*probgrid(bias, 2))   %Down
                    ycoord = ycoord - 1;
                elseif(prob>=2*probgrid(bias, 2) && prob<2*probgrid(bias, 2) + probgrid(bias, 3) && xcoord<25)  %Right
                    xcoord = xcoord + 1;
                elseif(prob>=2*probgrid(bias, 2) + probgrid(bias, 3) && prob<2*probgrid(bias, 2) + probgrid(bias, 3) + probgrid(bias, 4) && ycoord<25)  %Top
                    ycoord = ycoord + 1;
                end
            elseif(xcoord<0 && ycoord>=0)    %Quadrant 2
                prob=rand;
                if(prob<probgrid(bias,1))   %Right
                    xcoord = xcoord + 1;
                elseif(prob>=probgrid(bias, 1) && prob<2*probgrid(bias, 2))   %Down
                    ycoord = ycoord - 1;
                elseif(prob>=2*probgrid(bias, 2) && prob<2*probgrid(bias, 2) + probgrid(bias, 3) && xcoord>-25)  %Left
                    xcoord = xcoord - 1;
                elseif(prob>=2*probgrid(bias, 2) + probgrid(bias, 3) && prob<2*probgrid(bias, 2) + probgrid(bias, 3) + probgrid(bias, 4) && ycoord<25)  %Top
                    ycoord = ycoord + 1;
                end
            elseif(xcoord<=0 && ycoord<0)    %Quadrant 3
                prob=rand;
                if(prob<probgrid(bias,1))   %Right
                    xcoord = xcoord + 1;
                elseif(prob>=probgrid(bias, 1) && prob<2*probgrid(bias, 2))   %Top
                    ycoord = ycoord + 1;
                elseif(prob>=2*probgrid(bias, 2) && prob<2*probgrid(bias, 2) + probgrid(bias, 3) && xcoord>-25)  %Left
                    xcoord = xcoord - 1;
                elseif(prob>=2*probgrid(bias, 2) + probgrid(bias, 3) && prob<2*probgrid(bias, 2) + probgrid(bias, 3) + probgrid(bias, 4) && ycoord>-25)  %Down
                    ycoord = ycoord - 1;
                end
            else                           %Quadrant 4
                prob=rand;
                if(prob<probgrid(bias,1))   %Left
                    xcoord = xcoord - 1;
                elseif(prob>=probgrid(bias, 1) && prob<2*probgrid(bias, 2))   %Top
                    ycoord = ycoord + 1;
                elseif(prob>=2*probgrid(bias, 2) && prob<2*probgrid(bias, 2) + probgrid(bias, 3) && xcoord<25)  %Right
                    xcoord = xcoord + 1;
                elseif(prob>=2*probgrid(bias, 2) + probgrid(bias, 3) && prob<2*probgrid(bias, 2) + probgrid(bias, 3) + probgrid(bias, 4) && ycoord>-25)  %Down
                    ycoord = ycoord - 1;
                end
            end 
            count = count + 1;
        end    
    end
    finalans(bias) = count;
end


plot([1,2,3], finalans);