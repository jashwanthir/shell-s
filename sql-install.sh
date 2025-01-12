USERID=$(id -u)

if [ $USERID ne 0 ]
then 
    echo "error :: you must have sudo access to excute"
    exit 1
fi

dnf list installed mysql

if  [ $? -ne 0]
then
    dnf install mysql -y
    if [ $? -ne 0]
    then 
        echo "mysql failed to install"
        exit 1
    else
        echo "mysql is successfull installed"
    fi
else
    echo "mysql is already installed"
fi