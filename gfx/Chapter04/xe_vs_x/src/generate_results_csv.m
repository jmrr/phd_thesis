fid = fopen('GLASS_xe_vs_x_results.csv','at');
% fid = fopen('overall_xe_vs_x_results.csv','at');

table = PerCorMethodTable;

fprintf(fid,'Method','Kernel','Mean error (cm), std_error (cm)\n');

str = '%s,%s,%.1f,%.1f\n';

for i = 1:size(table,1)
   
    Avg = mean(table{i,2}(:));
    st_dev = sqrt(sum(table{i,4}(:).^2))/length(table{i,4}(:)); % sqrt of sum of squared stdevs and divide by number of samples 
    fprintf(fid,str,table{i,5},table{i,6},Avg,st_dev);
    
end

fclose(fid)