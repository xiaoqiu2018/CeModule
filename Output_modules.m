function Output_modules( Ce_module,unique_lncRNA,unique_miRNA, unique_mRNA )
       [rows, ~] = size (Ce_module);  
       path=cd;
       for i = 1:rows
          fid=fopen ([path,'\ModuleList\module_',int2str(i),'.txt'], 'w');
          fprintf(fid, 'Module #%d \t',i);
          
          fprintf(fid, '\n[miRNAs]\n'); 
          for j = 1:length(Ce_module{i,2}) % miRNAs
               fprintf(fid, '%s', Ce_module{i,2}{j});  
               fprintf(fid, '\n'); 
          end
          fprintf(fid, '\n[lncRNAs]\n'); 
          for j = 1:length(Ce_module{i,1}) % lncRNAs
               fprintf(fid, '%s', Ce_module{i,1}{j});    
               fprintf(fid, '\n'); 
          end
          fprintf(fid, '\n[genes]\n'); 
          for j = 1:length(Ce_module{i,3}) % mRNAs
               fprintf(fid, '%s', Ce_module{i,3}{j});    
               fprintf(fid, '\n'); 
           end
         fclose(fid); 
       end
                 
       [rows, ~] = size (unique_lncRNA);   
       fid=fopen ([path,'\ModuleList\unique_lncRNAs.txt'], 'w');      
       fprintf(fid, '[unique_lncRNA_list]\n'); 
       for i = 1:rows          
               fprintf(fid, '%s', unique_lncRNA{i,1});  
               fprintf(fid, '\n');           
       end
       fclose(fid);       

       [rows, ~] = size (unique_miRNA);   
       fid=fopen ([path,'\ModuleList\unique_miRNAs.txt'], 'w');      
       fprintf(fid, '[unique_miRNA_list]\n'); 
       for i = 1:rows          
               fprintf(fid, '%s', unique_miRNA{i,1});  
               fprintf(fid, '\n');           
       end
       fclose(fid);
       
       [rows, ~] = size (unique_mRNA);   
       fid=fopen ([path,'\ModuleList\unique_mRNAs.txt'], 'w');      
       fprintf(fid, '[unique_mRNA_list]\n'); 
       for i = 1:rows          
               fprintf(fid, '%s', unique_mRNA{i,1});  
               fprintf(fid, '\n');           
       end       
       fclose(fid);      
       
end


