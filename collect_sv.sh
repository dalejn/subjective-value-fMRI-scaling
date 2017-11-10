sv=(*scan1*reg_sv) #collect sv files                                                  

#Collect subject IDs

#find ./ -type f -printf '%f\n'| cut -d_ -f 2 | sort | uniq > subs.txt

#Collect SV values in 3rd column

for file in ${sv[@]}; do
    echo $file
    awk {'print $3'} $file > c3 #print 3rd column                               
    paste c3 > $file.rawc3
done

#Concatenate files by subject ID

while read line
do
    cat *$line*c3 > ${line}_sv.txt
    echo $line.sv
done<subs.txt

#Process z-scored SVs
cp subs.txt zscore_files.txt
sed -e 's/$/_sv/' -i zscore_files.txt
sed -i -e 's/^/zscore./' zscore_files.txt