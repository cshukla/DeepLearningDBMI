"""
Convert a dense matrix in a CSV into a sparse triplet format
genes in rows, cell barcodes in columns
"""
import csv

ifile = "data/cbmc/GSE100866_CBMC_8K_13AB_10X-RNA_umi.csv"
ofile = "data/cbmc/GSE100866_CBMC_8K_13AB_10X-RNA_umi_sparse.csv"

with open(ifile) as ifl, open(ofile,"w") as ofl:
    reader = csv.DictReader(ifl)
    writer = csv.writer(ofl)
    writer.writerow(("gene","cell_barcode","umi_count"))
    for row in reader:
        g = row.pop("") #first column with header "" is gene name
        for cell in row: #iterate over column headers (barcodes)
            umi = int(row[cell])
            if umi!=0: writer.writerow((g,cell,umi))