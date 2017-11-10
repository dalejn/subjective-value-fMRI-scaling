zscore=`cat zscore_files.txt`

for f in ${zscore[@]};do
    echo $f
    split -l 30 -d  $f.txt $f
done