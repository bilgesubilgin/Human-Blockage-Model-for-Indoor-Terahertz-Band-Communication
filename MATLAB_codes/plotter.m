function [] = plotter()

% Plot of Figure 3 in the paper: P_view vs space when receiver is in hand
% in case of 1 antenna.
figure
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
hold on;
dx=(10-2*.25)/80;
dy=(10-2*.25)/80;
x=0.25+dx/2:dx:9.75-dx/2;
y=0.25+dy/2:dy:9.75-dy/2;
surf(x,y,P_v1a_permuted(:,:,1))
surf(x,y,P_v1a_permuted(:,:,21))
surf(x,y,P_v1a_permuted(:,:,51))
surf(x,y,P_v1a_permuted(:,:,101))
xlim([0 10]);
ylim([0 10]);
zlim([0 1]);
view(45,5)
title('LoS probability space distribution with one antenna when receiver is in hand');
xlabel('x-axis');
ylabel('y-axis');
zlabel('Probability of LoS');
hold off;

% Plot of Figure 4 in the paper: P_view vs space when receiver is in
% pocket in case of 1 antenna.
figure
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
hold on;
dx=(10-2*.25)/80;
dy=(10-2*.25)/80;
x=0.25+dx/2:dx:9.75-dx/2;
y=0.25+dy/2:dy:9.75-dy/2;
surf(x,y,P_v1a_permuted(:,:,1))
surf(x,y,P_v1a_permuted(:,:,21))
surf(x,y,P_v1a_permuted(:,:,51))
surf(x,y,P_v1a_permuted(:,:,101))
xlim([0 10]);
ylim([0 10]);
zlim([0 1]);
view(30,5)
title('LoS probability space distribution with one antenna when receiver is in pocket');
xlabel('x-axis');
ylabel('y-axis');
zlabel('Probability of LoS');
hold off;

% Plot of Figure 5 in the paper: P_view vs space when receiver is in hand
% in case of 2 antennas.
figure
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
hold on;
dx=(10-2*.25)/80;
dy=(10-2*.25)/80;
x=0.25+dx/2:dx:9.75-dx/2;
y=0.25+dy/2:dy:9.75-dy/2;
surf(x,y,P_v2a_permuted(:,:,1))
surf(x,y,P_v2a_permuted(:,:,21))
surf(x,y,P_v2a_permuted(:,:,51))
surf(x,y,P_v2a_permuted(:,:,101))
xlim([0 10]);
ylim([0 10]);
zlim([0 1]);
view(45,5)
title('LoS probability space distribution with two antennas when receiver is in hand');
xlabel('x-axis');
ylabel('y-axis');
zlabel('Probability of LoS');
hold off;

% Plot of Figure 6 in the paper: P_view vs space when receiver is in pocket
% in case of 2 antennas.
figure
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
hold on;
dx=(10-2*.25)/80;
dy=(10-2*.25)/80;
x=0.25+dx/2:dx:9.75-dx/2;
y=0.25+dy/2:dy:9.75-dy/2;
surf(x,y,P_v2a_permuted(:,:,1))
surf(x,y,P_v2a_permuted(:,:,21))
surf(x,y,P_v2a_permuted(:,:,51))
surf(x,y,P_v2a_permuted(:,:,101))
xlim([0 10]);
ylim([0 10]);
zlim([0 1]);
view(-30,5)
title('LoS probability space distribution with two antennas when receiver is in pocket');
xlabel('x-axis');
ylabel('y-axis');
zlabel('Probability of LoS');
hold off;

% Plot of Figure 7 of the paper: P_view at different places and P_view_avg
% vs no_people when receiver is in hand in case of 1 antenna.
figure
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
hold on;
plot(no_people, P_v1a(:,1,1), 'k-', no_people(1:401), P_v1a(1:401,40,40), 'k--', no_people(1:401), P_v1a(1:401,1,80), 'k-.', no_people, P_v1a(:,80,80), 'k:')
plot(no_people, P_vav1a, 'k-', 'LineWidth',2)
ylim([0 1]);
title('LoS probabilities with one antenna when receiver is in hand');
xlabel('Number of People');
ylabel('Probability of LoS');
legend('Below antenna 1','Centre of room', 'Adjacent corner', 'Opposite corner', 'Average');
hold off;

% Plot of Figure 8 of the paper: P_view at different places and P_view_avg
% vs no_people when receiver is in pocket in case of 1 antenna.
figure
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
hold on;
plot(no_people, P_v1a(:,1,1), 'k-', no_people(1:401), P_v1a(1:401,40,40), 'k--', no_people(1:401), P_v1a(1:401,1,80), 'k-.', no_people, P_v1a(:,80,80), 'k:')
plot(no_people, P_vav1a, 'k-', 'LineWidth',2)
ylim([0 1]);
title('LoS probabilities with one antenna when receiver is in pocket');
xlabel('Number of People');
ylabel('Probability of LoS');
legend('Below antenna 1','Centre of room', 'Adjacent corner', 'Opposite corner', 'Average');
hold off;

% Plot of Figure 9 of the paper: P_view at different places and P_view_avg
% vs no_people when receiver is in hand in case of 2 antennas.
figure
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
hold on;
plot(no_people, P_v2a(:,1,1), 'k-', no_people(1:401), P_v2a(1:401,40,40), 'k--', no_people(1:401), P_v2a(1:401,1,80), 'k-.', no_people, P_v2a(:,80,80), 'k:')
plot(no_people, P_vav2a, 'k-', 'LineWidth',2)
ylim([0 1]);
title('LoS probabilities with two antennas when receiver is in hand');
xlabel('Number of People');
ylabel('Probability of LoS');
legend('Below antenna 1','Centre of room', 'Adjacent corner', 'Below antenna 2', 'Average');
hold off;

% Plot of Figure 10 of the paper: P_view at different places and P_view_avg
% vs no_people when receiver is in pocket in case of 2 antennas.
figure
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
hold on;
plot(no_people, P_v2a(:,1,1), 'k-', no_people(1:401), P_v2a(1:401,40,40), 'k--', no_people(1:401), P_v2a(1:401,1,80), 'k-.', no_people, P_v2a(:,80,80), 'k:')
plot(no_people, P_vav2a, 'k-', 'LineWidth',2)
ylim([0 1]);
title('LoS probabilities with two antennas when receiver is in pocket');
xlabel('Number of People');
ylabel('Probability of LoS');
legend('Below antenna 1','Centre of room', 'Adjacent corner', 'Below antenna 2', 'Average');
hold off;

% Plot of Figure 11 in the paper: Average P_LoS vs number of people for
% different antenna hegihts when receiver is in hand 
figure
hold on;
load('view_prob_data_10x10x2-75-125-180-25-50_inhand.mat')
subplot(1,2,1);
plot(no_people, P_vav1a, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a, 'k--')
hold on;
load('view_prob_data_10x10x4-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a, 'k-.')
hold on;
load('view_prob_data_10x10x5-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a, 'k:')
legend('2 metres','3 metres','4 metres', '5 metres');
title('1 antenna, receiver in hand');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 400]);
clear;
hold on;
load('view_prob_data_10x10x2-75-125-180-25-50_inhand.mat')
subplot(1,2,2);
plot(no_people, P_vav2a, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a, 'k--')
hold on;
load('view_prob_data_10x10x4-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a, 'k-.')
hold on;
load('view_prob_data_10x10x5-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a, 'k:')
legend('2 metres','3 metres','4 metres', '5 metres');
title('2 antennas, receiver in hand');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 400]);
ylim([0 1]);

% Plot of Figure 12 in the paper: Average P_LoS vs number of people for
% different antenna hegihts when receiver is in pocket 
figure
hold on;
load('view_prob_data_10x10x2-75-125-180-25-50_inpocket.mat')
subplot(1,2,1);
plot(no_people, P_vav1a, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a, 'k--')
hold on;
load('view_prob_data_10x10x4-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a, 'k-.')
hold on;
load('view_prob_data_10x10x5-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a, 'k:')
legend('2 metres','3 metres','4 metres', '5 metres');
title('1 antenna, receiver in pocket');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 400]);
clear;
hold on;
load('view_prob_data_10x10x2-75-125-180-25-50_inpocket.mat')
subplot(1,2,2);
plot(no_people, P_vav2a, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a, 'k--')
hold on;
load('view_prob_data_10x10x4-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a, 'k-.')
hold on;
load('view_prob_data_10x10x5-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a, 'k:')
legend('2 metres','3 metres','4 metres', '5 metres');
title('2 antennas, receiver in pocket');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 400]);
ylim([0 1]);

% Plot of Figure 13 in the paper: Average coverage vs number of people for
% different antenna hegihts when receiver is in hand 
figure
hold on;
load('view_prob_data_10x10x2-75-125-180-25-50_inhand.mat')
subplot(1,2,1);
plot(no_people, P_vav1a.*no_people, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a.*no_people, 'k--')
hold on;
load('view_prob_data_10x10x4-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a.*no_people, 'k-.')
hold on;
load('view_prob_data_10x10x5-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a.*no_people, 'k:')
legend('2 metres','3 metres','4 metres', '5 metres');
title('1 antenna, receiver in hand');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 400]);
clear;
hold on;
load('view_prob_data_10x10x2-75-125-180-25-50_inhand.mat')
subplot(1,2,2);
plot(no_people, P_vav2a.*no_people, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a.*no_people, 'k--')
hold on;
load('view_prob_data_10x10x4-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a.*no_people, 'k-.')
hold on;
load('view_prob_data_10x10x5-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a.*no_people, 'k:')
legend('2 metres','3 metres','4 metres', '5 metres');
title('2 antennas, receiver in hand');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 400]);

% Plot of Figure 14 in the paper: Average coverage vs number of people for
% different antenna hegihts when receiver is in pocket 
figure
hold on;
load('view_prob_data_10x10x2-75-125-180-25-50_inpocket.mat')
subplot(1,2,1);
plot(no_people, P_vav1a.*no_people, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a.*no_people, 'k--')
hold on;
load('view_prob_data_10x10x4-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a.*no_people, 'k-.')
hold on;
load('view_prob_data_10x10x5-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a.*no_people, 'k:')
legend('2 metres','3 metres','4 metres', '5 metres');
title('1 antenna, receiver in pocket');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 400]);
clear;
hold on;
load('view_prob_data_10x10x2-75-125-180-25-50_inpocket.mat')
subplot(1,2,2);
plot(no_people, P_vav2a.*no_people, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a.*no_people, 'k--')
hold on;
load('view_prob_data_10x10x4-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a.*no_people, 'k-.')
hold on;
load('view_prob_data_10x10x5-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a.*no_people, 'k:')
legend('2 metres','3 metres','4 metres', '5 metres');
title('2 antennas, receiver in pocket');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 400]);

% Plot of Figure 15 in the paper: Average P_LoS vs number of people for
% different room base area sizes when receiver is in hand
figure
load('view_prob_data_5x5x3-75-125-180-25-50_inhand.mat')
subplot(1,2,1);
plot(no_people, P_vav1a, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a, 'k--')
hold on;
load('view_prob_data_20x20x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a, 'k-.')
legend('5x5','10x10','20x20');
title('1 antenna, receiver in hand');
xlabel('Number of People');
ylabel('Average Probability of LoS');
xlim([0 1600]);
ylim([0 1]);
clear;
hold on;
load('view_prob_data_5x5x3-75-125-180-25-50_inhand.mat')
subplot(1,2,2);
plot(no_people, P_vav2a, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a, 'k--')
hold on;
load('view_prob_data_20x20x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a, 'k-.')
legend('5x5','10x10','20x20');
title('2 antennas, receiver in hand');
xlabel('Number of People');
ylabel('Average Probability of LoS');
xlim([0 1600]);
ylim([0 1]);

% Plot of Figure 16 in the paper: Average P_LoS vs number of people for
% different room base area sizes when receiver is in pocket
figure
load('view_prob_data_5x5x3-75-125-180-25-50_inpocket.mat')
subplot(1,2,1);
plot(no_people, P_vav1a, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a, 'k--')
hold on;
load('view_prob_data_20x20x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a, 'k-.')
legend('5x5','10x10','20x20');
title('1 antenna, receiver in pocket');
xlabel('Number of People');
ylabel('Average Probability of LoS');
xlim([0 1600]);
ylim([0 1]);
clear;
hold on;
load('view_prob_data_5x5x3-75-125-180-25-50_inpocket.mat')
subplot(1,2,2);
plot(no_people, P_vav2a, 'k-')
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a, 'k--')
hold on;
load('view_prob_data_20x20x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a, 'k-.')
legend('5x5','10x10','20x20');
title('2 antennas, receiver in pocket');
xlabel('Number of People');
ylabel('Average Probability of LoS');
xlim([0 1600]);
ylim([0 1]);

% Plot of Figure 17 in the paper: Average coverage vs number of people for
% different room base area sizes when receiver is in hand
figure
subplot(1,2,1);
hold on
load('view_prob_data_5x5x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a.*no_people, 'k-')
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a.*no_people, 'k--')
load('view_prob_data_20x20x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav1a.*no_people, 'k-.')
legend('5x5','10x10','20x20');
title('1 antenna, receiver in hand');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 1600]);
hold off
subplot(1,2,2);
hold on
load('view_prob_data_5x5x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a.*no_people, 'k-')
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a.*no_people, 'k--')
load('view_prob_data_20x20x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a.*no_people, 'k-.')
legend('5x5','10x10','20x20');
title('2 antennas, receiver in hand');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 1600]);
hold off

% Plot of Figure 18 in the paper: Average coverage vs number of people for
% different room base area sizes when receiver is in pocket
figure
subplot(1,2,1);
hold on
load('view_prob_data_5x5x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a.*no_people, 'k-')
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a.*no_people, 'k--')
load('view_prob_data_20x20x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav1a.*no_people, 'k-.')
legend('5x5','10x10','20x20');
title('1 antenna, receiver in pocket');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 1600]);
hold off
subplot(1,2,2);
hold on
load('view_prob_data_5x5x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a.*no_people, 'k-')
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a.*no_people, 'k--')
load('view_prob_data_20x20x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a.*no_people, 'k-.')
legend('5x5','10x10','20x20');
title('2 antennas, receiver in pocket');
xlabel('Number of People');
ylabel('Average Coverage');
xlim([0 1600]);
hold off

% Plot of Figure 19 in the paper: Coverage ratio vs number of people
figure
hold on;
load('view_prob_data_10x10x3-75-125-180-25-50_inhand.mat')
plot(no_people, P_vav2a./P_vav1a, 'k-')
load('view_prob_data_10x10x3-75-125-180-25-50_inpocket.mat')
plot(no_people, P_vav2a./P_vav1a, 'k--')
legend('In hand','In pocket','Location','East');
title('Coverage ratio of 2 antennas over 1 antenna');
xlabel('Number of People');
ylabel('Coverage ratio');
xlim([0 400]);

end