#find ./zscore.DMP*_sv?? -type f -printf '%f\n'| sort > zscore_split.txt

paste raw_split.txt zscore_split.txt | while IFS="$(printf '\t')" read -r f1 f2
do
    echo $f1 $f2
    awk {'print $1'} $f2 > c3
    awk {'printf ("%s\t%s\n", $1, $2)'} $f1 > c12
    paste c12 c3 > scan1$f2
done