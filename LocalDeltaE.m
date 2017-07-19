% Demo to computer color contrast using the CIE Color Difference Formula (Delta E).
% Has the effect of finding color edges (high contrast regions),
% and "uniform" regions (low contrast regions).
% The RGB image is converted to LAB color space and then the
% mean color in a localized window is computed (i.e. the local average image).
% The Delta E (the color difference in LAB color space) is then calculated
% for every pixel in the image between that pixel's color and the average
% LAB color of the window region.  The user can then specify a number that
% says how close to that color would they like to be.  The software will
% then find all pixels within that specified Delta E of the color each pixel.
%
function LocalDeltaE()
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
% imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

% Change the current folder to the folder of this m-file.
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end

try
	% Check that user has the Image Processing Toolbox installed.
	hasIPT = license('test', 'image_toolbox');
	if ~hasIPT
		% User does not have the toolbox installed.
		message = sprintf('Sorry, but you do not seem to have the Image Processing Toolbox.\nDo you want to try to continue anyway?');
		reply = questdlg(message, 'Toolbox missing', 'Yes', 'No', 'Yes');
		if strcmpi(reply, 'No')
			% User said No, so exit.
			return;
		end
	end
	
	% Continue with the demo.  Do some initialization stuff.
	close all;
	fontSize = 14;
	figure;
	defaultThresholdAnswer = {'7'};  % Suggest this number to the user to threshold the contrast.
	% Maximize the figure.
	set(gcf, 'Position', get(0, 'ScreenSize'));
	set(gcf,'name','Local Color Contrast Demo','numbertitle','off')
	
	% Change the current folder to the folder of this m-file.
	% (The line of code below is from Brett Shoelson of The Mathworks.)
	if(~isdeployed)
		cd(fileparts(which(mfilename)));
	end
	
	% Ask user if they want to use a demo image or their own image.
	message = sprintf('Do you want use a standard demo image,\nOr pick one of your own?');
	reply2 = questdlg(message, 'Which Image?', 'Demo','My Own', 'Demo');
	% Open an image.
	if strcmpi(reply2, 'Demo')
		% Read standard MATLAB demo image.
		message = sprintf('Which demo image do you want to use?');
		selectedImage = questdlg(message, 'Which Demo Image?', 'Onions', 'Peppers', 'Trees', 'Peppers');
		if strcmp(selectedImage, 'Onions')
			fullImageFileName = 'onion.png';
			defaultThresholdAnswer = {'5'};  % Suggest this number to the user.
		elseif strcmp(selectedImage, 'Peppers')
			fullImageFileName = 'peppers.png';
			defaultThresholdAnswer = {'8'};  % Suggest this number to the user.
		else
			fullImageFileName = 'trees.tif';
			defaultThresholdAnswer = {'20'};  % Suggest this number to the user.
		end
	else
		% They want to pick their own.
		% Change default directory to the one containing the standard demo images for the MATLAB Image Processing Toolbox.
		originalFolder = pwd;
		folder = fileparts(which('cameraman.tif')); % Determine where demo folder is (works with all versions).
		if ~exist(folder, 'dir')
			folder = pwd;
		end
		cd(folder);
		% Browse for the image file.
		[baseFileName, folder] = uigetfile('*.*', 'Specify an image file');
		fullImageFileName = fullfile(folder, baseFileName);
		% Set current folder back to the original one.
		cd(originalFolder);
	end
	
	% Check to see that the image exists.  (Mainly to check on the demo images.)
	if ~exist(fullImageFileName, 'file')
		message = sprintf('This file does not exist:\n%s', fullImageFileName);
		WarnUser(message);
		return;
	end
	
	% Read in image into an array.
	[rgbImage, storedColorMap] = imread(fullImageFileName);
	[rows, columns, numberOfColorBands] = size(rgbImage);
	% If it's monochrome (indexed), convert it to color.
	% Check to see if it's an 8-bit image needed later for scaling).
	if strcmpi(class(rgbImage), 'uint8')
		% Flag for 256 gray levels.
		eightBit = true;
	else
		eightBit = false;
	end
	if numberOfColorBands == 1
		if isempty(storedColorMap)
			% Just a simple gray level image, not indexed with a stored color map.
			% Create a 3D true color image where we copy the monochrome image into all 3 (R, G, & B) color planes.
			rgbImage = cat(3, rgbImage, rgbImage, rgbImage);
		else
			% It's an indexed image.
			rgbImage = ind2rgb(rgbImage, storedColorMap);
			% ind2rgb() will convert it to double and normalize it to the range 0-1.
			% Convert back to uint8 in the range 0-255, if needed.
			if eightBit
				rgbImage = uint8(255 * rgbImage);
			end
		end
	end
	
	% Display the original image.
	subplot(3, 4, 1);
	imshow(rgbImage);
	axis on;
	drawnow; % Make it display immediately.
	if numberOfColorBands > 1
		title('Original Color Image', 'FontSize', fontSize);
	else
		caption = sprintf('Original Indexed Image\n(converted to true color with its stored colormap)');
		title(caption, 'FontSize', fontSize);
	end
	
	% Convert image from RGB colorspace to lab color space.
	cform = makecform('srgb2lab');
	lab_Image = applycform(im2double(rgbImage),cform);
	
	% Extract out the color bands from the original image
	% into 3 separate 2D arrays, one for each color component.
	LChannel = lab_Image(:, :, 1);
	aChannel = lab_Image(:, :, 2);
	bChannel = lab_Image(:, :, 3);
	
	% Display the lab images.
	subplot(3, 4, 2);
	imshow(LChannel, []);
	title('L Channel (Overall Lightness)', 'FontSize', fontSize);
	subplot(3, 4, 3);
	imshow(aChannel, []);
	title('a Channel (redness to greenness)', 'FontSize', fontSize);
	subplot(3, 4, 4);
	imshow(bChannel, []);
	title('b Channel (yellowness to blueness)', 'FontSize', fontSize);
	
	% Find out the square window size where wants to average the colors.
	prompt = {sprintf('What square window size do you want to take the average color within? ')};
	dialogTitle = 'Enter the window size';
	numberOfLines = 1;
	defaultAnswer = {'11'};  % Default window width.
	response = inputdlg(prompt, dialogTitle, numberOfLines, defaultAnswer);
	% Update tolerance with user's response.
	windowSize = str2double(cell2mat(response));
	
	% Get the average lab color value, localized within that window.
	[LMean, aMean, bMean] = GetMeanLABValues(LChannel, aChannel, bChannel, windowSize);
	
	% Get the elta colors for each LAB color channel.
	deltaL = LMean - LChannel;
	deltaa = aMean - aChannel;
	deltab = bMean - bChannel;
	
	% Create the Delta E image.
	% This is an image that represents the color difference.
	% Delta E is the square root of the sum of the squares of the delta images.
	deltaE = sqrt(deltaL .^ 2 + deltaa .^ 2 + deltab .^ 2);
	
	% Display the masked Delta E image - the delta E within the masked region only.
	subplot(3, 4, 5);
	imshow(deltaE, []);
	caption = sprintf('Delta E between original color image\nand the mean color within the local window region.');
	title(caption, 'FontSize', fontSize);
	
	% Plot the histogram of the Delta E color difference image.
	caption = sprintf('Histogram of the Delta E Image\n');
	PlotHistogram(deltaE, [3 4 6], caption);
	
	message = sprintf('Regions dissilimar in color to the local color\nwill be bright in the Delta E image.\nLow contrast regions will be dark.');
	msgboxw(message);
	
	% Find out how close the user wants to match the colors.
	prompt = {sprintf('First, examine the histogram.\nThen find pixels within this Delta E that you want to threshold at:')};
	dialogTitle = 'Enter Delta E to threshold at';
	numberOfLines = 1;
	% defaultThresholdAnswer was determined when they read in the demo image.
	response = inputdlg(prompt, dialogTitle, numberOfLines, defaultThresholdAnswer);
	% Update tolerance with user's response.
	thresholdValue = str2double(cell2mat(response));
	
	% Let them interactively select the threshold with the threshold() m-file.
	% (Note: This is a separate function in a separate file in my File Exchange.)
	% http://www.mathworks.com/matlabcentral/fileexchange/29372-thresholding-an-image
	% 	threshold(deltaE);
	
	% Place a vertical bar at the threshold location.
	handleToSubPlot8 = subplot(3, 4, 6);  % Get the handle to the plot.
	PlaceVerticalBarOnPlot(handleToSubPlot8, thresholdValue, [0 .5 0]);  % Put a vertical red line there.
	
	% Find pixels within that delta E.
	binaryImage = deltaE >= thresholdValue;
	% Display high contrast mask.
	subplot(3, 4, 7);
	imshow(binaryImage, []);
	caption = sprintf('Mask of High Delta Es (Delta E >= %.1f)', thresholdValue);
	title(caption, 'FontSize', fontSize);
	% Display low contrast mask.
	subplot(3, 4, 8);
	imshow(~binaryImage, []);
	caption = sprintf('Mask of Low Delta Es (Delta E <= %.1f)', thresholdValue);
	title(caption, 'FontSize', fontSize);
	
	% Mask the image with the high contrast colors and extract those pixels.
	highContrastPixelImage = bsxfun(@times, rgbImage, cast(binaryImage, class(rgbImage)));
	subplot(3, 4, 11);
	imshow(highContrastPixelImage);
	caption = sprintf('High Contrast Pixel Colors (Delta E >= %.1f)', thresholdValue);
	title(caption, 'FontSize', fontSize);
	
	% Mask the image with the low contast colors and extract those pixels.
	lowContrastPixelsImage = bsxfun(@times, rgbImage, cast(~binaryImage, class(rgbImage)));
	subplot(3, 4, 12);
	imshow(lowContrastPixelsImage);
	caption = sprintf('Low Contrast Pixel Colors (Delta E < %.1f)', thresholdValue);
	title(caption, 'FontSize', fontSize);
	
	% Display credits: the MATLAB logo and my name.
	ShowCredits(); % Display logo in plot position #12.
	
	% Alert user that the demo has finished.
	message = sprintf('Done!\n\nThe demo has finished.');
	msgboxw(message);
	
catch ME
	errorMessage = sprintf('Error running this m-file:\n%s\n\nThe error message is:\n%s', ...
		mfilename('fullpath'), ME.message);
	errordlg(errorMessage);
end
return; % from SimpleColorDetection()
% ---------- End of main function ---------------------------------


%----------------------------------------------------------------------------
% Display the MATLAB logo.
function ShowCredits()
try
	logoFig = subplot(3, 4, 9);
	caption = sprintf('A MATLAB Demo\nby Image Analyst');
	text(0.5,1.15, caption, 'Color','r', 'FontSize', 18, 'FontWeight','b', 'HorizontalAlignment', 'Center') ;
	positionOfLowerRightPlot = get(logoFig, 'position');
	L = 40*membrane(1,25);
	logoax = axes('CameraPosition', [-193.4013 -265.1546  220.4819],...
		'CameraTarget',[26 26 10], ...
		'CameraUpVector',[0 0 1], ...
		'CameraViewAngle',9.5, ...
		'DataAspectRatio', [1 1 .9],...
		'Position', positionOfLowerRightPlot, ...
		'Visible','off', ...
		'XLim',[1 51], ...
		'YLim',[1 51], ...
		'ZLim',[-13 40], ...
		'parent',gcf);
	s = surface(L, ...
		'EdgeColor','none', ...
		'FaceColor',[0.9 0.2 0.2], ...
		'FaceLighting','phong', ...
		'AmbientStrength',0.3, ...
		'DiffuseStrength',0.6, ...
		'Clipping','off',...
		'BackFaceLighting','lit', ...
		'SpecularStrength',1, ...
		'SpecularColorReflectance',1, ...
		'SpecularExponent',7, ...
		'Tag','TheMathWorksLogo', ...
		'parent',logoax);
	l1 = light('Position',[40 100 20], ...
		'Style','local', ...
		'Color',[0 0.8 0.8], ...
		'parent',logoax);
	l2 = light('Position',[.5 -1 .4], ...
		'Color',[0.8 0.8 0], ...
		'parent',logoax);
	
catch ME
	errorMessage = sprintf('Error running ShowCredits().\n\nThe error message is:\n%s', ...
		ME.message);
	errordlg(errorMessage);
end
return; % from ShowCredits()

%-----------------------------------------------------------------------------
% Get the average lab color within the window region.
% Get new images where each pixel of the output image is the average
% of the pixels in a square window, of width windowSize,
% around the input pixel (including the central pixel).
function [LMean, aMean, bMean] = GetMeanLABValues(LChannel, aChannel, bChannel, windowSize)
try
	kernel = ones(windowSize, windowSize) / windowSize^2;
	LMean = conv2(LChannel, kernel, 'same'); % Average of only the pixels within the windowed area.
	aMean = conv2(aChannel, kernel, 'same'); % Average of only the pixels within the windowed area.
	bMean = conv2(bChannel, kernel, 'same'); % Average of only the pixels within the windowed area.
catch ME
	errorMessage = sprintf('Error running GetMeanLABValues:\n\n\nThe error message is:\n%s', ...
		ME.message);
	WarnUser(errorMessage);
end
return; % from GetMeanLABValues

%==========================================================================================================================
function WarnUser(warningMessage)
uiwait(warndlg(warningMessage));
return; % from WarnUser()

%==========================================================================================================================
function msgboxw(message)
uiwait(msgbox(message));
return; % from msgboxw()

%==========================================================================================================================
% Plots the histograms of the pixels in both the masked region and the entire image.
function PlotHistogram(doubleImage, plotNumber, caption)
try
	fontSize = 14;
	numberOfBins = 50;
	subplot(plotNumber(1), plotNumber(2), plotNumber(3));
	
	% Find out where the edges of the histogram bins should be.
	maxValue = max(doubleImage(:));
	histBinEdges = linspace(0, maxValue, numberOfBins);
	
	% Get the histogram of the entire image into 100 bins.
	pixelCount = histc(doubleImage(:), histBinEdges);
	
	% Plot the  histogram of the entire image.
	bar(histBinEdges, pixelCount, 'BarWidth', 1);
	title(caption, 'FontSize', fontSize);
	
	% Scale x axis manually.
	xlim([0 histBinEdges(end)]);
catch ME
	errorMessage = sprintf('Error running PlotHistogram:\n\n\nThe error message is:\n%s', ...
		ME.message);
	WarnUser(errorMessage);
end
return; % from PlotHistogram

%=====================================================================
% Shows vertical lines going up from the X axis to the curve on the plot.
function lineHandle = PlaceVerticalBarOnPlot(handleToPlot, x, lineColor)
try
	% If the plot is visible, plot the line.
	if get(handleToPlot, 'visible')
		axes(handleToPlot);  % makes existing axes handles.axesPlot the current axes.
		% Make sure x location is in the valid range along the horizontal X axis.
		XRange = get(handleToPlot, 'XLim');
		maxXValue = XRange(2);
		if x > maxXValue
			x = maxXValue;
		end
		% Erase the old line.
		%hOldBar=findobj('type', 'hggroup');
		%delete(hOldBar);
		% Draw a vertical line at the X location.
		hold on;
		yLimits = ylim;
		lineHandle = line([x x], [yLimits(1) yLimits(2)], 'Color', lineColor, 'LineWidth', 3);
		hold off;
	end
catch ME
	errorMessage = sprintf('Error running PlaceVerticalBarOnPlot:\n\n\nThe error message is:\n%s', ...
		ME.message);
	WarnUser(errorMessage);
end
return;	% End of PlaceVerticalBarOnPlot

