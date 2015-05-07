function brain = learnGame(LEARNING_DISPERSION,brain,decisions,result, WIN_CONSTANT)
% Process every decision. IF we lose we store the opposite game.
% We weight every decision according to it's distance to the last play,
% in this way the play 1 will be 1*action, while the play n will be
% n*action
    
 %brain = [];
 %decissions = [1 0 0 1; 4 0 0 -1; 3 0 0 -1; 9 0 0 1];

    
    % If we lose, change the actions
    if strcmp(result,'loss')
        decisions(:,3) = decisions(:,3).*-1*round(WIN_CONSTANT/3);
    % If we win, give more value to the actions (x20)
    elseif strcmp(result,'win')
        decisions(:,3) = decisions(:,3).*WIN_CONSTANT;
    else
        fprintf('MAL LLAMADO IMPLEMTAR EXCEPTION');
        pause;
    end
    
    %decisions
    
    % Store each row
    numberOfDecisions = size(decisions,1);
    for i = numberOfDecisions:-1:1
        
        D = decisions(i,:);
        h = D(1);
        d = D(2);
        a = D(3);
       
       % weight = ceil(i/numberOfDecissions*100);
       dispersion = LEARNING_DISPERSION*0.75;
       %if d>240
       %    dispersion = LEARNING_DISPERSION*;
       %end
        weight = round(exp(-(dispersion*(i-numberOfDecisions)^2)/2)*100)/100;
        a2 = round(a*weight);
       % fprintf('%d, %d, %d * %d > %d \n',h,d,a,weight,a2);
        if d<=0
            d=1;
        end
       brain(h,d) = brain(h,d) + a2;
        
        % Check end
        if a2 == 0
            break
        end
    end
   
end

