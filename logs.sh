USERID=$(id -u)
LOG_FOLDER="/var/log/shellscript-log"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%D-%H-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIME_STAMP.log" 

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failure"
        exit1
    else
        echo  "$2 is success" &>>$LOG_FILE_NAME
    fi
}

echo "script started excuted at :: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then 
    echo "error:: need sudo access to excute"
    exit1
fi

dnf list installed mysql &>>$LOG_FILE_NAME

 if [ $? -ne 0 ]
 then 
    dnf intall mysql -y 
else
    echo "mysql is already installed" &>>$LOG_FILE_NAME
fi


if [ $? -ne 0 ]
then 
    dnf install git -y 
else
    echo  "git is already installed" &>>$LOG_FILE_NAME
fi 
