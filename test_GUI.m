% version 0.6
% known bugs:
%   1.Spike noise betweeen frame and frame
%   2.To determine the best detection period and overlap_time for different speed audio
%%initialize some parameter and GUI
if findobj('Tag','speed_gui') 
     close Gui1;   
end
i=1;
speed_gui(1);
speed_gui(0);
[y,Fs] = audioread('1.mp3');
y = y(:,1);
overlap_time=1; %% in real processing, it is essential for an overlapping between two different time
change_period=1; %%speed detection period (in origin speed second). It's suggested that the vlue larger than 1
yout = [];
alpha_pre=0;
repeat_mode = 0 %% Repeatedly play and process
tic
%%process in real time emulation
while 1
    if i==length(y)
        if repeat_mode == 1
            yout=0;
            i=1;
        else
            break;
        end
        %break;
    end
    h=findobj('Tag','speed_gui');
    handle_s = guidata(h);
    if ~isempty(handle_s)
        alpha = 1/handle_s.output;
    end
    paramPVpl.phaseLocking = 1;
    win_time = max(i-round(overlap_time)*Fs,1):min(i+round((change_period+overlap_time)*Fs),length(y));
    yPVpl = pvTSM(y(win_time),alpha,paramPVpl); %%phase vocoder with correspond parameter
    yPVpl = yPVpl(round(overlap_time*alpha*Fs):round(overlap_time*alpha*Fs+change_period*alpha*Fs));
    process_time = toc;
    pause((change_period)*alpha_pre-process_time); %%waiting for the last processed-seginal in acurate time
%   the section is for another control method. For better performance, it
%   is replace by sound and puase function
%     while ~isplaying(temp_tp)
%         pause(0.0001)
%     end
%   temp_tp=audioplayer(yPVpl, Fs);
    sound(yPVpl,Fs);
    tic
    alpha_pre = alpha;
    yout=[yout;yPVpl]; %record for estimation
    i=min(i+round(change_period*Fs)+1,length(y));
end