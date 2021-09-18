function Show_Fusion_Matrix(tracked_images_path, XBorder, YBorder, MaxWindowX, MaxWindowY )

if tracked_images_path(end) ~= filesep
    tracked_images_path = [tracked_images_path filesep];
end

% Load Data and Get confidence index
if ~exist([tracked_images_path 'tracking_workspace.mat'],'file')
    errordlg(sprintf('Output of tracking not found:\nCheck paths for correctness\nRun segmentation and tracking before plotting output'))
    return
end
load([tracked_images_path 'tracking_workspace.mat']);

if ~exist('fusion_matrix', 'var'), errordlg('Missing fusion_matrix required.'); return; end

% Create figure in case not found
if ~isempty(findobj('type','figure','name','Fusion Matrix Window'))
    FM_fig = findobj('type','figure','name','Fusion Matrix Window');
    figure(FM_fig)
else    
    FM_fig = figure(...
    'units', 'pixels',... 
    'Position', [XBorder+MaxWindowX, YBorder, MaxWindowX*0.45, MaxWindowY], ... 
    'Name','Fusion Matrix Window',...
    'NumberTitle','off',...
    'Menubar','none',...
    'Toolbar','none',...
    'Resize', 'on');
end

col_name = cell(1,size(fusion_matrix,2)+1);
for i = 1:size(fusion_matrix,2)
    col_name{i} = ' Fusion ID @t ';
end
col_name{i+1} = ' Fused ID @t+1 ';

%Scrollable EditBox
uitable('Parent',FM_fig,...
    'units','normalized',...
    'position',[0 0 1 1],...
    'ColumnName', col_name, ...
    'fontweight','bold', ...
    'RowName',[],...
    'Data',[fusion_matrix, (1:highest_cell_number)']);
end


