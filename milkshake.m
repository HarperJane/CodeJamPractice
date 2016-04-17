clc;
clear;
close all;

C = input('');
count_C = 0;
fid = fopen('milkshake.txt', 'w');

while count_C < C
    count_C = count_C + 1;
    stat    = strcat('Case #', num2str(count_C), ':');
    
    N = input('');
    M = input('');
    
    malted      = zeros(1,N); % malted = 1, unmalted = -1;
    Mflavors    = zeros(M,N);
    
    for i = 1:M
        S = input('', 's');
        S = str2num(S);
        T = S(1);
        S = reshape(S(2:end), 2, T)';
        
        for j = 1:T
            if S(j,2) == 1
                Mflavors(i, S(j,1)) = 1;
            else
                Mflavors(i, S(j,1)) = -1;
            end;
        end;
    end;
    
    flag = true;
    while flag
        flag = false;
        for i = 1:N
            tmp = Mflavors(:,i);
            if isempty(find(tmp>0,1)) && malted(i) == 0
                malted(i) = -1;
                tmp = find(tmp ~= -1);
                Mflavors = Mflavors(tmp,:);
                flag = true;
            end;
        end;
    end;
    M = length(Mflavors(:,1));
    if M == 0
        flag = true;
    end;
    
    left2decide = find(malted == 0);
    len0 = length(left2decide);
    for num_malted = 1:len0
        shake_combi = nchoosek(left2decide, num_malted);
        len = length(shake_combi(:,1));
        for i = 1:len
            temp_malted = zeros(1,N)-1;
            temp_malted(shake_combi(i,:)) = 1;
            
            flag = true;
            for m = 1:M
                check_customer = temp_malted .* Mflavors(m,:);
                if isempty(find(check_customer == 1, 1))
                    flag = false;
                    break;
                end;
            end;
            if flag
                malted = temp_malted;
                malted(malted == -1) = 0;
                break;
            end;
        end;
        if flag
            break;
        end;
    end;
    
    if flag
        if M == 0
            malted = zeros(1,N);
        end;
        for i = 1:N
            stat = strjoin({stat, num2str(malted(i))}, ' ');
        end;
    else
        stat = strjoin({stat, 'IMPOSSIBLE'}, ' ');
    end;
    disp(stat);
    fprintf(fid, stat);
    fprintf(fid, '\n');
end;
fclose(fid);
    
                    
                    
                    