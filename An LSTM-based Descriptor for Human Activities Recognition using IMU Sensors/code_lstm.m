clear all;
clc;
%https://www.mathworks.com/help/nnet/examples/classify-sequence-data-using-lstm-networks.html?searchHighlight=miniBatchSize&s_tid=doc_srchtitle
%normalized_Running
load normalized_Flipping;
load normalized_Drawing;
load normalized_cycle;
load normalized_Cutting_Components;
load normalized_Running;
load normalized_Driving_Manual;
load normalized_Eat_with_hand;
load normalized_Playing_on_Guitar;
load normalized_GYM_Weight_Back;
load normalized_GYM_Weight_bieceps;
load normalized_GYM_Weight_chest;
load normalized_GYM_Weight_sholders;
load normalized_GYM_Weight_triceps;
load normalized_GYM_Weight_workout;
load normalized_Washes_dishes;
load normalized_BedMaking;
load normalized_In_Dressing;
load normalized_Sweeping;
load normalized_Typing_on_keybord;
load normalized_Washing_Hands;
load normalized_Reading;
load normalized_Rowing;
load normalized_Writting_on_Paper
load normalized_Wiping;
load normalized_Dancing;
load normalized_Out_dressing;
load normalized_Praying;
load normalized_Shaking_dust;



ratio_train = 0.7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
N_class1 = size(normalized_Flipping,1);
N_class2 = size(normalized_Drawing,1);
N_class3 = size(normalized_cycle,1);
N_class4 = size(normalized_Cutting_Components,1);
N_class5 = size(normalized_Running,1);
N_class6 = size(normalized_Driving_Manual,1);
N_class7 = size(normalized_Eat_with_hand,1);
N_class8 = size(normalized_Playing_on_Guitar,1);
N_class9 = size(normalized_GYM_Weight_Back,1);
N_class10 = size(normalized_GYM_Weight_bieceps,1);
N_class11 = size(normalized_GYM_Weight_chest,1);
N_class12 = size(normalized_GYM_Weight_sholders,1);
N_class13 = size(normalized_GYM_Weight_triceps,1);
N_class14 = size(normalized_GYM_Weight_workout,1);
N_class15 = size(normalized_Washes_dishes,1);
N_class16 = size(normalized_BedMaking,1);
N_class17 = size(normalized_In_Dressing,1);
N_class18 = size(normalized_Sweeping,1);
N_class19 = size(normalized_Typing_on_keybord,1);
N_class20 = size(normalized_Washing_Hands,1);
N_class21 = size(normalized_Reading,1);
N_class22= size(normalized_Rowing,1);
N_class23= size(normalized_Writting_on_Paper,1);
N_class24= size(normalized_Wiping,1);
N_class25= size(normalized_Dancing,1);
N_class26= size(normalized_Out_dressing,1);
N_class27= size(normalized_Praying,1);
N_class28= size(normalized_Shaking_dust,1);

%%%%%%%%%%%%%%%%%%%%%%%%%% Auto correlation %%%%%%%%%%%%%%%%%%%%%%%

min  = [-3.1416,   -1.5689,   -3.1416,  -32.7541,  -40.2537,  -22.3596 ,  -1.0000,   -1.0000,   -1.0000,  -12.7974,  -10.9556,   -7.4717];
max = [ 3.1416,    1.5657,    3.1416,   39.6696,   21.8054 ,  17.5581,    1.0000,    1.0000,   1.0000,    5.3830,   10.7448,    6.9970];


for i = 1:N_class1
    for j = 1:6
      un_normalized_Flipping{i,1}(j,:)= min (j) + normalized_Flipping{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Flipping{i,1}(j-3,:)= min (j) + normalized_Flipping{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class2
     for j = 1:6
      un_normalized_Drawing{i,1}(j,:)= min (j) + normalized_Drawing{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Drawing{i,1}(j-3,:)= min (j) + normalized_Drawing{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class3
     for j = 1:6
      un_normalized_cycle{i,1}(j,:)= min (j) + normalized_cycle{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_cycle{i,1}(j-3,:)= min (j) + normalized_cycle{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class4
    for j = 1:6
      un_normalized_Cutting_Components{i,1}(j,:)= min (j) + normalized_Cutting_Components{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Cutting_Components{i,1}(j-3,:)= min (j) + normalized_Cutting_Components{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class5
     for j = 1:6
      un_normalized_Running{i,1}(j,:)= min (j) + normalized_Running{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Running{i,1}(j-3,:)= min (j) + normalized_Running{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class6
    for j = 1:6
      un_normalized_Driving_Manual{i,1}(j,:)= min (j) + normalized_Driving_Manual{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Driving_Manual{i,1}(j-3,:)= min (j) + normalized_Driving_Manual{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class7
    for j = 1:6
      un_normalized_Eat_with_hand{i,1}(j,:)= min (j) + normalized_Eat_with_hand{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Eat_with_hand{i,1}(j-3,:)= min (j) + normalized_Eat_with_hand{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class8
    for j = 1:6
      un_normalized_Playing_on_Guitar{i,1}(j,:)= min (j) + normalized_Playing_on_Guitar{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Playing_on_Guitar{i,1}(j-3,:)= min (j) + normalized_Playing_on_Guitar{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class9
     for j = 1:6
      un_normalized_GYM_Weight_Back{i,1}(j,:)= min (j) + normalized_GYM_Weight_Back{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_GYM_Weight_Back{i,1}(j-3,:)= min (j) + normalized_GYM_Weight_Back{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class10
    for j = 1:6
      un_normalized_GYM_Weight_bieceps{i,1}(j,:)= min (j) + normalized_GYM_Weight_bieceps{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_GYM_Weight_bieceps{i,1}(j-3,:)= min (j) + normalized_GYM_Weight_bieceps{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class11
    for j = 1:6
      un_normalized_GYM_Weight_chest{i,1}(j,:)= min (j) + normalized_GYM_Weight_chest{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_GYM_Weight_chest{i,1}(j-3,:)= min (j) + normalized_GYM_Weight_chest{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class12
     for j = 1:6
      un_normalized_GYM_Weight_sholders{i,1}(j,:)= min (j) + normalized_GYM_Weight_sholders{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_GYM_Weight_sholders{i,1}(j-3,:)= min (j) + normalized_GYM_Weight_sholders{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class13
    for j = 1:6
      un_normalized_GYM_Weight_triceps{i,1}(j,:)= min (j) + normalized_GYM_Weight_triceps{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_GYM_Weight_triceps{i,1}(j-3,:)= min (j) + normalized_GYM_Weight_triceps{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class14
     for j = 1:6
      un_normalized_GYM_Weight_workout{i,1}(j,:)= min (j) + normalized_GYM_Weight_workout{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_GYM_Weight_workout{i,1}(j-3,:)= min (j) + normalized_GYM_Weight_workout{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class15
     for j = 1:6
      un_normalized_Washes_dishes{i,1}(j,:)= min (j) + normalized_Washes_dishes{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Washes_dishes{i,1}(j-3,:)= min (j) + normalized_Washes_dishes{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class16
     for j = 1:6
      un_normalized_BedMaking{i,1}(j,:)= min (j) + normalized_BedMaking{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_BedMaking{i,1}(j-3,:)= min (j) + normalized_BedMaking{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class17
    for j = 1:6
      un_normalized_In_Dressing{i,1}(j,:)= min (j) + normalized_In_Dressing{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_In_Dressing{i,1}(j-3,:)= min (j) + normalized_In_Dressing{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class18
    for j = 1:6
      un_normalized_Sweeping{i,1}(j,:)= min (j) + normalized_Sweeping{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Sweeping{i,1}(j-3,:)= min (j) + normalized_Sweeping{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class19
    for j = 1:6
      un_normalized_Typing_on_keybord{i,1}(j,:)= min (j) + normalized_Typing_on_keybord{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Typing_on_keybord{i,1}(j-3,:)= min (j) + normalized_Typing_on_keybord{i,1}(j,:) * (max(j) - min(j));
    end
end
for i = 1:N_class20
    for j = 1:6
      un_normalized_Washing_Hands{i,1}(j,:)= min (j) + normalized_Washing_Hands{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Washing_Hands{i,1}(j-3,:)= min (j) + normalized_Washing_Hands{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class21
    for j = 1:6
      un_normalized_Reading{i,1}(j,:)= min (j) + normalized_Reading{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Reading{i,1}(j-3,:)= min (j) + normalized_Reading{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class22
    for j = 1:6
      un_normalized_Rowing{i,1}(j,:)= min (j) + normalized_Rowing{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Rowing{i,1}(j-3,:)= min (j) + normalized_Rowing{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class23
    for j = 1:6
      un_normalized_Writting_on_Paper{i,1}(j,:)= min (j) + normalized_Writting_on_Paper{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Writting_on_Paper{i,1}(j-3,:)= min (j) + normalized_Writting_on_Paper{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class24
    for j = 1:6
      un_normalized_Wiping{i,1}(j,:)= min (j) + normalized_Wiping{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Wiping{i,1}(j-3,:)= min (j) + normalized_Wiping{i,1}(j,:) * (max(j) - min(j));
    end
end


for i = 1:N_class25
    for j = 1:6
      un_normalized_Dancing{i,1}(j,:)= min (j) + normalized_Dancing{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Dancing{i,1}(j-3,:)= min (j) + normalized_Dancing{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class26
    for j = 1:6
      un_normalized_Out_dressing{i,1}(j,:)= min (j) + normalized_Out_dressing{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Out_dressing{i,1}(j-3,:)= min (j) + normalized_Out_dressing{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class27
    for j = 1:6
      un_normalized_Praying{i,1}(j,:)= min (j) + normalized_Praying{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Praying{i,1}(j-3,:)= min (j) + normalized_Praying{i,1}(j,:) * (max(j) - min(j));
    end
end

for i = 1:N_class28
    for j = 1:6
      un_normalized_Shaking_dust{i,1}(j,:)= min (j) + normalized_Shaking_dust{i,1}(j,:) * (max(j) - min(j));
    end
    for j = 10:12
      un_normalized_Shaking_dust{i,1}(j-3,:)= min (j) + normalized_Shaking_dust{i,1}(j,:) * (max(j) - min(j));
    end
end


Flipping_autoCorr = {};
Drawing_autoCorr = {};
cycle_autoCorr = {};
Cutting_Components_autoCorr = {};
Running_autoCorr = {};
Driving_Manual_autoCorr = {};
Eat_with_hand_autoCorr = {};
Playing_Guitar_autoCorr = {};
Weight_Back_autoCorr = {};
Weight_bieceps_autoCorr = {};
Weight_chest_autoCorr = {};
Weight_sholders_autoCorr = {};
Weight_triceps_autoCorr = {};
Weight_workout_autoCorr = {};
Washes_dishes_autoCorr = {};
BedMaking_autoCorr = {};
In_Dressing_autoCorr = {};
Sweeping_autoCorr = {};
Typing_on_keybord_autoCorr = {};
Washing_Hands_autoCorr = {};
Reading_autoCorr = {};
Rowing_autoCorr = {};
Writting_on_Paper_autoCorr = {};
Wiping_autoCorr = {};
Dancing_autoCorr = {};
Out_dressing_autoCorr = {};
Praying_autoCorr = {};
Shaking_dust_autoCorr = {};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:N_class1
    for j = 1:9
    %Flipping_autoCorr{i,1}(j,:) =autocorr(normalized_Flipping{i,1}(j,:),20);
    Flipping_autoCorr{i,1}(j,:) = horzcat(autocorr(un_normalized_Flipping{i,1}(j,:),20), median(un_normalized_Flipping{i,1}(j,:))); %autocorr(normalized_Flipping{i,1}(j,:),20);
    end
end
for i = 1:N_class2
    for j = 1:9
    %Drawing_autoCorr{i,1}(j,:) =autocorr(normalized_Drawing{i,1}(j,:),20);
     Drawing_autoCorr{i,1}(j,:) = horzcat(autocorr(un_normalized_Drawing{i,1}(j,:),20), median(un_normalized_Drawing{i,1}(j,:))); %autocorr(normalized_Drawing{i,1}(j,:),20);
    end
end
for i = 1:N_class3
    for j = 1:9
   % cycle_autoCorr{i,1}(j,:) =autocorr(normalized_cycle{i,1}(j,:),20);
     cycle_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_cycle{i,1}(j,:),20), median(un_normalized_cycle{i,1}(j,:)));     %autocorr(normalized_cycle{i,1}(j,:),20);
    end
end
for i = 1:N_class4
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Cutting_Components_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Cutting_Components{i,1}(j,:),20), median(un_normalized_Cutting_Components{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class5
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Running_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Running{i,1}(j,:),20), median(un_normalized_Running{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class6
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Driving_Manual_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Driving_Manual{i,1}(j,:),20), median(un_normalized_Driving_Manual{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class7
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Eat_with_hand_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Eat_with_hand{i,1}(j,:),20), median(un_normalized_Eat_with_hand{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class8
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Playing_Guitar_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Playing_on_Guitar{i,1}(j,:),20), median(un_normalized_Playing_on_Guitar{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end

for i = 1:N_class9
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Weight_Back_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_GYM_Weight_Back{i,1}(j,:),20), median(un_normalized_GYM_Weight_Back{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class10
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Weight_bieceps_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_GYM_Weight_bieceps{i,1}(j,:),20), median(un_normalized_GYM_Weight_bieceps{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class11
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Weight_chest_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_GYM_Weight_chest{i,1}(j,:),20), median(un_normalized_GYM_Weight_chest{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class12
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Weight_sholders_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_GYM_Weight_sholders{i,1}(j,:),20), median(un_normalized_GYM_Weight_sholders{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class13
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Weight_triceps_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_GYM_Weight_triceps{i,1}(j,:),20), median(un_normalized_GYM_Weight_triceps{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class14
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Weight_workout_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_GYM_Weight_workout{i,1}(j,:),20), median(un_normalized_GYM_Weight_workout{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class15
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    Washes_dishes_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Washes_dishes{i,1}(j,:),20), median(un_normalized_Washes_dishes{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class16
    for j = 1:9
  % Cutting_Components_autoCorr{i,1}(j,:) =autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    BedMaking_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_BedMaking{i,1}(j,:),20), median(un_normalized_BedMaking{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class17
    for j = 1:9
    In_Dressing_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_In_Dressing{i,1}(j,:),20), median(un_normalized_In_Dressing{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class18
    for j = 1:9
    Sweeping_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Sweeping{i,1}(j,:),20), median(un_normalized_Sweeping{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class19
    for j = 1:9
    Typing_on_keybord_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Typing_on_keybord{i,1}(j,:),20), median(un_normalized_Typing_on_keybord{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class20
    for j = 1:9
    Washing_Hands_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Washing_Hands{i,1}(j,:),20), median(un_normalized_Washing_Hands{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class21
    for j = 1:9
    Reading_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Reading{i,1}(j,:),20), median(un_normalized_Reading{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class22
    for j = 1:9
    Rowing_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Rowing{i,1}(j,:),20), median(un_normalized_Rowing{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class23
    for j = 1:9
    Writting_on_Paper_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Writting_on_Paper{i,1}(j,:),20), median(un_normalized_Writting_on_Paper{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class24
    for j = 1:9
    Wiping_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Wiping{i,1}(j,:),20), median(un_normalized_Wiping{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end


for i = 1:N_class25
    for j = 1:9
    Dancing_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Dancing{i,1}(j,:),20), median(un_normalized_Dancing{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end

for i = 1:N_class26
    for j = 1:9
    Out_dressing_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Out_dressing{i,1}(j,:),20), median(un_normalized_Out_dressing{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class27
    for j = 1:9
    Praying_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Praying{i,1}(j,:),20), median(un_normalized_Praying{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end
for i = 1:N_class28
    for j = 1:9
    Shaking_dust_autoCorr{i,1}(j,:) =  horzcat(autocorr(un_normalized_Shaking_dust{i,1}(j,:),20), median(un_normalized_Shaking_dust{i,1}(j,:)));    %autocorr(normalized_Cutting_Components{i,1}(j,:),20);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n_train1 = floor(ratio_train*size(Flipping_autoCorr,1));
n_train2 = floor(ratio_train*size(Drawing_autoCorr,1));
n_train3 = floor(ratio_train*size(cycle_autoCorr,1));
n_train4 = floor(ratio_train*size(Cutting_Components_autoCorr,1));
n_train5 = floor(ratio_train*size(Running_autoCorr,1));
n_train6 = floor(ratio_train*size(Driving_Manual_autoCorr,1));
n_train7 = floor(ratio_train*size(Eat_with_hand_autoCorr,1));
n_train8 = floor(ratio_train*size(Playing_Guitar_autoCorr,1));
n_train9 = floor(ratio_train*size(Weight_Back_autoCorr,1));
n_train10 = floor(ratio_train*size(Weight_bieceps_autoCorr,1));
n_train11 = floor(ratio_train*size(Weight_chest_autoCorr,1));
n_train12 = floor(ratio_train*size(Weight_sholders_autoCorr,1));
n_train13 = floor(ratio_train*size(Weight_triceps_autoCorr,1));
n_train14 = floor(ratio_train*size(Weight_workout_autoCorr,1));
n_train15 = floor(ratio_train*size(Washes_dishes_autoCorr,1));
n_train16 = floor(ratio_train*size(BedMaking_autoCorr,1));
n_train17 = floor(ratio_train*size(In_Dressing_autoCorr,1));
n_train18 = floor(ratio_train*size(Sweeping_autoCorr,1));
n_train19 = floor(ratio_train*size(Typing_on_keybord_autoCorr,1));
n_train20 = floor(ratio_train*size(Washing_Hands_autoCorr,1));

n_train21 = floor(ratio_train*size(Reading_autoCorr,1));
n_train22 = floor(ratio_train*size(Rowing_autoCorr,1));
n_train23 = floor(ratio_train*size(Writting_on_Paper_autoCorr,1));
n_train24 = floor(ratio_train*size(Wiping_autoCorr,1));

n_train25 = floor(ratio_train*size(Dancing_autoCorr,1));
n_train26 = floor(ratio_train*size(Out_dressing_autoCorr,1));
n_train27 = floor(ratio_train*size(Praying_autoCorr,1));
n_train28 = floor(ratio_train*size(Shaking_dust_autoCorr,1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n_train = n_train1 + n_train2 + n_train3 + n_train4 + n_train5 + n_train6 + n_train7 + n_train8 + n_train9 + n_train10 + n_train11 + n_train12 + n_train13 + n_train14 + n_train15 + n_train16 + n_train17 + n_train18 + n_train19 + n_train20 +  n_train21 + n_train22 + n_train23 + n_train24 + n_train25 + n_train26  + n_train27 + n_train28 ;

for a=1:n_train1
    new_Data_Combined{a,1}=Flipping_autoCorr{a,1};  
end
for b=1:n_train2
    new_Data_Combined{n_train1+b,1}=Drawing_autoCorr{b,1};
end
for c=1:n_train3
    new_Data_Combined{n_train1+n_train2+ c,1}=cycle_autoCorr{c,1};   
end
for d=1:n_train4
    new_Data_Combined{n_train1+n_train2+n_train3+ d,1}=Cutting_Components_autoCorr{d,1};   
end

for e=1:n_train5
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+e,1}=Running_autoCorr{e,1};   
end
for f=1:n_train6
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+f,1}=Driving_Manual_autoCorr{f,1};
end
for g=1:n_train7
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+g,1}=Eat_with_hand_autoCorr{g,1};   
end
for h=1:n_train8
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+h,1}=Playing_Guitar_autoCorr{h,1};
end

for i=1:n_train9
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+i,1}=Weight_Back_autoCorr{i,1};   
end
for j=1:n_train10
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+j,1}=Weight_bieceps_autoCorr{j,1};
end
for k=1:n_train11
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+k,1}=Weight_chest_autoCorr{k,1};   
end
for l=1:n_train12
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+l,1}=Weight_sholders_autoCorr{l,1};
end
for m=1:n_train13
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+m,1}=Weight_triceps_autoCorr{m,1};   
end
for n=1:n_train14
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n,1}=Weight_workout_autoCorr{n,1};
end
for o=1:n_train15
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+o,1}=Washes_dishes_autoCorr{o,1};    
end
for p=1:n_train16
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+p,1}=BedMaking_autoCorr{p,1};
end

for q=1:n_train17
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+q,1}=In_Dressing_autoCorr{q,1};    
end
for s=1:n_train18
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+s,1}=Sweeping_autoCorr{s,1};
end
for t=1:n_train19
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+t,1}=Typing_on_keybord_autoCorr{t,1};
end
for u=1:n_train20
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+u,1}=Washing_Hands_autoCorr{u,1};
end

for v=1:n_train21
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+v,1}=Reading_autoCorr{v,1}; 
end
for w=1:n_train22
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+w,1}=Rowing_autoCorr{w,1};
end
for x=1:n_train23
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+x,1}=Writting_on_Paper_autoCorr{x,1};
end
for y=1:n_train24
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+y,1}=Wiping_autoCorr{y,1};
end
for z=1:n_train25
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+z,1}=Dancing_autoCorr{z,1};
end
for r=1:n_train26
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+r,1}=Out_dressing_autoCorr{r,1};
end
for A=1:n_train27
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+n_train26+A,1}=Praying_autoCorr{A,1};
end
for B=1:n_train28
    new_Data_Combined{n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+n_train26+n_train27+B,1}=Shaking_dust_autoCorr{B,1};
end
      

Y=[];
for V=1:n_train
    if V < n_train1+1
        Y(V,1)= 1;
    elseif (V > n_train1)&&(V < n_train1+n_train2+1)
        Y(V,1)= 2;
    elseif (V > n_train1+n_train2)&&(V < n_train1+n_train2+n_train3+1)
        Y(V,1)= 3;
    elseif (V > n_train1+n_train2+n_train3)&&(V < n_train1+n_train2+n_train3+n_train4+1)
        Y(V,1)= 4;
    elseif (V > n_train1+n_train2+n_train3+n_train4)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+1)
        Y(V,1)= 5; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+1)
        Y(V,1)= 6; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+1)
        Y(V,1)= 7; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+1)
        Y(V,1)= 8; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+1)
        Y(V,1)= 9; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+1)
        Y(V,1)= 10; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+1)
        Y(V,1)= 11; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+1)
        Y(V,1)= 12; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+1)
        Y(V,1)= 13; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+1)
        Y(V,1)= 14; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+1)
        Y(V,1)= 15;   
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+1)
        Y(V,1)= 16; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+1)
        Y(V,1)= 17; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+1)
        Y(V,1)= 18; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+1)
        Y(V,1)= 19; 
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+1)
        Y(V,1)= 20;
     elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+1)
        Y(V,1)= 21;
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+1)
        Y(V,1)= 22;
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+1)
        Y(V,1)= 23;
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+1)
        Y(V,1)= 24;
     elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+1)
        Y(V,1)= 25;
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+n_train26+1)
        Y(V,1)= 26;
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+n_train26)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+n_train26+n_train27+1)
        Y(V,1)= 27;
    elseif (V > n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+n_train26+n_train27)&&(V < n_train1+n_train2+n_train3+n_train4+n_train5+n_train6+n_train7+n_train8+n_train9+n_train10+n_train11+n_train12+n_train13+n_train14+n_train15+n_train16+n_train17+n_train18+n_train19+n_train20+n_train21+n_train22+n_train23+n_train24+n_train25+n_train26+n_train27+n_train28+1)
        Y(V,1)= 28;
    end
end

 
Y = categorical(Y);

% % figure
% % for i = 1:12
% %     subplot(12,1,13-i)
% %     plot(normalized_Flipping{1}(i,:));
% %     % plot(normalized_Drawing{1}(i,:));
% %     % plot(normalized_Cycle{1}(i,:));
% %     ylabel(i) 
% %     xticklabels('')
% %     yticklabels('')
% %     box off
% % end
% % title("Training Observation 1")
% % subplot(12,1,12)
% % xticklabels('auto')
% % xlabel("Time Step")

numObservations = numel(new_Data_Combined);
for i=1:numObservations
    sequence = new_Data_Combined{i};
    sequenceLengths(i) = size(sequence,2);
end

[sequenceLengths,idx] = sort(sequenceLengths);
new_Data_Combined_sorted = new_Data_Combined(idx);
Y_sorted=Y(idx);

inputSize = 9;
outputSize = 70;
%outputSize = 100;
outputMode = 'last';
numClasses = 28;

layers = [ ...
    sequenceInputLayer(inputSize)
    lstmLayer(outputSize,'OutputMode',outputMode)
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer];

%maxEpochs = 150;
maxEpochs = 150;
miniBatchSize = 50;
%miniBatchSize = 100;
shuffle = 'every-epoch';
%shuffle = 'never';
 %shuffle = 'once';

options = trainingOptions('sgdm', ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'Shuffle', shuffle);

net = trainNetwork(new_Data_Combined_sorted,Y_sorted,layers,options);
%%net = trainNetwork(new_Data_Combined,Y,layers,options);

%ratio_test = 0.25;
ratio_test = 0.3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
n_test1 = floor(ratio_test*size(Flipping_autoCorr,1));
n_test2 = floor(ratio_test*size(Drawing_autoCorr,1));
n_test3 = floor(ratio_test*size(cycle_autoCorr,1));
n_test4 = floor(ratio_test*size(Cutting_Components_autoCorr,1));
n_test5 = floor(ratio_test*size(Running_autoCorr,1));
n_test6 = floor(ratio_test*size(Driving_Manual_autoCorr,1));
n_test7 = floor(ratio_test*size(Eat_with_hand_autoCorr,1));
n_test8 = floor(ratio_test*size(Playing_Guitar_autoCorr,1));
n_test9 = floor(ratio_test*size(Weight_Back_autoCorr,1));
n_test10 = floor(ratio_test*size(Weight_bieceps_autoCorr,1));
n_test11 = floor(ratio_test*size(Weight_chest_autoCorr,1));
n_test12 = floor(ratio_test*size(Weight_sholders_autoCorr,1));
n_test13 = floor(ratio_test*size(Weight_triceps_autoCorr,1));
n_test14 = floor(ratio_test*size(Weight_workout_autoCorr,1));
n_test15 = floor(ratio_test*size(Washes_dishes_autoCorr,1));
n_test16 = floor(ratio_test*size(BedMaking_autoCorr,1));
n_test17 = floor(ratio_test*size(In_Dressing_autoCorr,1));
n_test18 = floor(ratio_test*size(Sweeping_autoCorr,1));
n_test19 = floor(ratio_test*size(Typing_on_keybord_autoCorr,1));
n_test20 = floor(ratio_test*size(Washing_Hands_autoCorr,1));
   
n_test21 = floor(ratio_test*size(Reading_autoCorr,1));
n_test22 = floor(ratio_test*size(Rowing_autoCorr,1));
n_test23 = floor(ratio_test*size(Writting_on_Paper_autoCorr,1));
n_test24 = floor(ratio_test*size(Wiping_autoCorr,1));

n_test25 = floor(ratio_test*size(Dancing_autoCorr,1));
n_test26 = floor(ratio_test*size(Out_dressing_autoCorr,1));
n_test27 = floor(ratio_test*size(Praying_autoCorr,1));
n_test28 = floor(ratio_test*size(Shaking_dust_autoCorr,1));



n_test = n_test1 + n_test2 + n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+n_test27+n_test28;
for a= 1 : n_test1
    X_tset{a,1}=Flipping_autoCorr{a,1};  
%     X_tset{a,1}=Flipping_autoCorr{n_train1+a,1}; 
end
for b=1:n_test2
   X_tset{n_test1+b,1}=Drawing_autoCorr{b,1};
%    X_tset{n_test1+b,1}=Drawing_autoCorr{n_train2+b,1};
end
for c=1:n_test3
    X_tset{n_test1+n_test2+ c,1}=cycle_autoCorr{c,1};   
%     X_tset{n_test1+n_test2+ c,1}=cycle_autoCorr{n_train3+c,1};  
end
for d=1:n_test4
    X_tset{n_test1+n_test2+n_test3+ d,1}=Cutting_Components_autoCorr{d,1};   
%     X_tset{n_test1+n_test2+n_test3+d,1}=Cutting_Components_autoCorr{n_train4+d,1};
end

for e=1:n_test5
    X_tset{n_test1+n_test2+n_test3+n_test4+e,1}=Running_autoCorr{e,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+e,1}=Running_autoCorr{n_train5+e,1};  
end
for f=1:n_test6
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+f,1}=Driving_Manual_autoCorr{f,1};
%      X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+f,1}=Driving_Manual_autoCorr{n_train6+f,1};
end
for g=1:n_test7
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+g,1}=Eat_with_hand_autoCorr{g,1};  
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+g,1}=Eat_with_hand_autoCorr{n_train7+g,1};   
end
for h=1:n_test8
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+h,1}=Playing_Guitar_autoCorr{h,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+h,1}=Playing_Guitar_autoCorr{n_train8+h,1};
end

for i=1:n_test9
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+i,1}=Weight_Back_autoCorr{i,1};   
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+i,1}=Weight_Back_autoCorr{n_train9+i,1};   

end
for j=1:n_test10
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+j,1}=Weight_bieceps_autoCorr{j,1};
%      X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+j,1}=Weight_bieceps_autoCorr{n_train10+j,1};
end
for k=1:n_test11
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+k,1}=Weight_chest_autoCorr{k,1};  
%      X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+k,1}=Weight_chest_autoCorr{n_train11+k,1};   

end
for l=1:n_test12
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+l,1}=Weight_sholders_autoCorr{l,1};
%      X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+l,1}=Weight_sholders_autoCorr{n_train12+l,1};
end

for m=1:n_test13
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+m,1}=Weight_triceps_autoCorr{m,1};   
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+m,1}=Weight_triceps_autoCorr{n_train13+m,1};   

end
for n=1:n_test14
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n,1}=Weight_workout_autoCorr{n,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n,1}=Weight_workout_autoCorr{n_train14+n,1};

end
for o=1:n_test15
   X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+o,1}=Washes_dishes_autoCorr{o,1};    
%      X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+o,1}=Washes_dishes_autoCorr{n_train15+o,1};    

end
for p=1:n_test16
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+p,1}=BedMaking_autoCorr{p,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+p,1}=BedMaking_autoCorr{n_train16+p,1};

end

for q=1:n_test17
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+q,1}=In_Dressing_autoCorr{q,1};    
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+q,1}=In_Dressing_autoCorr{n_train17+q,1};    

end
for s=1:n_test18
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+s,1}=Sweeping_autoCorr{s,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+s,1}=Sweeping_autoCorr{n_train18+s,1};

end
for t=1:n_test19
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+t,1}=Typing_on_keybord_autoCorr{t,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+t,1}=Typing_on_keybord_autoCorr{n_train19+t,1};

end
for u=1:n_test20
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+u,1}=Washing_Hands_autoCorr{u,1};
%      X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+u,1}=Washing_Hands_autoCorr{n_train20+u,1};

end

for v=1:n_test21
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+v,1}=Reading_autoCorr{v,1}; 
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+v,1}=Reading_autoCorr{n_train21+v,1}; 

end
for w=1:n_test22
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+w,1}=Rowing_autoCorr{w,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+w,1}=Rowing_autoCorr{n_train22+w,1};
end
for x=1:n_test23
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+x,1}=Writting_on_Paper_autoCorr{x,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+x,1}=Writting_on_Paper_autoCorr{n_train23+x,1};

end
for y=1:n_test24
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+y,1}=Wiping_autoCorr{y,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+y,1}=Wiping_autoCorr{n_train24+y,1};
end

for z=1:n_test25
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+z,1}=Dancing_autoCorr{z,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+z,1}=Dancing_autoCorr{n_train25+z,1};

end
for r=1:n_test26
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+r,1}=Out_dressing_autoCorr{r,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+r,1}=Out_dressing_autoCorr{n_train26+r,1};

end
for A=1:n_test27
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+A,1}=Praying_autoCorr{A,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+A,1}=Praying_autoCorr{n_train27+A,1};

end
for B=1:n_test28
    X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+n_test27+B,1}=Shaking_dust_autoCorr{B,1};
%     X_tset{n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+n_test27+B,1}=Shaking_dust_autoCorr{n_train28+B,1};
end

% % Dancing_autoCorr = {};
% % Out_dressing_autoCorr = {};
% % Praying_autoCorr = {};
% % Shaking_dust_autoCorr = {};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Y_test=[];
for P=1:n_test
    if P<n_test1+1
        Y_test(P,1)= 1;
    elseif (P> n_test1)&&(P < n_test1+n_test2+1)
        Y_test(P,1)= 2;
    elseif (P> n_test1+n_test2)&&(P < n_test1+n_test2+n_test3+1)
        Y_test(P,1)= 3;
    elseif (P> n_test1+n_test2+n_test3)&&(P < n_test1+n_test2+n_test3+n_test4+1)
        Y_test(P,1)= 4;
    elseif (P> n_test1+n_test2+n_test3+n_test4)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+1)
        Y_test(P,1)= 5;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+1)
        Y_test(P,1)= 6;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+1)
        Y_test(P,1)= 7;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+1)
        Y_test(P,1)= 8;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+1)
        Y_test(P,1)= 9;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+1)
        Y_test(P,1)= 10;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+1)
        Y_test(P,1)= 11;  
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+1)
        Y_test(P,1)= 12; 
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+1)
        Y_test(P,1)= 13; 
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+1)
        Y_test(P,1)= 14; 
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+1)
        Y_test(P,1)= 15; 
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+1)
        Y_test(P,1)= 16;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+1)
        Y_test(P,1)= 17;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+1)
        Y_test(P,1)= 18;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+1)
        Y_test(P,1)= 19;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+1)
        Y_test(P,1)= 20;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+1)
        Y_test(P,1)= 21;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+1)
        Y_test(P,1)= 22;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+1)
        Y_test(P,1)= 23;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+1)
        Y_test(P,1)= 24;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+1)
        Y_test(P,1)= 25;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+1)
        Y_test(P,1)= 26;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+n_test27+1)
        Y_test(P,1)= 27;
    elseif (P> n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+n_test27)&&(P < n_test1+n_test2+n_test3+n_test4+n_test5+n_test6+n_test7+n_test8+n_test9+n_test10+n_test11+n_test12+n_test13+n_test14+n_test15+n_test16+n_test17+n_test18+n_test19+n_test20+n_test21+n_test22+n_test23+n_test24+n_test25+n_test26+n_test27+n_test28+1)
        Y_test(P,1)= 28;
    end
end  

    Y_test = categorical(Y_test);   % error here Y_test = 500; X_test = 513, numObservationsTest = 513

    numObservationsTest = numel(X_tset);
for i=1:numObservationsTest
    sequence = X_tset{i};
    sequenceLengthsTest(i) = size(sequence,2);
end
% [sequenceLengthsTest,idx] = sort(sequenceLengthsTest);
% X_tset = X_tset(idx);
% Y_test = Y_test(idx);
    
%miniBatchSize = 60;
miniBatchSize = 30;
YPred = classify(net,X_tset, ...
    'MiniBatchSize',miniBatchSize);

Accuracy_total = sum(YPred == Y_test)./numel(Y_test)
Confusion_matrix = confusionmat(Y_test,YPred)

n_total_test = numObservationsTest;


TP1=0;TP2=0;TP3=0;TP4=0;TP5=0;TP6=0;TP7=0;TP8=0;TP9=0;TP10=0;TP11=0;TP12=0;TP13=0;TP14=0;TP15=0;TP16=0;TP17=0;TP18=0;TP19=0;TP20=0;TP21=0;TP22=0;TP23=0;TP24=0;TP25=0;TP26=0;TP27=0;TP28=0;
TN1=0;TN2=0;TN3=0;TN4=0;TN5=0;TN6=0;TN7=0;TN8=0;TN9=0;TN10=0;TN11=0;TN12=0;TN13=0;TN14=0;TN15=0;TN16=0;TN17=0;TN18=0;TN19=0;TN20=0;TN21=0;TN22=0;TN23=0;TN24=0;TN25=0;TN26=0;TN27=0;TN28=0;
FN1=0;FN2=0;FN3=0;FN4=0;FN5=0;FN6=0;FN7=0;FN8=0;FN9=0;FN10=0;FN11=0;FN12=0;FN13=0;FN14=0;FN15=0;FN16=0;FN17=0;FN18=0;FN19=0;FN20=0;FN21=0;FN22=0;FN23=0;FN24=0;FN25=0;FN26=0;FN27=0;FN28=0;
FP1=0;FP2=0;FP3=0;FP4=0;FP5=0;FP6=0;FP7=0;FP8=0;FP9=0;FP10=0;FP11=0;FP12=0;FP13=0;FP14=0;FP15=0;FP16=0;FP17=0;FP18=0;FP19=0;FP20=0;FP21=0;FP22=0;FP23=0;FP24=0;FP25=0;FP26=0;FP27=0;FP28=0;


for P=1:n_total_test
    %%%%%%%%%%%%% TP %%%%%%%%%%%
    if (Y_test(P,1) == '1') && (YPred(P,1) =='1')
        TP1 =TP1+1;
    end
    if (Y_test(P,1) == '2') && (YPred(P,1) =='2')
        TP2 =TP2+1;
    end
    if (Y_test(P,1) == '3') && (YPred(P,1) =='3')
        TP3 =TP3+1;
    end
    if (Y_test(P,1) == '4') && (YPred(P,1) =='4')
        TP4 =TP4+1;
    end
    if (Y_test(P,1) == '5') && (YPred(P,1) =='5')
        TP5 =TP5+1;
    end
    if (Y_test(P,1) == '6') && (YPred(P,1) =='6')
        TP6 =TP6+1;
    end
    if (Y_test(P,1) == '7') && (YPred(P,1) =='7')
        TP7 =TP7+1;
    end
    if (Y_test(P,1) == '8') && (YPred(P,1) =='8')
        TP8 =TP8+1;
    end
    if (Y_test(P,1) == '9') && (YPred(P,1) =='9')
        TP9 =TP9+1;
    end
    if (Y_test(P,1) == '10') && (YPred(P,1) =='10')
        TP10 =TP10+1;
    end
    if (Y_test(P,1) == '11') && (YPred(P,1) =='11')
        TP11 =TP11+1;
    end
    if (Y_test(P,1) == '12') && (YPred(P,1) =='12')
        TP12 =TP12+1;
    end
    if (Y_test(P,1) == '13') && (YPred(P,1) =='13')
        TP13 =TP13+1;
    end
    if (Y_test(P,1) == '14') && (YPred(P,1) =='14')
        TP14 =TP14+1;
    end
    if (Y_test(P,1) == '15') && (YPred(P,1) =='15')
        TP15 =TP15+1;
    end
    if (Y_test(P,1) == '16') && (YPred(P,1) =='16')
        TP16 =TP16+1;
    end
    if (Y_test(P,1) == '17') && (YPred(P,1) =='17')
        TP17 =TP17+1;
    end
    if (Y_test(P,1) == '18') && (YPred(P,1) =='18')
        TP18 =TP18+1;
    end
    if (Y_test(P,1) == '19') && (YPred(P,1) =='19')
        TP19 =TP19+1;
    end
    if (Y_test(P,1) == '20') && (YPred(P,1) =='20')
        TP20 =TP20+1;
    end
    if (Y_test(P,1) == '21') && (YPred(P,1) =='21')
        TP21 =TP21+1;
    end
    if (Y_test(P,1) == '22') && (YPred(P,1) =='22')
        TP22 =TP22+1;
    end
    if (Y_test(P,1) == '23') && (YPred(P,1) =='23')
        TP23 =TP23+1;
    end
    if (Y_test(P,1) == '24') && (YPred(P,1) =='24')
        TP24 =TP24+1;
    end
    if (Y_test(P,1) == '25') && (YPred(P,1) =='25')
        TP25 =TP25+1;
    end   
    if (Y_test(P,1) == '26') && (YPred(P,1) =='26')
        TP26 =TP26+1;
    end
    if (Y_test(P,1) == '27') && (YPred(P,1) =='27')
        TP27 =TP27+1;
    end
    if (Y_test(P,1) == '28') && (YPred(P,1) =='28')
        TP28 =TP28+1;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% TN %%%%%%%%%%%%%%
    if (Y_test(P,1) ~= '1') && (YPred(P,1) ~='1')
        TN1 = TN1+1;
    end
    if (Y_test(P,1) ~= '2') && (YPred(P,1) ~='2')
        TN2 = TN2+1;
    end
    if (Y_test(P,1) ~= '3') && (YPred(P,1) ~='3')
        TN3 = TN3+1;
    end
    if (Y_test(P,1) ~= '4') && (YPred(P,1) ~='4')
        TN4 = TN4+1;
    end
    if (Y_test(P,1) ~= '5') && (YPred(P,1) ~='5')
        TN5 = TN5+1;
    end
    if (Y_test(P,1) ~= '6') && (YPred(P,1) ~='6')
        TN6 = TN6+1;
    end
    if (Y_test(P,1) ~= '7') && (YPred(P,1) ~='7')
        TN7 = TN7+1;
    end
    if (Y_test(P,1) ~= '8') && (YPred(P,1) ~='8')
        TN8 = TN8+1;
    end
    if (Y_test(P,1) ~= '9') && (YPred(P,1) ~='9')
        TN9 = TN9+1;
    end
    if (Y_test(P,1) ~= '10') && (YPred(P,1) ~='10')
        TN10 = TN10+1;
    end
    if (Y_test(P,1) ~= '11') && (YPred(P,1) ~='11')
        TN11 = TN11+1;
    end
    if (Y_test(P,1) ~= '12') && (YPred(P,1) ~='12')
        TN12 = TN12+1;
    end
    if (Y_test(P,1) ~= '13') && (YPred(P,1) ~='13')
        TN13 = TN13+1;
    end
    if (Y_test(P,1) ~= '14') && (YPred(P,1) ~='14')
        TN14 = TN14+1;
    end
    if (Y_test(P,1) ~= '15') && (YPred(P,1) ~='15')
        TN15 = TN15+1;
    end
    if (Y_test(P,1) ~= '16') && (YPred(P,1) ~='16')
        TN16 = TN16+1;
    end
    if (Y_test(P,1) ~= '17') && (YPred(P,1) ~='17')
        TN17 = TN17+1;
    end
    if (Y_test(P,1) ~= '18') && (YPred(P,1) ~='18')
        TN18 = TN18+1;
    end
    if (Y_test(P,1) ~= '19') && (YPred(P,1) ~='19')
        TN19 = TN19+1;
    end
    if (Y_test(P,1) ~= '20') && (YPred(P,1) ~='20')
        TN20 = TN20+1;
    end
    if (Y_test(P,1) ~= '21') && (YPred(P,1) ~='21')
        TN21 = TN21+1;
    end
    if (Y_test(P,1) ~= '22') && (YPred(P,1) ~='22')
        TN22 = TN22+1;
    end
    if (Y_test(P,1) ~= '23') && (YPred(P,1) ~='23')
        TN23 = TN23+1;
    end
    if (Y_test(P,1) ~= '24') && (YPred(P,1) ~='24')
        TN24 = TN24+1;
    end
    if (Y_test(P,1) ~= '25') && (YPred(P,1) ~='25')
        TN25 = TN25+1;
    end
    if (Y_test(P,1) ~= '26') && (YPred(P,1) ~='26')
        TN26 = TN26+1;
    end
    if (Y_test(P,1) ~= '27') && (YPred(P,1) ~='27')
        TN27 = TN27+1;
    end
    if (Y_test(P,1) ~= '28') && (YPred(P,1) ~='28')
        TN28 = TN28+1;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% FN1 %%%%%%%%%%%%%%
    if (Y_test(P,1) == '1') && (YPred(P,1) ~='1')
        FN1 =FN1+1;
    end
    if (Y_test(P,1) == '2') && (YPred(P,1) ~='2')
        FN2 = FN2+1;
    end
    if (Y_test(P,1) == '3') && (YPred(P,1) ~='3')
        FN3 = FN3+1;
    end
    if (Y_test(P,1) == '4') && (YPred(P,1) ~='4')
        FN4 = FN4+1;
    end
    if (Y_test(P,1) == '5') && (YPred(P,1) ~='5')
        FN5 = FN5+1;
    end
    if (Y_test(P,1) == '6') && (YPred(P,1) ~='6')
        FN6 = FN6+1;
    end
    if (Y_test(P,1) == '7') && (YPred(P,1) ~='7')
        FN7 = FN7+1;
    end
    if (Y_test(P,1) == '8') && (YPred(P,1) ~='8')
        FN8 = FN8+1;
    end 
    if (Y_test(P,1) == '9') && (YPred(P,1) ~='9')
        FN9 = FN9+1;
    end
    if (Y_test(P,1) == '10') && (YPred(P,1) ~='10')
        FN10 = FN10+1;
    end
    if (Y_test(P,1) == '11') && (YPred(P,1) ~='11')
        FN11 = FN11+1;
    end
    if (Y_test(P,1) == '12') && (YPred(P,1) ~='12')
        FN12 = FN12+1;
    end
    if (Y_test(P,1) == '13') && (YPred(P,1) ~='13')
        FN13 = FN13+1;
    end   
    if (Y_test(P,1) == '14') && (YPred(P,1) ~='14')
        FN14 = FN14+1;
    end
    if (Y_test(P,1) == '15') && (YPred(P,1) ~='15')
        FN15 = FN15+1;
    end
    if (Y_test(P,1) == '16') && (YPred(P,1) ~='16')
        FN16 = FN16+1;
    end
    if (Y_test(P,1) == '17') && (YPred(P,1) ~='17')
        FN17 = FN17+1;
    end
    if (Y_test(P,1) == '18') && (YPred(P,1) ~='18')
        FN18 = FN18+1;
    end
    if (Y_test(P,1) == '19') && (YPred(P,1) ~='19')
        FN19 = FN19+1;
    end
    if (Y_test(P,1) == '20') && (YPred(P,1) ~='20')
        FN20 = FN20+1;
    end
    if (Y_test(P,1) == '21') && (YPred(P,1) ~='21')
        FN21 = FN21+1;
    end
    if (Y_test(P,1) == '22') && (YPred(P,1) ~='22')
        FN22 = FN22+1;
    end
    if (Y_test(P,1) == '23') && (YPred(P,1) ~='23')
        FN23 = FN23+1;
    end
    if (Y_test(P,1) == '24') && (YPred(P,1) ~='24')
        FN24 = FN24+1; 
    end
    if (Y_test(P,1) == '25') && (YPred(P,1) ~='25')
        FN25 = FN25+1;
    end
    if (Y_test(P,1) == '26') && (YPred(P,1) ~='26')
        FN26 = FN26+1;
    end
    if (Y_test(P,1) == '27') && (YPred(P,1) ~='27')
        FN27 = FN27+1;
    end
    if (Y_test(P,1) == '28') && (YPred(P,1) ~='28')
        FN28 = FN28+1;
    end
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%% FP %%%%%%%%%%%%%%
    if (Y_test(P,1) ~= '1') && (YPred(P,1) =='1')
        FP1 =FP1+1;
    end
    if (Y_test(P,1) ~= '2') && (YPred(P,1) =='2')
        FP2 =FP2+1;
    end
    if (Y_test(P,1) ~= '3') && (YPred(P,1) =='3')
        FP3 =FP3+1;
    end
    if (Y_test(P,1) ~= '4') && (YPred(P,1) =='4')
        FP4 =FP4+1;
    end
    if (Y_test(P,1) ~= '5') && (YPred(P,1) =='5')
        FP5 =FP5+1;
    end
    if (Y_test(P,1) ~= '6') && (YPred(P,1) =='6')
        FP6 =FP6+1;
    end
    if (Y_test(P,1) ~= '7') && (YPred(P,1) =='7')
        FP7 =FP7+1;
    end
    if (Y_test(P,1) ~= '8') && (YPred(P,1) =='8')
        FP8 =FP8+1;
    end
    if (Y_test(P,1) ~= '9') && (YPred(P,1) =='9')
        FP9 =FP9+1;
    end
    if (Y_test(P,1) ~= '10') && (YPred(P,1) =='10')
        FP10 =FP10+1;
    end
    if (Y_test(P,1) ~= '11') && (YPred(P,1) =='11')
        FP11 =FP11+1;
    end
    if (Y_test(P,1) ~= '12') && (YPred(P,1) =='12')
        FP12 =FP12+1;
    end
    if (Y_test(P,1) ~= '13') && (YPred(P,1) =='13')
        FP13 =FP13+1;
    end
    if (Y_test(P,1) ~= '14') && (YPred(P,1) =='14')
        FP14 =FP14+1;
    end
    if (Y_test(P,1) ~= '15') && (YPred(P,1) =='15')
        FP15 =FP15+1;
    end
    if (Y_test(P,1) ~= '16') && (YPred(P,1) =='16')
        FP16 =FP16+1;
    end
    if (Y_test(P,1) ~= '17') && (YPred(P,1) =='17')
        FP17 =FP17+1;
    end
    if (Y_test(P,1) ~= '18') && (YPred(P,1) =='18')
        FP18 =FP18+1;
    end
    if (Y_test(P,1) ~= '19') && (YPred(P,1) =='19')
        FP19 =FP19+1;
    end
    if (Y_test(P,1) ~= '20') && (YPred(P,1) =='20')
        FP20 =FP20+1;
    end
    if (Y_test(P,1) ~= '21') && (YPred(P,1) =='21')
        FP21 =FP21+1;
    end
    if (Y_test(P,1) ~= '22') && (YPred(P,1) =='22')
        FP22 =FP22+1;
    end
    if (Y_test(P,1) ~= '23') && (YPred(P,1) =='23')
        FP23 =FP23+1;
    end
    if (Y_test(P,1) ~= '24') && (YPred(P,1) =='24')
        FP24 =FP24+1;
    end
    if (Y_test(P,1) ~= '25') && (YPred(P,1) =='25')
        FP25 =FP25+1;
    end
    if (Y_test(P,1) ~= '26') && (YPred(P,1) =='26')
        FP26 =FP26+1;
    end
    if (Y_test(P,1) ~= '27') && (YPred(P,1) =='27')
        FP27 =FP27+1;
    end
    if (Y_test(P,1) ~= '28') && (YPred(P,1) =='28')
        FP28 =FP28+1;
    end
end  

Accuracy_class1 = TP1/n_test1;
Sensitivity_class1 = TP1/ n_test1;
Specifity_class1 = TN1/(n_total_test - n_test1);
Precision_class1= TP1/ sum(YPred == '1');
Prevalence_class1 = n_test1/n_total_test;

Accuracy_class2 = TP2/n_test2;
Sensitivity_class2 = TP2/ n_test2;
Specifity_class2 = TN2/(n_total_test - n_test2);
Precision_class2= TP2/ sum(YPred == '2');
Prevalence_class2 = n_test2/n_total_test;

Accuracy_class3 = TP3/n_test3;
Sensitivity_class3 = TP3/ n_test3;
Specifity_class3 = TN3/(n_total_test - n_test3);
Precision_class3= TP3/ sum(YPred == '3');
Prevalence_class3 = n_test3/n_total_test;

Accuracy_class4 = TP4/n_test4;
Sensitivity_class4 = TP4/ n_test4;
Specifity_class4 = TN4/(n_total_test - n_test4);
Precision_class4= TP4/ sum(YPred == '4');
Prevalence_class4 = n_test4/n_total_test;

Accuracy_class5 = (TP5)/n_test5;
Sensitivity_class5 = TP5/ n_test5;
Specifity_class5 = TN5/(n_total_test - n_test5);
Precision_class5= TP5/ sum(YPred == '5');
Prevalence_class5= n_test5/n_total_test;

Accuracy_class6 = (TP6)/n_test6;
Sensitivity_class6 = TP6/ n_test6;
Specifity_class6 = TN6/(n_total_test - n_test6);
Precision_class6= TP6/ sum(YPred == '6');
Prevalence_class6 = n_test6/n_total_test;

Accuracy_class7 = (TP7)/n_test7;
Sensitivity_class7 = TP7/ n_test7;
Specifity_class7 = TN7/(n_total_test - n_test7);
Precision_class7= TP7/ sum(YPred == '7');
Prevalence_class7 = n_test7/n_total_test;

Accuracy_class8 = (TP8)/n_test8;
Sensitivity_class8 = TP8/ n_test8;
Specifity_class8 = TN8/(n_total_test - n_test8);
Precision_class8= TP8/ sum(YPred == '8');
Prevalence_class8 = n_test8/n_total_test;

Accuracy_class9 = (TP9)/n_test9;
Sensitivity_class9 = TP9/ n_test9;
Specifity_class9 = TN9/(n_total_test - n_test9);
Precision_class9= TP9/ sum(YPred == '9');
Prevalence_class9 = n_test9/n_total_test;

Accuracy_class10 = (TP10)/n_test10;
Sensitivity_class10 = TP10/ n_test10;
Specifity_class10 = TN10/(n_total_test - n_test10);
Precision_class10= TP10/ sum(YPred == '10');
Prevalence_class10 = n_test10/n_total_test;

Accuracy_class11 = (TP11)/n_test11;
Sensitivity_class11 = TP11/ n_test11;
Specifity_class11 = TN11/(n_total_test - n_test11);
Precision_class11= TP11/ sum(YPred == '11');
Prevalence_class11 = n_test11/n_total_test;

Accuracy_class12 = (TP12)/n_test12;
Sensitivity_class12 = TP12/ n_test12;
Specifity_class12 = TN12/(n_total_test - n_test12);
Precision_class12= TP12/ sum(YPred == '12');
Prevalence_class12 = n_test12/n_total_test;

Accuracy_class13 = (TP13)/n_test13;
Sensitivity_class13 = TP13/ n_test13;
Specifity_class13 = TN13/(n_total_test - n_test13);
Precision_class13 = TP13/ sum(YPred == '13');
Prevalence_class13 = n_test13/n_total_test;

Accuracy_class14 = (TP14)/n_test14;
Sensitivity_class14 = TP14/ n_test14;
Specifity_class14 = TN14/(n_total_test - n_test14);
Precision_class14= TP14/ sum(YPred == '14');
Prevalence_class14 = n_test14/n_total_test;

Accuracy_class15 = (TP15)/n_test15;
Sensitivity_class15 = TP15/ n_test15;
Specifity_class15 = TN15/(n_total_test - n_test15);
Precision_class15= TP15/ sum(YPred == '15');
Prevalence_class15 = n_test15/n_total_test;

Accuracy_class16 = (TP16)/n_test16;
Sensitivity_class16 = TP16/ n_test16;
Specifity_class16 = TN16/(n_total_test - n_test16);
Precision_class16= TP16/ sum(YPred == '16');
Prevalence_class16 = n_test16/n_total_test;

Accuracy_class17 = (TP17)/n_test17;
Sensitivity_class17 = TP17/ n_test17;
Specifity_class17 = TN17/(n_total_test - n_test17);
Precision_class17= TP17/ sum(YPred == '17');
Prevalence_class17 = n_test17/n_total_test;

Accuracy_class18 = (TP18)/n_test18;
Sensitivity_class18 = TP18/ n_test18;
Specifity_class18 = TN18/(n_total_test - n_test18);
Precision_class18= TP18/ sum(YPred == '18');
Prevalence_class18 = n_test18/n_total_test;

Accuracy_class19 = (TP19)/n_test19;
Sensitivity_class19 = TP19/ n_test19;
Specifity_class19 = TN19/(n_total_test - n_test19);
Precision_class19= TP19/ sum(YPred == '19');
Prevalence_class19 = n_test19/n_total_test;

Accuracy_class20 = (TP20)/n_test20;
Sensitivity_class20 = TP20/ n_test20;
Specifity_class20 = TN20/(n_total_test - n_test20);
Precision_class20= TP20/ sum(YPred == '20');
Prevalence_class20 = n_test20/n_total_test;

Accuracy_class21 = (TP21)/n_test21;
Sensitivity_class21 = TP21/ n_test21;
Specifity_class21 = TN21/(n_total_test - n_test21);
Precision_class21= TP21/ sum(YPred == '21');
Prevalence_class21 = n_test21/n_total_test;

Accuracy_class22 = (TP22)/n_test22;
Sensitivity_class22 = TP22/ n_test22;
Specifity_class22 = TN22/(n_total_test - n_test22);
Precision_class22= TP22/ sum(YPred == '22');
Prevalence_class22 = n_test22/n_total_test;

Accuracy_class23 = (TP23)/n_test23;
Sensitivity_class23 = TP23/ n_test23;
Specifity_class23 = TN23/(n_total_test - n_test23);
Precision_class23= TP23/ sum(YPred == '23');
Prevalence_class23 = n_test23/n_total_test;

Accuracy_class24 = (TP24)/n_test24;
Sensitivity_class24 = TP24/ n_test24;
Specifity_class24 = TN24/(n_total_test - n_test24);
Precision_class24= TP24/ sum(YPred == '24');
Prevalence_class24 = n_test24/n_total_test;


Accuracy_class25 = (TP25)/n_test25;
Sensitivity_class25 = TP25/ n_test25;
Specifity_class25 = TN25/(n_total_test - n_test25);
Precision_class25= TP25/ sum(YPred == '25');
Prevalence_class25 = n_test25/n_total_test;

Accuracy_class26 = (TP26)/n_test26;
Sensitivity_class26 = TP26/ n_test26;
Specifity_class26 = TN26/(n_total_test - n_test26);
Precision_class26= TP26/ sum(YPred == '26');
Prevalence_class26 = n_test26/n_total_test;

Accuracy_class27 = (TP27)/n_test27;
Sensitivity_class27 = TP27/ n_test27;
Specifity_class27 = TN27/(n_total_test - n_test27);
Precision_class27= TP27/ sum(YPred == '27');
Prevalence_class27 = n_test27/n_total_test;

Accuracy_class28 = (TP28)/n_test28;
Sensitivity_class28 = TP28/ n_test28;
Specifity_class28 = TN28/(n_total_test - n_test28);
Precision_class28= TP28/ sum(YPred == '28');
Prevalence_class28 = n_test28/n_total_test;

%%%%%%%%%%%%%%%%%%%%%%% Save Output %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Name= {'N_Class'; 'N_Train'; 'N_Test'; 'TP'; 'TN'; 'FN'; 'FP'; 'Accuracy_class'; 'Sensitivity'; 'Specifity'; 'Precision'; 'Prevalence'};        
Class1 = [N_class1; n_train1; n_test1; TP1; TN1; FN1; FP1; Accuracy_class1; Sensitivity_class1; Specifity_class1; Precision_class1; Prevalence_class1];    
Class2 = [N_class2; n_train2; n_test2; TP2; TN2; FN2; FP2; Accuracy_class2; Sensitivity_class2; Specifity_class2; Precision_class2; Prevalence_class2];    
Class3 = [N_class3; n_train3; n_test3; TP3; TN3; FN3; FP3; Accuracy_class3; Sensitivity_class3; Specifity_class3; Precision_class3; Prevalence_class3];    
Class4 = [N_class4; n_train4; n_test4; TP4; TN4; FN4; FP4; Accuracy_class4; Sensitivity_class4; Specifity_class4; Precision_class4; Prevalence_class4];    
Class5 = [N_class5; n_train5; n_test5; TP5; TN5; FN5; FP5; Accuracy_class5; Sensitivity_class5; Specifity_class5; Precision_class5; Prevalence_class5];    
Class6 = [N_class6; n_train6; n_test6; TP6; TN6; FN6; FP6; Accuracy_class6; Sensitivity_class6; Specifity_class6; Precision_class6; Prevalence_class6];  
Class7 = [N_class7; n_train7; n_test7; TP7; TN7; FN7; FP7; Accuracy_class7; Sensitivity_class7; Specifity_class7; Precision_class7; Prevalence_class7];    
Class8 = [N_class8; n_train8; n_test8; TP8; TN8; FN8; FP8; Accuracy_class8; Sensitivity_class8; Specifity_class8; Precision_class8; Prevalence_class8]; 
Class9 = [N_class9; n_train9; n_test9; TP9; TN9; FN9; FP9; Accuracy_class9; Sensitivity_class9; Specifity_class9; Precision_class9; Prevalence_class9];   
Class10 = [N_class10; n_train10; n_test10; TP10; TN10; FN10; FP10; Accuracy_class10; Sensitivity_class10; Specifity_class10; Precision_class10; Prevalence_class10];  
Class11 = [N_class11; n_train11; n_test11; TP11; TN11; FN11; FP11; Accuracy_class11; Sensitivity_class11; Specifity_class11; Precision_class11; Prevalence_class11];    
Class12 = [N_class12; n_train12; n_test12; TP12; TN12; FN12; FP12; Accuracy_class12; Sensitivity_class12; Specifity_class12; Precision_class12; Prevalence_class12];    
Class13 = [N_class13; n_train13; n_test13; TP13; TN13; FN13; FP13; Accuracy_class13; Sensitivity_class13; Specifity_class13; Precision_class13; Prevalence_class13];  
Class14 = [N_class14; n_train14; n_test14; TP14; TN14; FN14; FP14; Accuracy_class14; Sensitivity_class14; Specifity_class14; Precision_class14; Prevalence_class14];    
Class15 = [N_class15; n_train15; n_test15; TP15; TN15; FN15; FP15; Accuracy_class15; Sensitivity_class15; Specifity_class15; Precision_class15; Prevalence_class15];    
Class16 = [N_class16; n_train16; n_test16; TP16; TN16; FN16; FP16; Accuracy_class16; Sensitivity_class16; Specifity_class16; Precision_class16; Prevalence_class16];    
Class17 = [N_class17; n_train17; n_test17; TP17; TN17; FN17; FP17; Accuracy_class17; Sensitivity_class17; Specifity_class17; Precision_class17; Prevalence_class17];    
Class18 = [N_class18; n_train18; n_test18; TP18; TN18; FN18; FP18; Accuracy_class18; Sensitivity_class18; Specifity_class18; Precision_class18; Prevalence_class18];    
Class19 = [N_class19; n_train19; n_test19; TP19; TN19; FN19; FP19; Accuracy_class19; Sensitivity_class19; Specifity_class19; Precision_class19; Prevalence_class19]; 
Class20 = [N_class20; n_train20; n_test20; TP20; TN20; FN20; FP20; Accuracy_class20; Sensitivity_class20; Specifity_class20; Precision_class20; Prevalence_class20];    
Class21 = [N_class21; n_train21; n_test21; TP21; TN21; FN21; FP21; Accuracy_class21; Sensitivity_class21; Specifity_class21; Precision_class21; Prevalence_class21];    
Class22 = [N_class22; n_train22; n_test22; TP22; TN22; FN22; FP22; Accuracy_class22; Sensitivity_class22; Specifity_class22; Precision_class22; Prevalence_class22];    
Class23 = [N_class23; n_train23; n_test23; TP23; TN23; FN23; FP23; Accuracy_class23; Sensitivity_class23; Specifity_class23; Precision_class23; Prevalence_class23];  
Class24 = [N_class24; n_train24; n_test2; TP24; TN24; FN24; FP24; Accuracy_class24; Sensitivity_class24; Specifity_class24; Precision_class24; Prevalence_class24];    
Class25 = [N_class25; n_train25; n_test25; TP25; TN25; FN25; FP25; Accuracy_class25; Sensitivity_class25; Specifity_class25; Precision_class25; Prevalence_class25];  
Class26 = [N_class26; n_train26; n_test26; TP26; TN26; FN26; FP26; Accuracy_class26; Sensitivity_class26; Specifity_class26; Precision_class26; Prevalence_class26];    
Class27 = [N_class27; n_train27; n_test27; TP27; TN27; FN27; FP27; Accuracy_class27; Sensitivity_class27; Specifity_class27; Precision_class27; Prevalence_class27]; 
Class28 = [N_class28; n_train28; n_test28; TP28; TN28; FN28; FP28; Accuracy_class28; Sensitivity_class28; Specifity_class28; Precision_class28; Prevalence_class28];    


%T = table(Class1, 'RowNames',Name)
T = table(Class1, Class2,Class3,Class4,Class5,Class6,Class7,Class8,Class9, Class10, Class11, Class12, Class13, Class14, Class15, Class16,Class17, Class18, Class19, Class20,Class21, Class22, Class23, Class24,Class25, Class26, Class27, Class28, 'RowNames',Name)
writetable(T, 'Tableout.txt', 'Delimiter', '\t', 'WriteRowNames', true)
% type Tabledata.txt

diary('output.txt')
%publish('reslt','pdf')

