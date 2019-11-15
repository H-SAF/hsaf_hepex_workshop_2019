% SEBASTIANELLI STEFANO, GEO-K S.r.l. - COMET (2019)
%
% script used to plot H01/H02B text files (*.dat files)
% generated from H01/H02B operational chain output BUFR files
%

clear
close all

RainLimit=[0 30]; %if you want to plot rain rate
% QuaLimit=[0 100]; %if you want to plot quality index

% CREATION OF A LIST OF FILES TO READ
direin=['C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\txt_from_BUFR_input\'];
file = '*f15*dat';
sa=dir([direin file]);
lista=char(sa.name);

cd 'C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\txt_from_BUFR_input\'

% LOOP ON TEXT FILES TO READ
num_file=size(lista,1); % number of files to read
for nf = 1:num_file
    filename=lista(nf,:);
    
    % READING OF THE LATITUDE, LONGITUDE, QUALITY, AND RAIN RATE VARIABLES
    LonLatRR=importdata(filename);
    Lon=LonLatRR(:,1);
    Lat=LonLatRR(:,2);
    RR=LonLatRR(:,5);
    QQ=LonLatRR(:,6);
    fff=find(RR==0);
    QQ(fff)=NaN;
    
    % TEXT FILES PLOTTING
    figure
    geoscatter(Lon,Lat,6,RR,'filled') %plots the rain rate at the specified coordinates
%     geoscatter(Lon,Lat,6,QQ,'filled') %plots the quality index at the specified coordinates
    geobasemap darkwater %adds the basemap (darkwater is default without access to internet)
    geolimits([-65 71],[-80 80]) %sets the limits in both latidude and longitude
%     geolimits([15 30],[-55 -35]) %limit the field if you want to represent a specific object
    caxis(RainLimit); %sets the rainfall limits between 0 and 30 mm/h
%     caxis(QuaLimit); %sets the quality index limits between 0 and 100
    h = colorbar;
    set(get(h,'title'),'string','mm/h','FontName','Helvetica','FontWeight','Bold','FontSize',12');
    colori=[1 1 1; jet(80)]; %set the colormap for rainfall intensity
%     colori=[jet(81)]; %set the colormap for quality index
    colormap(colori)
    grid on
    title(['product: H01; date: ', filename(1:8), '; time: ', filename(9:10), ':', filename(11:12)],'FontName','Helvetica','FontWeight','Bold','FontSize',14')
%     title(['H01 quality; date: ', filename(1:8), '; time: ', filename(9:10), ':', filename(11:12)],'FontName','Helvetica','FontWeight','Bold','FontSize',14')

    % SAVE THE IMAGES
    perc='C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\png_output\';
    figname=[perc, filename(1:(end-4))];
    saveas(gcf, figname, 'png');
%     saveas(gcf, [figname, '_Lorenzo'], 'png');
%     saveas(gcf, [figname, '_Lorenzo_qual'], 'png');
end