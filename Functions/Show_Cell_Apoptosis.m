function Show_Cell_Apoptosis(tracked_images_path, XBorder, YBorder, MaxWindowX, MaxWindowY)

if tracked_images_path(end) ~= filesep
    tracked_images_path = [tracked_images_path filesep];
end

% Load Data and Get confidence index
if ~exist([tracked_images_path 'tracking_workspace.mat'],'file')
    errordlg(sprintf('Output of tracking not found:\nCheck paths for correctness\nRun segmentation and tracking before plotting output'))
    return
end
load([tracked_images_path 'tracking_workspace.mat']);

if ~exist('cell_apoptosis', 'var'), errordlg('Missing cell_apoptosis required.'); return; end

% Create figure in case not found
if ~isempty(findobj('type','figure','name','Cell Apoptosis Window'))
    CI_fig = findobj('type','figure','name','Cell Apoptosis Window');
    figure(CI_fig)
else    
    CI_fig = figure(...
    'units', 'pixels',... 
    'Position', [XBorder+MaxWindowX, YBorder, MaxWindowX*0.25, MaxWindowY], ... 
    'Name','Cell Apoptosis Window',...
    'NumberTitle','off',...
    'Menubar','none',...
    'Toolbar','none',...
    'Resize', 'on');
end

%Scrollable EditBox
uitable('Parent',CI_fig,...
    'units','normalized',...
    'position',[0 0 1 1],...
    'ColumnName', {' Cell ID ', ' Cell Apoptosis '}, ...
    'fontweight','bold',...
    'RowName',[],...
    'Data', [(1:highest_cell_number)', cell_apoptosis]);
end





