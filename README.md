# CeModule

Code Description
1. CeModule.m     
input:     
X1 (S,N1): S (sample) x N1 (lncRNA) non negative input matrix;     
X2 (S,N2): S (sample) x N2 (miRNA) non negative input matrix;     
X3 (S,N3): S (sample) x N3 (mRNA) non negative input matrix;     
A,B,C: miRNA-lncRNA,miRNA-mRNA and mRNA-mRNA adjacent matrices;     
a        : control the trade-off of Hi;     
L1, L2, L3      : weight the must link constraints in A,B,B;     
r1       : limit the growth of W;     
r2       : limit the growth of H1, H2 and H3;     
K        : Number of components;     
output:     
W        : S x K matrix;     
H1       : N1 x K matrix;     
H2       : N2 x K matrix;     
H3       : N3 x K matrix;     

2. CeModule_modules.m     
input:     
W          : common basis matrix;     
H1,H2,H3   : coefficient matrices;     
T          : a given threshold for z-score;     
lncRNAs, miRNAs, mRNAs        :list of all lncRNAs, miRNAs, mRNAs;          
output:     
Co_module : the index list of lncRNAs, miRNAs and mRNAs in a module.    


3. Consturct_network.m        
input:     
Co_module : the index list of lncRNAs, microRNAs and Genes in a Co-module;     
lncRNAs, miRNAs, mRNAs        :list of all lncRNAs, miRNAs, mRNAs;       
miRNA2lncRNA        : miRNA-lncRNA adjacent matrix;     
miRNA2mRNA        : miRNA-mRNA adjacent matrix;     
mRNA2mRNA           : mRNA-mRNA probability matrix;     
output:     
sub_network : the interactions among lncRNAs, miRNAs and mRNAs in the identified modules.


4. Module_statistics.m  : obtain the lncRNAs,miRNAs and mRNAs in the identified modules

5. Obtain_cluster.m     : obatin the miRNA cluster results according to those miRNAs in each module

6. Output_modules.m     : output the identified modules           


Recommend running on MATLAB 2010 or newer version.


