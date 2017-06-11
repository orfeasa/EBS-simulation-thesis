function Field = importField(filename)
%IMPORTFIELD Imports data created by ASCII export of the field
% in CST to a .mat file

    % preprocess file for preallocation

    % open file
    fid = fopen(filename,'r');

    % find last occurance of the word 'Sample'
    % save the number of samples
    noOfSamples = 0;
    noOfDatapoints = 0;

    while(~feof(fid))
        % read line
        line = fgetl(fid);

        % count number of samples
        if (strcmp(line(1:7), 'Sample '))
            noOfSamples = noOfSamples + 1;
        end    

        % count the number of datapoints in the first sample
        if (noOfSamples == 1)
            noOfDatapoints = noOfDatapoints + 1;
        end        
    end
    % one extra datapoint has been counted
    noOfDatapoints = noOfDatapoints - 1;

    % Move file position indicator to beginning of file
    frewind(fid);

    % initialize containing matrix
    Field = zeros(noOfSamples, noOfDatapoints, 6);

    % read the data

    %skip header
    fgetl(fid);fgetl(fid);

    currentSample = 0;
    currentDataPoint = 1;

    while(~feof(fid))
        % read line and convert it to array
        line = fgetl(fid);
        lineArray = str2num(line); 

        if (length(lineArray) > 1)
            % if we have data save it
            Field(currentSample, currentDataPoint, :) = ...
                lineArray(1:6); 
            currentDataPoint = currentDataPoint + 1;
        else
            % if not prepare for the next sample
            currentSample = currentSample + 1;
            currentDataPoint = 1;
        end    
    end

    fclose(fid);
end