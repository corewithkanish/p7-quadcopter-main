close all
ts=0.56;
Mp=0;
chi=1;
wn=4.6/ts/chi;

s=tf('s');
Groll=wn^2/(s^2+2*chi*wn*s+wn^2);

Kx=-kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gx=Kx/(m*s);
Ky=kth*(w1_bar^2+w2_bar^2+w3_bar^2+w4_bar^2);
Gy=Ky/(m*s);
step(Groll)
hold on
plot(roll.Time, roll.Data,'k');