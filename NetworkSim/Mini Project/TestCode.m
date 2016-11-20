%% For doing the histogram
close all
clear 
sim('Model');
h=hist(data_rc.Data(:,1)-data_rc.Data(:,2)+10,9);
h=h/sum(h);

hq=hist(data_rc.Data(:,1),9);
hq=hq/sum(hq);

bar(0.1:1:8.1,h);
hold on;
bar(0:1:8,hq,'r');
hold off;
