function plot_fusion_lineage_GUI(tracked_images_path, plot_text, cell_nb)

if tracked_images_path(end) ~= filesep
    tracked_images_path = [tracked_images_path filesep];
end

% Load Data 
if ~exist([tracked_images_path 'tracking_workspace.mat'],'file')
    errordlg(sprintf('Output of tracking not found:\nCheck paths for correctness\nRun segmentation and tracking before plotting output'))
    return
end
load([tracked_images_path 'tracking_workspace.mat']);

if ~exist('highest_cell_number', 'var'), errordlg('Missing highest_cell_number required.'); return; end
if ~exist('birth', 'var'), errordlg('Missing birth required.'); return; end
if ~exist('death', 'var'), errordlg('Missing death required.'); return; end
if ~exist('fusion_matrix', 'var'), errordlg('Missing fusion_matrix required.'); return; end
if ~exist('nb_frames', 'var'), errordlg('Missing nb_frames required.'); return; end

% Convert user input to numeric
cell_nb = str2num(cell_nb); %#ok<ST2NM>

% Check Validity of user input
if any(cell_nb < 0) || any(cell_nb > highest_cell_number)
    errordlg(['Invalid Cell Numbers. Please choose between 0 and ' num2str(highest_cell_number)]);
    return;
end

for i = 1:length(cell_nb)
    plot_cell_fusion_lineage(fusion_matrix ,birth, death, plot_text, cell_nb);
end

