function [P_v] = Prob_of_View_at_Point_2acorner(n, L_x, L_y, L_z, x_r, y_r, h_rip, h_rih, h_p, r_p, d_r, in_pocket)
% This calculates the probability of Line of Sight (LoS) between a receiver
% located at (x_r,y_r,h_r) in a rectangular room R=[0,L_x]x[0,L_y]x[0,L_z]
% and two antennas located at the corners of the room at (0,0,L_z) and
% (L_x,L_y,L_z).

% h_rip and h_rih are the heights of the receiver when it is held in pocket
% and in hand, respectively.

% h_p and r_p are heighth and radius of cylindrical obstacles which
% represent uniformly randomly distributed people, and n is the number of
% people apart from the carrier. 

% in_pocket is 1 if receiver is attached to carrier, 0 if receiver is in
% hand at distance d_r from the center of the cylinder, r_p < d_r.

% Length in meters, angle in radians.

% effective area in the room where centers of people can be:
A=(L_x-2*r_p)*(L_y-2*r_p);
if n*pi*r_p^2 > A
    disp('Error! Too many people!')
    return;
end
% determine heigth of receiver:
if in_pocket == 1
    h_r= h_rip;
else
    h_r= h_rih;
end
% the distances of the receiver from the antennas:
d_a1=sqrt(x_r^2 + y_r^2);
d_a2=sqrt((L_x-x_r)^2 + (L_y-y_r)^2);
% Blocking distance, people closer than this distance in right direction
% block LoS:
d_B1=d_a1*(h_p-h_r)/(L_z-h_r);
d_B2=d_a2*(h_p-h_r)/(L_z-h_r);
% Area of center points that cause blockage:
A_B1=2*r_p*d_B1;
A_B2=2*r_p*d_B2;
% ta_v is the angle of view after blockage from the carrier:
if in_pocket == 1
    ta_v= pi;
else
    ta_v= 2*pi-2*asin(r_p/d_r);
end

ta_1c2=3*pi/2-atan(x_r/y_r) - atan((L_y-y_r)/(L_x-x_r));
ta_1c2=min(ta_1c2,2*pi-ta_1c2);
tag=0;
if d_B1 < d_r && in_pocket==0
    P_v1=1;
    tag=1;
else
    P_v1=ta_v/(2*pi);
end
if d_B2 < d_r && in_pocket==0
    P_v2=1;
    tag=2;
else
    P_v2=ta_v/(2*pi);
end
if tag==0
    P_v12=(max((ta_v-ta_1c2),0)+ max((ta_v + ta_1c2 - 2*pi),0))/(2*pi);
end
if tag==1
    P_v12=P_v2;
end
if tag==2
    P_v12=P_v1;
end
for j=1:n
    P_v1=P_v1*(A-A_B1-(j-1)*pi*r_p^2)/(A-(j-1)*pi*r_p^2);
    P_v2=P_v2*(A-A_B2-(j-1)*pi*r_p^2)/(A-(j-1)*pi*r_p^2);
    P_v12=P_v12*(A-A_B1-A_B2-(j-1)*pi*r_p^2)/(A-(j-1)*pi*r_p^2);
end
P_v=P_v1+P_v2-P_v12;
end