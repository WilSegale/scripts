ls -a
read -p "input the file name: " FileName
fcrackzip -u -D -p rockyou.txt $FileName
unzip $FileName
