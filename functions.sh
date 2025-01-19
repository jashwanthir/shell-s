USERID=$(id -u)

VALIDATE(){
    if [$1 -ne 0]
    then
        echo " $2 is failure "
        exit1
    else
        echo " $2 is success "
    fi
}

if [ $USERID -ne 0 ]
then 
    echo " error-you must have sudo access to excute this script "
    exit1
fi
dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? " installing mysql "
else 
    echo " mysql already installed "
fi


if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? " installing git "
else
    echo " git already installed "
fi
