clc;
clear;
close all;

C = input('');
count_C = 0;
fid = fopen('output.out', 'w');
while count_C < C
    count_C = count_C + 1;
    stat    = strcat('Case #', num2str(count_C), ':');
    
    N = input('');
    M = input('');
    
    customer = struct('T', cell(M,1), 'flavors', cell(M,1));
    for i = 1:M
        S = input('', 's');
        S = str2num(S);
        
        customer(i).T = S(1);
        customer(i).flavors = reshape(S(2:end), 2, S(1));
        if count_C == 70
            disp(S);
        end;
    end;
    
    malted = zeros(1,N);
    satisfied_flag  = true;
    change_flag     = true;
    while change_flag
        change_flag = false;
        for i = 1:M
            this_customer   = customer(i).flavors(2,:);
            myserving       = malted(customer(i).flavors(1,:));
            comparison      = (this_customer == myserving);
            
            if ~isempty(find(comparison == true,1))
                continue;
            end;
            
            if sum(this_customer) == 0
                change_flag = false;
                satisfied_flag = false;
                break;
            end;
            
            flavor = find(this_customer == 1, 1);
            malted(customer(i).flavors(1,flavor)) = 1;
            change_flag = true;
            break;
        end;
    end;
    
    if satisfied_flag
        for i = 1:N
            stat = strjoin({stat, num2str(malted(i))}, ' ');
        end;
    else
        stat = strjoin({stat, 'IMPOSSIBLE'}, ' ');
    end;
    
%     disp(stat);
    fprintf(fid, stat);
    fprintf(fid, '\n');
end;
fclose(fid);







