#/bin/bash

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
        echo  "$2 is success" 
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then 
    echo "error:: need sudo access to excute"
    exit1
fi

dnf list installed mysql &>>$LOG_FILE_NAME

 if [ $? -ne 0 ]
 then 
    dnf install mysql -y 
    VALIDATE $? "Installing MySQL"
else
    echo "mysql is already installed" 
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then 
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing MySQL"
else
    echo  "git is already installed" 
fi 
