% Load data
medalData = readtable('Olympic_MedalGenderDist.csv');

% Extract country and category
country = medalData.Country';
category = ["Men", "Women", "Open"];

% Matrix of medals only
MedalGenderDist = table2array(medalData(:, 2:4));  % 10x3

% Total medals
totalmedals = sum(MedalGenderDist, 2);

% Randomly assign gold/silver/bronze for demo (or define yourself)
gmedals = round(totalmedals * 0.5);   % example: 50% gold
smedals = round(totalmedals * 0.3);   % 30% silver
bmedals = totalmedals - gmedals - smedals;

% Rank by total medals
[~, idx] = sort(totalmedals, 'descend');
rank = (1:10)';
rank(idx) = rank;

%  stacked bar plot of MedalGenderDist against country
figure;
bar(country,MedalGenderDist);
legend(category);
ylim([0 50]);
xlabel("Country");
ylabel("Number of Medals");
title("Olympic Medal Distribution by Gender");

% analyze different types of medals won by each country.
figure;
plot(gmedals,"o-",Color=[0.8 0.7 0.2],MarkerFaceColor=[0.8 0.7 0.2])
hold on; % Keep the current plot
plot(smedals, "s-", Color=[0.3 0.5 0.5], MarkerFaceColor=[0.3 0.5 0.5]);
plot(bmedals, "d-", Color=[0.7 0.4 0.4], MarkerFaceColor=[0.7 0.4 0.4]);
hold off; 
xticklabels(country);
legend(["Gold Medals" "Silver Medals" "Bronze Medals"]);
xlabel("Country");
ylabel("Number of Medals");
title("Medal Distribution");

%explore the ranking of countries by plotting the total medals won in the Olympics and the global ranking of countries in sports.
figure;
bar(country,totalmedals,FaceColor=[0.3 0.7 0.9]);
xlabel("Country");
ylabel("Number of Medals");
hold on ;
ylim([0 120]);
yyaxis right ;
bar(country,rank,BarWidth=0.3);
ylabel("Global Ranking");
title("Medal Ranking and Global Ranking");
ylim([0 12]);