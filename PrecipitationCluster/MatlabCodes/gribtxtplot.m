% SEBASTIANELLI STEFANO, GEO-K S.r.l. - COMET (2019)
%
% script used to plot H03B/H15B text files (*.dat files)
% generated from H03B/H15B operational chain output grib files
%

clear
close all

RainLimit=[0 30];

% CREATION OF A LIST OF FILE TO READ
direin=['C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\txt_from_GRIB_input\'];
file = '*txt';
sa=dir([direin file]);
lista=char(sa.name);

cd 'C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\txt_from_GRIB_input\'

% LOOP ON TEXT FILES TO READ
num_file=size(lista,1); % number of files to read
for nf = 1:num_file
    filename=lista(nf,:);
    
    % READING OF THE LATITUDE, LONGITUDE, AND RAIN RATE VARIABLES
    LonLatRR=importdata(filename);
    Lon=LonLatRR(:,1);
    Lat=LonLatRR(:,2);
    RR=LonLatRR(:,3);
    
    fff=find(Lat>90);
    Lat(fff)=[];
    Lon(fff)=[];
    RR(fff)=[];
     
    % TEXT FILES PLOTTING
    figure
    geoscatter(Lat,Lon,6,RR,'filled') %plots the rain rate at the specified coordinates
    geobasemap darkwater %adds the basemap (darkwater is default without access to internet)
    geolimits([-50 50],[-50 50]) %sets the limits in both latidude and longitude
%     geolimits([15 30],[-55 -35]) %limit the field if you want to represent a specific object
    caxis(RainLimit); %sets the rainfall limits between 0 and 30 mm/h
    h = colorbar;
    set(get(h,'title'),'string','mm/h','FontName','Helvetica','FontWeight','Bold','FontSize',12');
    %     colori=[1 1 1; jet(80)]; %set the colormap for rainfall intensity
    colori=jet(80); %set the colormap for rainfall intensity
    colormap(colori)
    grid on
    title(['product: H03B; date: ', filename(6:13), '; time: ', filename(15:16), ':', filename(17:18),],'FontName','Helvetica','FontWeight','Bold','FontSize',14')
    
    % SAVE THE IMAGE
    perc='C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\png_output\';
    figname=[perc, filename(1:(end-8))];
    saveas(gcf, figname, 'png');
%     saveas(gcf, [figname, '_Lorenzo'], 'png');
end