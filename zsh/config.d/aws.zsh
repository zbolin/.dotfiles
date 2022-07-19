

alias aconf="nvim $HOME/.aws/config"
alias acred="nvim $HOME/.aws/credentials"
alias gb=GetBuckets
alias gb2=GetBuckets2
alias gb3=GetBuckets3
# GetBuckets | pbcopy
Hello() {
    echo "Hello $1"
}
CreateBucket() {
    aws s3api create-bucket --bucket $1 --region us-east-1 2>&1 > /dev/null
}

GetBuckets () {
    aws s3 ls | awk '{print $3}'
}

CopyFile () {
    aws s3 cp $2 s3://$1
}

ListBucket () {
    aws s3 ls s3://$1 | awk '{print $4}'
}

Website() {
    aws s3 website $1 --index-document index.html --error-document error.html
}
WebAddress() {
    echo "http://$1.s3-website-us-east-1.amazonaws.com/"
}
OpenWebAddress() {
    open "http://$1.s3-website-us-east-1.amazonaws.com/"
}
GetBucketPolicy () {
    aws s3api get-bucket-policy --bucket $1
}

PutBucketPolicy () {
    aws s3api put-bucket-policy --bucket $1 --policy file://$2
}

DeleteBucketFolderRecursive() {
    aws s3 rm s3://$1 --recursive
}

DeleteBucket() {
    aws s3api delete-bucket --bucket $1 --region us-east-1 2>&1 > /dev/null
}
