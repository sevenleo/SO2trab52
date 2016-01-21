 for file in "$@" ; 
 do 
 if [ ! $# = 1 ] ; 
 then 
 echo ------- $file ------- ; echo 
 fi ; 
 if [ -d $file ] ; 
 then 
 ls -F $file 
 else 
 if [ "${file%.Z}x" = "${file}x" -a "${file%.z}x" = "${file}x" \ 
 -a "${file%.gz}x" = "${file}x" ] 
 then 
 more $file 
 else 
 if [ "${file%.bz2}x" = "${file}x" ] ; then 
 bzcat $file 
 else # [ "${file%.gz}x" = "${file}x" ] 
 gzcat $file | more 
 fi ; # bzip2 ou gzip 
 fi ; 
 fi ; 
 if [ ! $# = 1 ] ; 
 then 
 echo 
 fi ; 
 done ; 
exit 0