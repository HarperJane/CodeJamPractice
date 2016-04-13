clc;
clear;
close all;

T = input('');
count_T = 0;
while count_T < T
    count_T = count_T + 1;
    
    stat = strcat('Case #', num2str(count_T), ':');
    n   = input('');
    m   = input('');
    flavor = zeros(m, n);
    for i = 1:m
        in_text = input('', 's');
        in_text = str2num(in_text);
        num = in_text(1);
        for j = 1:num
            f       = in_text(j*2);
            malted  = in_text(j*2 + 1);
            if malted == 0
                flavor(i, f) = -1; % unmalted
            else
                flavor(i, f) = 1; % malted
            end; 
        end;
    end;
    
    final_serve = zeros(1, n);
end;
    
        
    
