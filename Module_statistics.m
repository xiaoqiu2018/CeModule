function [ unique_lncRNA,unique_miRNA, unique_mRNA] = Module_statistics( Ce_module )
    [rows,~]=size(Ce_module);
    unique_lncRNA=cell(1,1);
    unique_miRNA=cell(1,1);
    unique_mRNA=cell(1,1);
    idx =0;
    for i=1:rows
         num = size(Ce_module{i,1},1);
         unique_lncRNA(idx+1:idx+num,1)=Ce_module{i,1};
         idx=idx+num;
    end

    idx =0;
    for i=1:rows
         num = size(Ce_module{i,2},1);
         unique_miRNA(idx+1:idx+num,1)=Ce_module{i,2};
         idx=idx+num;
    end

    idx =0;
    for i=1:rows
         num = size(Ce_module{i,3},1);
         unique_mRNA(idx+1:idx+num,1)=Ce_module{i,3};
         idx=idx+num;
    end
    disp(['avg_lncRNA:', num2str(length(unique_lncRNA)/rows)]);
    disp(['avg_miRNA:', num2str(length(unique_miRNA)/rows)]);
    disp(['avg_mRNA:', num2str(length(unique_mRNA)/rows)]);

    unique_lncRNA = unique(unique_lncRNA);
    unique_miRNA = unique(unique_miRNA);
    unique_mRNA = unique(unique_mRNA);

end

