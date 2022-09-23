
% -------------------------------------- 
% Specify paths and read EN$, CORE2 data

% ncdisp(file_name) displays all information about the data

ppdir = "/Users/hemantkhatri/OneDrive - The University of Liverpool" + ...
    "/Work_Subpolar_Atlantic/Data/";

Salinity_EN4 = ncread(ppdir + ...
    '/EN.4.2.2.analyses.g10.2009/EN.4.2.2.f.analysis.g10.200901.nc' ...
    , 'salinity');
Temp_EN4 = ncread(ppdir + ...
    '/EN.4.2.2.analyses.g10.2009/EN.4.2.2.f.analysis.g10.200901.nc' ...
    , 'temperature');

lat_EN4 = ncread(ppdir + ...
    '/EN.4.2.2.analyses.g10.2009/EN.4.2.2.f.analysis.g10.200901.nc' ...
    , 'lat');
lon_EN4 = ncread(ppdir + ...
    '/EN.4.2.2.analyses.g10.2009/EN.4.2.2.f.analysis.g10.200901.nc' ...
    , 'lon');

Prec_CORE = ncread(ppdir + 'NCAR_CORE2_Surface_Flux/2006.nc','F_prec');
Evap_CORE = ncread(ppdir + 'NCAR_CORE2_Surface_Flux/2006.nc','F_evap');

lat_CORE = ncread(ppdir + 'NCAR_CORE2_Surface_Flux/2006.nc','lat');
lon_CORE = ncread(ppdir + 'NCAR_CORE2_Surface_Flux/2006.nc','lon');

% -----------------------------------
% --------- Plot data ---------------

subplot(2,2,1)
contourf(lon_EN4, lat_EN4, Temp_EN4(:,:,1)' - 273.15, 20)
clim([-2 30]); c=colorbar();
title('Temperature (deg C) at 5m depth');
xlabel('Longitude');
ylabel('Latitude');

subplot(2,2,2)
contourf(lon_EN4, lat_EN4, Salinity_EN4(:,:,1)', 20)
clim([28 36]); c=colorbar();
title('Salinity (psu) at 5m depth');
xlabel('Longitude');
ylabel('Latitude');

subplot(2,2,3)
contourf(lon_CORE, lat_CORE, Prec_CORE(:,:,1)', 20)
clim([-1e-4 1e-4]); 
c=colorbar();
title('Surface precipitation (kg/s/m^2)');
xlabel('Longitude');
ylabel('Latitude');


subplot(2,2,4)
contourf(lon_CORE, lat_CORE, Evap_CORE(:,:,1)', 20)
clim([-1e-4 1e-4]); 
c=colorbar();
title('Surface evaporation (kg/s/m^2)');
xlabel('Longitude');
ylabel('Latitude');
