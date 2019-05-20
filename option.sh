text="lz"
echo "ibase=16; $(echo $text |xxd -ps -u)" |bc