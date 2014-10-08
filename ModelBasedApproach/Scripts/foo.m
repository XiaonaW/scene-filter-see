close all;
clear all;

%addpath(genpath('..'));
testing  = 1;
picture  = 1;

% load in natural scene statistics

env.feature      = 'disp';
%
home_path = userpath;
paths.env = [home_path(1:end - 1) '/scene-filter-see/ModelBasedApproach/EnvironStats'];
% Visual feature properties in the environment
env  = get_environ_stats(paths, env);         % environmental probabilities for increments and decrements

% set up brain model to use

model.N           = 120;                              % number of neurons for simulation
model.R           = 50;                               % mean population firing rate
model.popDensity  = 'optimal';                        % cell population density ('uniform' or 'optimal'
model.popGain     = 'optimal';                        % cell population response gain ('uniform' or 'optimal')

model = build_model_cell_population(env,model);

% load in image and disparity map

if(testing)
    
    % noise image and depth map
    imgsize = zeros(124, 124, 1);
    image.pixels    = mkFract(size(imgsize), 1.2);
    image.pixels    = (image.pixels - min(image.pixels(:)))./range(image.pixels(:));
    image.depth     = mkFract(124,1);
    image.depth    = (image.depth - min(image.depth(:)))./range(image.depth(:));
    image.depth     = 5*(image.depth - 0.5) + 5;
    
    % since we're initially interested in model results for pictures, set the testing
    % depth map to zeros
    if(picture)
        image.depth = zeros(size(image.depth));
    end
else
    
    % load in an image from the perceptual study
    % it would be okay to downsample the images for initial testing
    
    % XXXXXX
    
    % since we're initially interested in model results for pictures, set the testing
    % depth map to zeros
    if(picture)
        image.depth = zeros(size(image.depth));
    end
end

image = convert_image_to_rgc_response(image);
image = convert_depth_to_disparity(image);

brain = apply_model_to_image(model,image);

figure;  hold on;
plot_tuning_curves(model)

subplot(3,2,1); hold on; title('Environmental Probabilities');
plot(env.rng,env.br,'r');
plot(env.rng,env.dk,'b');
xlabel('Binocular Disparity (arcmin)');
ylabel('Probability ON/OFF');
xlim([min(model.rng) max(model.rng)]);

subplot(3,2,4); hold on; xlabel('Image');
imagesc(image.rgc);
axis image; colorbar; colormap gray;
caxis([-1 1]);

subplot(3,2,6); hold on; xlabel('Disparity Map (arcmin)');
imagesc(brain.disparity);
axis image; colorbar




