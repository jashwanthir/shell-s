USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo " $2 is failure "
        exit1
    else
        echo " $2 is success "
    fi
}

if [ $USERID -ne 0 ]
then
    echo " $R error::you must have sudo access"
    exit 1
fi

if [ $? -ne 0 ]
then 
    dnf install mysql -y 
    exit 1
else 
    echo "mysql is already... $Y installed"
fi
 
if [ $? -ne 0 ]
then 
    dnf install git -y 
    exit 1
else 
    echo "git is already ... $Y installed "
fi