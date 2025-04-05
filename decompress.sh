#!/bin/zsh

ukb_dir="/disk/genetics/ukb/mahdimir"

out_dir="$ukb_dir/UKB_NON_PROJECT_DATA/UKBv3_raw_genotyped_decompressed"
mkdir -p $out_dir

src_dir="/disk/genetics/data/ukb/private/v3/raw/genotyped"

for file in $src_dir/ukb_cal_chr*_v2.bed.gz; do
    echo "Processing $file ..."
    base_name=$(basename "$file" .bed.gz)
    out_file="$out_dir/$base_name.bed"

    # Check if the decompressed .bed file already exists
    if [ -f "$out_file" ]; then
        echo "$out_file already exists. Skipping."
    else
        # Decompress the .bed.gz file directly into out_dir
        gzip -d -c "$file" > "$out_file"
        echo "Decompressed $file to $out_file"
    fi
done


for file in $src_dir/ukb_snp_chr*_v2.bim.gz; do
    echo "Processing $file ..."
    base_name=$(basename "$file" .bim.gz)
    out_file="$out_dir/$base_name.bim"

    # Check if the decompressed .bed file already exists
    if [ -f "$out_file" ]; then
        echo "$out_file already exists. Skipping."
    else
        # Decompress the .bed.gz file directly into out_dir
        gzip -d -c "$file" > "$out_file"
        echo "Decompressed $file to $out_file"
    fi
done


ln -s $src_dir/all.fam $out_dir/all.fam
