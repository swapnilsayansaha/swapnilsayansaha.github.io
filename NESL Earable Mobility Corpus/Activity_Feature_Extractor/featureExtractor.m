%this code automatically extracts features of your choice and appends them
%to CSV files.

%make sure to have feature functions ready.

numSubFolders = 15;
stridelength = 0.5; %stride of 0.5 seconds (default param)
windowlength = 1; %window length of 1 seconds (default param)
for i = 1:numSubFolders
    %activity data folder path:
    myFolder = strcat('C:\Users\swapn\Desktop\feature codes\okFeatures\Sliced Activity Data\', num2str(i));
    myfiles = dir(myFolder);
    filenames={myfiles(:).name}';
    filefolders={myfiles(:).folder}';
    filenames=filenames(endsWith(filenames,'.csv'));
    filefolders=filefolders(endsWith(filenames,'.csv'));
    files=fullfile(filefolders,filenames);
    for j = 1:length(files)
        signalLabeltemp = char(filenames(j));
        signalLabel = signalLabeltemp(1,end-4);
        if (signalLabeltemp(1,end-5) ~= '_')
            signalLabel = signalLabeltemp(1,end-5:end-4);
        end
        switch signalLabel
            case 'W'
                signalLabel = 1;
            case 'R'
                signalLabel = 2;
            case 'J'
                signalLabel = 3;
            case 'St'
                signalLabel = 4;
            case 'Tl'
                signalLabel = 5;
            case 'Tr'
                signalLabel = 6;
            case 'Si'
                signalLabel = 7;
            case 'L'
                signalLabel = 8;
            case 'F'
                signalLabel = 9;
        end
        temp = readmatrix(string(files(j,1)));
        timelength = temp(end,7)-temp(1,7);
        timelength =  floor(timelength * (1/stridelength)) / (1/stridelength);
        for k = windowlength:stridelength:timelength
            [~, lowerbound] = min(abs(temp(:,7)-(k-windowlength)));
            [~, upperbound] = min(abs(temp(:,7)-(k)));
            sigWindow = temp(lowerbound:upperbound,:);
            if size(sigWindow) ~= 1
                accVecSum = sqrt(sigWindow(:,1).^2 + sigWindow(:,2).^2 + sigWindow(:,3).^2);
                gyrVecSum = sqrt(sigWindow(:,4).^2 + sigWindow(:,5).^2 + sigWindow(:,6).^2);
                Feat(:,1) = FeatureDS(sigWindow(:,1)');
                Feat(:,2) = FeatureEntropy(sigWindow(:,1)');
                Feat(:,3) = FeatureIntegration(sigWindow(:,1)',sigWindow(:,7)');
                Feat(:,4) = FeatureIQR(sigWindow(:,1)');
                Feat(:,5) = FeatureKurtosis(sigWindow(:,1)');
                Feat(:,6) = FeatureMad(sigWindow(:,1)');
                Feat(:,7) = FeatureMax(sigWindow(:,1)');
                Feat(:,8) = FeatureMean(sigWindow(:,1)');
                Feat(:,9) = FeatureMeanAutoCor(sigWindow(:,1)');
                Feat(:,10) = FeatureMeanMovMad(sigWindow(:,1)');
                Feat(:,11) = FeatureMeanMovMax(sigWindow(:,1)');
                Feat(:,12) = FeatureMeanMovMean(sigWindow(:,1)');
                Feat(:,13) = FeatureMeanMovMedian(sigWindow(:,1)');
                Feat(:,14) = FeatureMeanMovMin(sigWindow(:,1)');
                Feat(:,15) = FeatureMeanMovStd(sigWindow(:,1)');
                Feat(:,16) = FeatureMeanMovVar(sigWindow(:,1)');
                Feat(:,17) = FeatureMeanVecNorm(sigWindow(:,1)');
                Feat(:,18) = FeatureMeanZScore(sigWindow(:,1)');
                Feat(:,19) = FeatureMedian(sigWindow(:,1)');
                Feat(:,20) = FeatureMin(sigWindow(:,1)');
                Feat(:,21) = FeatureNorm(sigWindow(:,1)');
                Feat(:,22) = FeaturePearsonCC(sigWindow(:,1)');
                Feat(:,23) = FeatureRange(sigWindow(:,1)');
                Feat(:,24) = FeatureSkewness(sigWindow(:,1)');
                Feat(:,25) = FeatureSlopeSC(sigWindow(:,1)');
                Feat(:,26) = FeatureSMA(sigWindow(:,1)');
                Feat(:,27) = FeatureSTD(sigWindow(:,1)');
                Feat(:,28) = FeatureVar(sigWindow(:,1)');
                Feat(:,29) = FeatureVariation(sigWindow(:,1)');
                Feat(:,30) = FeatureZC(sigWindow(:,1)');
                Feat(:,31) = FeatureDS(sigWindow(:,2)');
                Feat(:,32) = FeatureEntropy(sigWindow(:,2)');
                Feat(:,33) = FeatureIntegration(sigWindow(:,2)',sigWindow(:,7)');
                Feat(:,34) = FeatureIQR(sigWindow(:,2)');
                Feat(:,35) = FeatureKurtosis(sigWindow(:,2)');
                Feat(:,36) = FeatureMad(sigWindow(:,2)');
                Feat(:,37) = FeatureMax(sigWindow(:,2)');
                Feat(:,38) = FeatureMean(sigWindow(:,2)');
                Feat(:,39) = FeatureMeanAutoCor(sigWindow(:,2)');
                Feat(:,40) = FeatureMeanMovMad(sigWindow(:,2)');
                Feat(:,41) = FeatureMeanMovMax(sigWindow(:,2)');
                Feat(:,42) = FeatureMeanMovMean(sigWindow(:,2)');
                Feat(:,43) = FeatureMeanMovMedian(sigWindow(:,2)');
                Feat(:,44) = FeatureMeanMovMin(sigWindow(:,2)');
                Feat(:,45) = FeatureMeanMovStd(sigWindow(:,2)');
                Feat(:,46) = FeatureMeanMovVar(sigWindow(:,2)');
                Feat(:,47) = FeatureMeanVecNorm(sigWindow(:,2)');
                Feat(:,48) = FeatureMeanZScore(sigWindow(:,2)');
                Feat(:,49) = FeatureMedian(sigWindow(:,2)');
                Feat(:,50) = FeatureMin(sigWindow(:,2)');
                Feat(:,51) = FeatureNorm(sigWindow(:,2)');
                Feat(:,52) = FeaturePearsonCC(sigWindow(:,2)');
                Feat(:,53) = FeatureRange(sigWindow(:,2)');
                Feat(:,54) = FeatureSkewness(sigWindow(:,2)');
                Feat(:,55) = FeatureSlopeSC(sigWindow(:,2)');
                Feat(:,56) = FeatureSMA(sigWindow(:,2)');
                Feat(:,57) = FeatureSTD(sigWindow(:,2)');
                Feat(:,58) = FeatureVar(sigWindow(:,2)');
                Feat(:,59) = FeatureVariation(sigWindow(:,2)');
                Feat(:,60) = FeatureZC(sigWindow(:,2)');
                Feat(:,61) = FeatureDS(sigWindow(:,3)');
                Feat(:,62) = FeatureEntropy(sigWindow(:,3)');
                Feat(:,63) = FeatureIntegration(sigWindow(:,3)',sigWindow(:,7)');
                Feat(:,64) = FeatureIQR(sigWindow(:,3)');
                Feat(:,65) = FeatureKurtosis(sigWindow(:,3)');
                Feat(:,66) = FeatureMad(sigWindow(:,3)');
                Feat(:,67) = FeatureMax(sigWindow(:,3)');
                Feat(:,68) = FeatureMean(sigWindow(:,3)');
                Feat(:,69) = FeatureMeanAutoCor(sigWindow(:,3)');
                Feat(:,70) = FeatureMeanMovMad(sigWindow(:,3)');
                Feat(:,71) = FeatureMeanMovMax(sigWindow(:,3)');
                Feat(:,72) = FeatureMeanMovMean(sigWindow(:,3)');
                Feat(:,73) = FeatureMeanMovMedian(sigWindow(:,3)');
                Feat(:,74) = FeatureMeanMovMin(sigWindow(:,3)');
                Feat(:,75) = FeatureMeanMovStd(sigWindow(:,3)');
                Feat(:,76) = FeatureMeanMovVar(sigWindow(:,3)');
                Feat(:,77) = FeatureMeanVecNorm(sigWindow(:,3)');
                Feat(:,78) = FeatureMeanZScore(sigWindow(:,3)');
                Feat(:,79) = FeatureMedian(sigWindow(:,3)');
                Feat(:,80) = FeatureMin(sigWindow(:,3)');
                Feat(:,81) = FeatureNorm(sigWindow(:,3)');
                Feat(:,82) = FeaturePearsonCC(sigWindow(:,3)');
                Feat(:,83) = FeatureRange(sigWindow(:,3)');
                Feat(:,84) = FeatureSkewness(sigWindow(:,3)');
                Feat(:,85) = FeatureSlopeSC(sigWindow(:,3)');
                Feat(:,86) = FeatureSMA(sigWindow(:,3)');
                Feat(:,87) = FeatureSTD(sigWindow(:,3)');
                Feat(:,88) = FeatureVar(sigWindow(:,3)');
                Feat(:,89) = FeatureVariation(sigWindow(:,3)');
                Feat(:,90) = FeatureZC(sigWindow(:,3)');
                Feat(:,91) = FeatureDS(sigWindow(:,4)');
                Feat(:,92) = FeatureEntropy(sigWindow(:,4)');
                Feat(:,93) = FeatureIntegration(sigWindow(:,4)',sigWindow(:,7)');
                Feat(:,94) = FeatureIQR(sigWindow(:,4)');
                Feat(:,95) = FeatureKurtosis(sigWindow(:,4)');
                Feat(:,96) = FeatureMad(sigWindow(:,4)');
                Feat(:,97) = FeatureMax(sigWindow(:,4)');
                Feat(:,98) = FeatureMean(sigWindow(:,4)');
                Feat(:,99) = FeatureMeanAutoCor(sigWindow(:,4)');
                Feat(:,100) = FeatureMeanMovMad(sigWindow(:,4)');
                Feat(:,101) = FeatureMeanMovMax(sigWindow(:,4)');
                Feat(:,102) = FeatureMeanMovMean(sigWindow(:,4)');
                Feat(:,103) = FeatureMeanMovMedian(sigWindow(:,4)');
                Feat(:,104) = FeatureMeanMovMin(sigWindow(:,4)');
                Feat(:,105) = FeatureMeanMovStd(sigWindow(:,4)');
                Feat(:,106) = FeatureMeanMovVar(sigWindow(:,4)');
                Feat(:,107) = FeatureMeanVecNorm(sigWindow(:,4)');
                Feat(:,108) = FeatureMeanZScore(sigWindow(:,4)');
                Feat(:,109) = FeatureMedian(sigWindow(:,4)');
                Feat(:,110) = FeatureMin(sigWindow(:,4)');
                Feat(:,111) = FeatureNorm(sigWindow(:,4)');
                Feat(:,112) = FeaturePearsonCC(sigWindow(:,4)');
                Feat(:,113) = FeatureRange(sigWindow(:,4)');
                Feat(:,114) = FeatureSkewness(sigWindow(:,4)');
                Feat(:,115) = FeatureSlopeSC(sigWindow(:,4)');
                Feat(:,116) = FeatureSMA(sigWindow(:,4)');
                Feat(:,117) = FeatureSTD(sigWindow(:,4)');
                Feat(:,118) = FeatureVar(sigWindow(:,4)');
                Feat(:,119) = FeatureVariation(sigWindow(:,4)');
                Feat(:,120) = FeatureZC(sigWindow(:,4)');
                Feat(:,121) = FeatureDS(sigWindow(:,5)');
                Feat(:,122) = FeatureEntropy(sigWindow(:,5)');
                Feat(:,123) = FeatureIntegration(sigWindow(:,5)',sigWindow(:,7)');
                Feat(:,124) = FeatureIQR(sigWindow(:,5)');
                Feat(:,125) = FeatureKurtosis(sigWindow(:,5)');
                Feat(:,126) = FeatureMad(sigWindow(:,5)');
                Feat(:,127) = FeatureMax(sigWindow(:,5)');
                Feat(:,128) = FeatureMean(sigWindow(:,5)');
                Feat(:,129) = FeatureMeanAutoCor(sigWindow(:,5)');
                Feat(:,130) = FeatureMeanMovMad(sigWindow(:,5)');
                Feat(:,131) = FeatureMeanMovMax(sigWindow(:,5)');
                Feat(:,132) = FeatureMeanMovMean(sigWindow(:,5)');
                Feat(:,133) = FeatureMeanMovMedian(sigWindow(:,5)');
                Feat(:,134) = FeatureMeanMovMin(sigWindow(:,5)');
                Feat(:,135) = FeatureMeanMovStd(sigWindow(:,5)');
                Feat(:,136) = FeatureMeanMovVar(sigWindow(:,5)');
                Feat(:,137) = FeatureMeanVecNorm(sigWindow(:,5)');
                Feat(:,138) = FeatureMeanZScore(sigWindow(:,5)');
                Feat(:,139) = FeatureMedian(sigWindow(:,5)');
                Feat(:,140) = FeatureMin(sigWindow(:,5)');
                Feat(:,141) = FeatureNorm(sigWindow(:,5)');
                Feat(:,142) = FeaturePearsonCC(sigWindow(:,5)');
                Feat(:,143) = FeatureRange(sigWindow(:,5)');
                Feat(:,144) = FeatureSkewness(sigWindow(:,5)');
                Feat(:,145) = FeatureSlopeSC(sigWindow(:,5)');
                Feat(:,146) = FeatureSMA(sigWindow(:,5)');
                Feat(:,147) = FeatureSTD(sigWindow(:,5)');
                Feat(:,148) = FeatureVar(sigWindow(:,5)');
                Feat(:,149) = FeatureVariation(sigWindow(:,5)');
                Feat(:,150) = FeatureZC(sigWindow(:,5)');
                Feat(:,151) = FeatureDS(sigWindow(:,6)');
                Feat(:,152) = FeatureEntropy(sigWindow(:,6)');
                Feat(:,153) = FeatureIntegration(sigWindow(:,6)',sigWindow(:,7)');
                Feat(:,154) = FeatureIQR(sigWindow(:,6)');
                Feat(:,155) = FeatureKurtosis(sigWindow(:,6)');
                Feat(:,156) = FeatureMad(sigWindow(:,6)');
                Feat(:,157) = FeatureMax(sigWindow(:,6)');
                Feat(:,158) = FeatureMean(sigWindow(:,6)');
                Feat(:,159) = FeatureMeanAutoCor(sigWindow(:,6)');
                Feat(:,160) = FeatureMeanMovMad(sigWindow(:,6)');
                Feat(:,161) = FeatureMeanMovMax(sigWindow(:,6)');
                Feat(:,162) = FeatureMeanMovMean(sigWindow(:,6)');
                Feat(:,163) = FeatureMeanMovMedian(sigWindow(:,6)');
                Feat(:,164) = FeatureMeanMovMin(sigWindow(:,6)');
                Feat(:,165) = FeatureMeanMovStd(sigWindow(:,6)');
                Feat(:,166) = FeatureMeanMovVar(sigWindow(:,6)');
                Feat(:,167) = FeatureMeanVecNorm(sigWindow(:,6)');
                Feat(:,168) = FeatureMeanZScore(sigWindow(:,6)');
                Feat(:,169) = FeatureMedian(sigWindow(:,6)');
                Feat(:,170) = FeatureMin(sigWindow(:,6)');
                Feat(:,171) = FeatureNorm(sigWindow(:,6)');
                Feat(:,172) = FeaturePearsonCC(sigWindow(:,6)');
                Feat(:,173) = FeatureRange(sigWindow(:,6)');
                Feat(:,174) = FeatureSkewness(sigWindow(:,6)');
                Feat(:,175) = FeatureSlopeSC(sigWindow(:,6)');
                Feat(:,176) = FeatureSMA(sigWindow(:,6)');
                Feat(:,177) = FeatureSTD(sigWindow(:,6)');
                Feat(:,178) = FeatureVar(sigWindow(:,6)');
                Feat(:,179) = FeatureVariation(sigWindow(:,6)');
                Feat(:,180) = FeatureZC(sigWindow(:,6)');
                Feat(:,181) = FeatureDS(accVecSum');
                Feat(:,182) = FeatureEntropy(accVecSum');
                Feat(:,183) = FeatureIntegration(accVecSum',sigWindow(:,7)');
                Feat(:,184) = FeatureIQR(accVecSum');
                Feat(:,185) = FeatureKurtosis(accVecSum');
                Feat(:,186) = FeatureMad(accVecSum');
                Feat(:,187) = FeatureMax(accVecSum');
                Feat(:,188) = FeatureMean(accVecSum');
                Feat(:,189) = FeatureMeanAutoCor(accVecSum');
                Feat(:,190) = FeatureMeanMovMad(accVecSum');
                Feat(:,191) = FeatureMeanMovMax(accVecSum');
                Feat(:,192) = FeatureMeanMovMean(accVecSum');
                Feat(:,193) = FeatureMeanMovMedian(accVecSum');
                Feat(:,194) = FeatureMeanMovMin(accVecSum');
                Feat(:,195) = FeatureMeanMovStd(accVecSum');
                Feat(:,196) = FeatureMeanMovVar(accVecSum');
                Feat(:,197) = FeatureMeanVecNorm(accVecSum');
                Feat(:,198) = FeatureMeanZScore(accVecSum');
                Feat(:,199) = FeatureMedian(accVecSum');
                Feat(:,200) = FeatureMin(accVecSum');
                Feat(:,201) = FeatureNorm(accVecSum');
                Feat(:,202) = FeaturePearsonCC(accVecSum');
                Feat(:,203) = FeatureRange(accVecSum');
                Feat(:,204) = FeatureSkewness(accVecSum');
                Feat(:,205) = FeatureSlopeSC(accVecSum');
                Feat(:,206) = FeatureSMA(accVecSum');
                Feat(:,207) = FeatureSTD(accVecSum');
                Feat(:,208) = FeatureVar(accVecSum');
                Feat(:,209) = FeatureVariation(accVecSum');
                Feat(:,210) = FeatureZC(accVecSum');
                Feat(:,211) = FeatureDS(gyrVecSum');
                Feat(:,212) = FeatureEntropy(gyrVecSum');
                Feat(:,213) = FeatureIntegration(gyrVecSum',sigWindow(:,7)');
                Feat(:,214) = FeatureIQR(gyrVecSum');
                Feat(:,215) = FeatureKurtosis(gyrVecSum');
                Feat(:,216) = FeatureMad(gyrVecSum');
                Feat(:,217) = FeatureMax(gyrVecSum');
                Feat(:,218) = FeatureMean(gyrVecSum');
                Feat(:,219) = FeatureMeanAutoCor(gyrVecSum');
                Feat(:,220) = FeatureMeanMovMad(gyrVecSum');
                Feat(:,211) = FeatureMeanMovMax(gyrVecSum');
                Feat(:,222) = FeatureMeanMovMean(gyrVecSum');
                Feat(:,223) = FeatureMeanMovMedian(gyrVecSum');
                Feat(:,224) = FeatureMeanMovMin(gyrVecSum');
                Feat(:,225) = FeatureMeanMovStd(gyrVecSum');
                Feat(:,226) = FeatureMeanMovVar(gyrVecSum');
                Feat(:,227) = FeatureMeanVecNorm(gyrVecSum');
                Feat(:,228) = FeatureMeanZScore(gyrVecSum');
                Feat(:,229) = FeatureMedian(gyrVecSum');
                Feat(:,230) = FeatureMin(gyrVecSum');
                Feat(:,231) = FeatureNorm(gyrVecSum');
                Feat(:,232) = FeaturePearsonCC(gyrVecSum');
                Feat(:,233) = FeatureRange(gyrVecSum');
                Feat(:,234) = FeatureSkewness(gyrVecSum');
                Feat(:,235) = FeatureSlopeSC(gyrVecSum');
                Feat(:,236) = FeatureSMA(gyrVecSum');
                Feat(:,237) = FeatureSTD(gyrVecSum');
                Feat(:,238) = FeatureVar(gyrVecSum');
                Feat(:,239) = FeatureVariation(gyrVecSum');
                Feat(:,240) = FeatureZC(gyrVecSum');
                Feat(:,241) = FeaturetimeWindow(sigWindow(:,7)');
                dlmwrite('FeatMat.csv',Feat,'-append');
                dlmwrite('Labelmat.csv',signalLabel,'-append');
                fprintf('Writing to files. k: %d, j: %d, i: %d\n',k,j,i);
            end
        end
    end
end
