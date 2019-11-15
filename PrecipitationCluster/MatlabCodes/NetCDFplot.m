% SEBASTIANELLI STEFANO, GEO-K S.r.l. - COMET (2019)
%
% script used to plot NetCDF files (*.nc files)
% generated from operational chains output files
%

clear
close all

RainLimit=[0 30]; %if you want to plot rain rate
% QuaLimit=[0 100]; %if you want to plot quality index

% CREATION OF A LIST OF FILES TO READ
direin=['C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\NetCDF_input\'];
file = '*nc';
sa=dir([direin file]);
lista=char(sa.name);

cd 'C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\NetCDF_input\'

% LOOP ON TEXT FILES TO READ
num_file=size(lista,1); % number of files to read
for nf = 1:num_file
    filename=lista(nf,:);
    
    % READING OF THE LATITUDE, LONGITUDE, QUALITY, AND RAIN RATE VARIABLES
    Lati=ncread(filename,'lat');
    Loni=ncread(filename,'lon');
    RRi=ncread(filename,'rr');
    QQi=ncread(filename,'qind');
    
    dim=size(RRi);
    pdim=dim(1)*dim(2);
    Lat=double(reshape(Lati,pdim,1)); %converts matrices into vectors for plotting
    Lon=double(reshape(Loni,pdim,1));
    RR=double(reshape(RRi,pdim,1));
    QQ=double(reshape(QQi,pdim,1));
    fff=find(RR==0);
    QQ(fff)=NaN;
    fff=find(QQ==(-9));
    QQ(fff)=NaN;
    
    % TEXT FILES PLOTTING
    figure
    geoscatter(Lat,Lon,6,RR,'filled') %plots the rain rate at the specified coordinates
%     geoscatter(Lat,Lon,6,QQ,'filled') %plots the quality index at the specified coordinates
    geobasemap darkwater %adds the basemap (darkwater is default without access to internet)
    geolimits([-65 71],[-80 80]) %sets the limits in both latidude and longitude
%     geolimits([20 35],[-55 -35]) %limit the field if you want to represent a specific object
    caxis(RainLimit); %sets the rainfall limits between 0 and 30 mm/h
%     caxis(QuaLimit); %sets the quality index limits between 0 and 100
    h = colorbar;
    set(get(h,'title'),'string','mm/h','FontName','Helvetica','FontWeight','Bold','FontSize',12');
    colori=[1 1 1; jet(80)]; %set the colormap for rainfall intensity
%     colori=[jet(81)]; %set the colormap for quality index
    colormap(colori)
    grid on
    title(['product: ', filename(1:3), '; date: ', filename(5:12), '; \Deltat: ', filename(14:17), '-', filename(19:22)],'FontName','Helvetica','FontWeight','Bold','FontSize',14')
%     title(['H20 quality; ', 'date: ', filename(5:12), '; \Deltat: ', filename(14:17), '-', filename(19:22)],'FontName','Helvetica','FontWeight','Bold','FontSize',14')
    
    % SAVE THE IMAGE
    perc='C:\Users\geo-k\Documents\AM\Reading\presentazione_Reading\PrecipitationCluster\png_output\';
    figname=[perc, filename(1:(end-3))];
    saveas(gcf, figname, 'png');
%     saveas(gcf, [figname, '_Lorenzo'], 'png');
%     saveas(gcf, [figname, '_Lorenzo_qual'], 'png');
end