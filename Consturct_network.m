function [ sub_network ] = Consturct_network( Ce_module,lncRNAs,miRNAs,mRNAs,miRNA2lncRNA,miRNA2mRNA,mRNA2mRNA )
%
% INPUT
% Co_module : the index list of lncRNAs, microRNAs and Genes in a Co-module.
% lncRNAs, miRNAs, mRNAs        :list of all lncRNAs, miRNAs, mRNAs  
% miRNA2lncRNA        : miRNA-lncRNA adjacent matrix
% miRNA2mRNA        : miRNA-mRNA adjacent matrix
% mRNA2mRNA           : mRNA-mRNA probability matrix 
%
% OUTPUT
% sub_network : the interactions among lncRNAs, miRNAs and mRNAs in the identified modules.

    rows = size(Ce_module,1);
    idx =0;
    sub_network = cell(0,3);
    for k=1:rows 
         idx=idx+1;
         sub_network(idx,1)={strcat('# Module_',num2str(k))};
         sub_network(idx,2)={''};
         sub_network(idx,3)={''};  

        lncRNA_size=length(Ce_module{k,1});
        miRNA_size=length(Ce_module{k,2});
        mRNA_size=length(Ce_module{k,3});  

        for i=1:miRNA_size        
            row_idx = strcmpi(miRNAs,Ce_module{k,2}(i));        
            for j=1:lncRNA_size    % miRNA-lncRNA
                col_idx = strcmpi(lncRNAs,Ce_module{k,1}(j));
                if miRNA2lncRNA(row_idx,col_idx)==1  % determine whether the interaction exists in matrix miRNA2lncRNA  
                    idx=idx+1;
                    sub_network(idx,1)=Ce_module{k,2}(i); % miRNA
                    sub_network(idx,2)=Ce_module{k,1}(j); % lncRNA
                    sub_network(idx,3)={'1'}; % label 
                end 
            end        
            for j=1:mRNA_size   % miRNA-mRNA
                col_idx = strcmpi(mRNAs,Ce_module{k,3}(j)); 
                if miRNA2mRNA(row_idx,col_idx)==1  % determine whether the interaction exists in matrix  miRNA2mRNA
                    idx=idx+1;
                    sub_network(idx,1)=Ce_module{k,2}(i); % miRNA
                    sub_network(idx,2)=Ce_module{k,3}(j); % mRNA
                    sub_network(idx,3)={'2'}; % label 
                end 
            end        
        end

        % mRNA-mRNA 
        for i=1:mRNA_size   
            row_idx = strcmpi(mRNAs,Ce_module{k,3}(i));
            for j=i+1:mRNA_size   
                    col_idx = strcmpi(mRNAs,Ce_module{k,3}(j));
                    if mRNA2mRNA(row_idx,col_idx)~=0  % determine whether the interaction exists in matrix  mRNA2mRNA
                        idx=idx+1;
                        sub_network(idx,1)=Ce_module{k,3}(i); % mRNA
                        sub_network(idx,2)=Ce_module{k,3}(j); % mRNA
                        sub_network(idx,3)={'3'}; % label                 
                    end 
            end
        end     
    end

end

