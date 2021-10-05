function [] = xtract_data()
% This method extracts data required to plot the figure in the paper "Human
% Blockage Model for Indoor Terahertz Band Communication"

% All distance units are in meters
h_rip = 0.75;% in-pocket height of the receiver
h_rih = 1.25;% in-hand height of the receiver
h_p = 1.8;% height of a person
r_p = 0.25;% radius of a person
d_r = 0.5;% in-hand distance of the receiver to the center of the carrier
nx = 80;% number of x-grid coordinates of the mesh that represents the room
ny = 80;% number of y-grid coordinates of the mesh that represents the room

% Calculations for varying room base dimensions
L_z = 3;% height of the antenna
for L=[5,10,20]
    for in_pocket=[0,1]
        L_x = L;% x-dimension of the room
        L_y = L;% y-dimension of the room
        max_people = 4*L_x*L_y;
        no_people = 0:1:max_people;
        
        P_v1a=zeros(max_people+1,nx,ny);% P_v1a(j,k,i+1) holds for the case of 1 antenna the LoS probability at the space indexed by (j,k) when there are i additional people in the room
        P_v2a=zeros(max_people+1,nx,ny);% P_v2a(j,k,i+1) holds for the case of 2 antennas the LoS probability at the space indexed by (j,k) when there are i additional people in the room
        P_v1a_permuted=zeros(nx,ny,max_people+1);
        P_v2a_permuted=zeros(nx,ny,max_people+1);
        P_vav1a=zeros(1,max_people+1);% P_vav1a(i+1) holds for the case of 1 antenna the average LoS probability when there are i additional people in the room
        P_vav2a=zeros(1,max_people+1);% P_vav2a(i+1) holds for the case of 2 antennas the average LoS probability when there are i additional people in the room
        dx=(L_x-2*r_p)/nx;
        dy=(L_y-2*r_p)/ny;
        for k=1:max_people+1
            for i=1:nx
                for j=1:ny
                    x_r=r_p+(i-.5)*dx;
                    y_r=r_p+(j-.5)*dy;
                    P_v1a(k,i,j)=Prob_of_View_at_Point_1acorner(k-1, L_x, L_y, L_z, x_r, y_r, h_rip, h_rih, h_p, r_p, d_r, in_pocket);
                    P_v2a(k,i,j)=Prob_of_View_at_Point_2acorner(k-1, L_x, L_y, L_z, x_r, y_r, h_rip, h_rih, h_p, r_p, d_r, in_pocket);
                    P_v1a_permuted(i,j,k)=P_v1a(k,i,j);
                    P_v2a_permuted(i,j,k)=P_v2a(k,i,j);
                    P_vav1a(k)=P_vav1a(k)+P_v1a(k,i,j);
                    P_vav2a(k)=P_vav2a(k)+P_v2a(k,i,j);
                end
            end
        end
        P_vav1a = P_vav1a/(nx*ny);
        P_vav2a = P_vav2a/(nx*ny);
        if in_pocket==1
            fileName = sprintf('view_prob_data_%dx%dx%d-%d-%d-%d-%d-%d_inpocket.mat',L_x,L_y,L_z,100*h_rip,100*h_rih,100*h_p,100*r_p,100*d_r);
        else
            fileName = sprintf('view_prob_data_%dx%dx%d-%d-%d-%d-%d-%d_inhand.mat',L_x,L_y,L_z,100*h_rip,100*h_rih,100*h_p,100*r_p,100*d_r);
        end
        save(fileName,'no_people','P_v1a','P_v2a','P_v1a_permuted','P_v2a_permuted','P_vav1a','P_vav2a');
    end
end

% Calculations for varying antenna heights
L_x = 10;
L_y = 10;
for L_z=[2,4,5]
    for in_pocket=[0,1]
        max_people = 4*L_x*L_y;
        no_people = 0:1:max_people;
        
        P_v1a=zeros(max_people+1,nx,ny);% P_v1a(j,k,i+1) holds for the case of 1 antenna the LoS probability at the space indexed by (j,k) when there are i additional people in the room
        P_v2a=zeros(max_people+1,nx,ny);% P_v2a(j,k,i+1) holds for the case of 2 antennas the LoS probability at the space indexed by (j,k) when there are i additional people in the room
        P_v1a_permuted=zeros(nx,ny,max_people+1);
        P_v2a_permuted=zeros(nx,ny,max_people+1);
        P_vav1a=zeros(1,max_people+1);% P_vav1a(i+1) holds for the case of 1 antenna the average LoS probability when there are i additional people in the room
        P_vav2a=zeros(1,max_people+1);% P_vav2a(i+1) holds for the case of 2 antennas the average LoS probability when there are i additional people in the room
        dx=(L_x-2*r_p)/nx;
        dy=(L_y-2*r_p)/ny;
        for k=1:max_people+1
            for i=1:nx
                for j=1:ny
                    x_r=r_p+(i-.5)*dx;
                    y_r=r_p+(j-.5)*dy;
                    P_v1a(k,i,j)=Prob_of_View_at_Point_1acorner(k-1, L_x, L_y, L_z, x_r, y_r, h_rip, h_rih, h_p, r_p, d_r, in_pocket);
                    P_v2a(k,i,j)=Prob_of_View_at_Point_2acorner(k-1, L_x, L_y, L_z, x_r, y_r, h_rip, h_rih, h_p, r_p, d_r, in_pocket);
                    P_v1a_permuted(i,j,k)=P_v1a(k,i,j);
                    P_v2a_permuted(i,j,k)=P_v2a(k,i,j);
                    P_vav1a(k)=P_vav1a(k)+P_v1a(k,i,j);
                    P_vav2a(k)=P_vav2a(k)+P_v2a(k,i,j);
                end
            end
        end
        P_vav1a = P_vav1a/(nx*ny);
        P_vav2a = P_vav2a/(nx*ny);
        if in_pocket==1
            fileName = sprintf('view_prob_data_%dx%dx%d-%d-%d-%d-%d-%d_inpocket.mat',L_x,L_y,L_z,100*h_rip,100*h_rih,100*h_p,100*r_p,100*d_r);
        else
            fileName = sprintf('view_prob_data_%dx%dx%d-%d-%d-%d-%d-%d_inhand.mat',L_x,L_y,L_z,100*h_rip,100*h_rih,100*h_p,100*r_p,100*d_r);
        end
        save(fileName,'no_people','P_v1a','P_v2a','P_v1a_permuted','P_v2a_permuted','P_vav1a','P_vav2a');
    end
end

end