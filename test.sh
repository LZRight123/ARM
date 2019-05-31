current=`date +%Y%m%d%H%M` 
 
timeStamp=`date -d "$current" +%s`   
#将current转换为时间戳，精确到毫秒  
currentTimeStamp=$((timeStamp*1000+`date "+%N"`/1000000)) 
echo $currentTimeStamp
