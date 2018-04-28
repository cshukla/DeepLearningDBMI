#shell script to download and extract all datasets
#download cbmc
mkdir -p data/cbmc
wget -P data/cbmc ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE100nnn/GSE100866/suppl/GSE100866%5FCBMC%5F8K%5F13AB%5F10X%2DRNA%5Fumi%2Ecsv%2Egz
wget -P data/cbmc ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE100nnn/GSE100866/suppl/GSE100866%5FCBMC%5F8K%5F13AB%5F10X%2DADT%5Fumi%2Ecsv%2Egz
wget -P data/cbmc ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE100nnn/GSE100866/suppl/GSE100866%5FCBMC%5F8K%5F13AB%5F10X%2DADT%5Fclr%2Dtransformed%2Ecsv%2Egz
gunzip data/cbmc/*
#download cortex data
mkdir -p data/cortex
wget -P data/cortex https://storage.googleapis.com/linnarsson-lab-www-blobs/blobs/cortex/expression_mRNA_17-Aug-2014.txt
#PBMC data
mkdir -p data/pbmc
wget -P data/pbmc https://github.com/romain-lopez/scVI-reproducibility/raw/master/additional/data.zip
unzip data/pbmc/data.zip PBMC/* -d data/pbmc
rm data/pbmc/data.zip
mv data/pbmc/PBMC/* data/pbmc
rmdir data/pbmc/PBMC
wget -P data/pbmc http://cf.10xgenomics.com/samples/cell-exp/2.1.0/pbmc8k/pbmc8k_filtered_gene_bc_matrices.tar.gz
wget -P data/pbmc http://cf.10xgenomics.com/samples/cell-exp/2.1.0/pbmc4k/pbmc4k_filtered_gene_bc_matrices.tar.gz
pushd data/pbmc
tar -xzf pbmc8k_filtered_gene_bc_matrices.tar.gz
mv filtered_gene_bc_matrices/GRCh38 pbmc8k
rmdir filtered_gene_bc_matrices
tar -xzf pbmc4k_filtered_gene_bc_matrices.tar.gz
mv filtered_gene_bc_matrices/GRCh38 pbmc4k
rmdir filtered_gene_bc_matrices
rm pbmc*k_filtered_gene_bc_matrices.tar.gz
popd