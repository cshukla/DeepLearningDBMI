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