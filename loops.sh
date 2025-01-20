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

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then 
    echo " error-you must have sudo access to excute this script "
    exit 1
fi
}
CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed"
    fi