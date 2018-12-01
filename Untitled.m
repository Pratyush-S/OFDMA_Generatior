   %%Time specifications:
   Fs = 8000;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 1/150;             % seconds
   regcount=10;                  %No of regions to create
   t = (0:dt:StopTime);     % seconds
   
   %%Sine wave:
   Fc = 150;                     % hertz
  fre=[150 300 450 600]';        %initial frequencies
  
  X=randi([0,1],4,regcount)' %% generates  a random 3x regcount binary array 
  %%X=[0 0 0;1 0 0 ; 0 1 0 ;0 0 1;0 1 1;1 0 1;1 1 0;1 1 1];
  
  W1a=[];
  W3a=W1a;
  W2a=W3a;
  W4a=W1a;
  for i=1:regcount
      
            W1 = X(i,1)*sin(2*pi*fre(1)*t);
            W2 = X(i,2)*sin(2*pi*fre(2)*t);
            W3 = X(i,3)*sin(2*pi*fre(3)*t);
            W4 = X(i,4)*sin(2*pi*fre(4)*t);
           
            fre=circshift(fre,1); %%shuffling frequency after each itteration
            
            W1a=[W1a W1];   %%variable size
            W2a=[W2a W2];   %%variable size
            W3a=[W3a W3];   %%variable size
            W4a=[W4a W4];   %%variable size
      
  end
  Wave=W1a+W2a+W3a+W4a;
  dt2=(regcount*StopTime)/length(Wave); %%step size for complete signal
  t2=(0:dt2:regcount*StopTime-dt2);  %% independent variable for the complete signal 
     
   subplot(5,1,1);
  plot(t2,W1a);
    xlabel('time') 
  ylabel('User 1 ASK')
    subplot(5,1,2);
  plot(t2,W2a);
    xlabel('time') 
  ylabel('User 2 ASK')
    subplot(5,1,3);
  plot(t2,W3a);
    xlabel('time') 
  ylabel('User 3 ASK')
    subplot(5,1,4);
  plot(t2,W4a);
    xlabel('time') 
  ylabel('User 4 ASK')
    subplot(5,1,5);
  plot(t2,Wave);
    xlabel('time') 
  ylabel('OFDMA signal')
  
  