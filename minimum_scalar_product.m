% minimum scalar product

clc;
clear;
close all;

T = input('');
count_T = 0;
while count_T < T
    count_T = count_T + 1;
    stat = strcat('Case #', num2str(count_T), ':');
    
    n = input('');
    x1 = input('', 's');
    x2 = input('', 's');
    
    x1 = str2num(x1);
    x2 = str2num(x2);
    
    y = x1 * x2';
    
    x11 = sort(x1, 'ascend');
    x22 = sort(x2, 'descend');
    
    yy = x11 * x22';
    
    stat = strjoin({stat, num2str(yy)}, ' ');
    disp(stat);
end;