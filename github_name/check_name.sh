# 并发设置
Command="curl -s" # 待检测的进程的 关键字
MaxBingFaNum=100
SleepTime=3  # 检测进程数量的时间间隔
DownloadCount="1"
for Name in $(cat aaa.txt)
do
    DownloadCount=$((++DownloadCount))
    {
        curl -sI "https://github.com/$Name" | grep  -q "404 Not Found" && echo $Name >> ok.txt
    } &

    CurrentBingFaNum=$(ps -ef|grep "${Command}"|grep -v grep|wc -l|tr -d ' ')
    #echo 进行中的任务数: "${CurrentBingFaNum}"
    echo ${DownloadCount}
    while [ "${CurrentBingFaNum}" -gt "${MaxBingFaNum}" ]
    do
        echo -n .
        sleep ${SleepTime}
        CurrentBingFaNum=$(ps -ef|grep "${Command}"|grep -v grep|wc -l|tr -d ' ')
    done
done 
