function [cluster,cluster_num] = Obtain_cluster(mir_cluster,miRNAs)
ID=find(strcmp(mir_cluster,'ID')); 
miRNA_cluster=cell(1,length(ID));
for i = 1 : length(ID)-1
    miRNA_cluster{1,i} = mir_cluster(ID(i):(ID(i+1)-1),1);    
end
miRNA_cluster{1,length(ID)} = mir_cluster(ID(length(ID)):length(mir_cluster),1);

count_cluster =0;
cluster = cell(1,1);
cluster_num = zeros(1,1);

for i = 1 : length(miRNA_cluster)    
        set = intersect(miRNA_cluster{1,i},miRNAs);
        if ~isempty(set)
            count_cluster = count_cluster+1;   
            cluster{1,count_cluster} = set;     
            cluster_num(1,count_cluster) = length(set);   
           
       end
end


