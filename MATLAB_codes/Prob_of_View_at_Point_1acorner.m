function [P_v] = Prob_of_View_at_Point_1acorner(n, L_x, L_y, L_z, x_r, y_r, h_rip, h_rih, h_p, r_p, d_r, in_pocket)
% This calculates the probability of Line of Sight (LoS) between a receiver
% located at (x_r,y_r,z_r), with z_r=h_rip if in pocket and z_r=h_rih if in
% pocket in a rectangular room R=[0,L_x]x[0,L_y]x[0,L_z] and an antenna
% located at the corner of the room at (0,0,L_z).

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

% determine the height of receiver:
if in_pocket == 1
    h_r= h_rip;
else
    h_r= h_rih;
end
% the distance of the receiver from the antenna:
d_a=sqrt(x_r^2 + y_r^2);
% Blocking distance, people closer than this distance in right direction
% block LoS:
d_B=d_a*(h_p-h_r)/(L_z-h_r);
% Area of center points that cause blockage:
A_B=2*r_p*d_B;
% ta_v is the angle of view after blockage from the carrier:
if in_pocket == 1
    ta_v= pi;
else
    ta_v= 2*pi-2*sin(r_p/d_r);
end

if d_B < d_r && in_pocket==0
    P_v=1;
else
    P_v=ta_v/(2*pi);
end
for j=1:n
    P_v=P_v*(A-A_B-(j-1)*pi*r_p^2)/(A-(j-1)*pi*r_p^2);
end

end