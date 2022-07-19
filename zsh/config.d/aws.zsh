alias aconf="nvim $HOME/.aws/config"
alias acred="nvim $HOME/.aws/credentials"

CloudUser() {

#    sed -i '6d' ~/.aws/credentials
#:%s/=.*/
#    perl -p -i -e 's/=.*/g if $. == 6' ~/.aws/credentials
#    perl -p -i -e 's/= /= '$1'/g if $. == 6' ~/.aws/credentials
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

OpenWebAddress() {
    echo "http://$1.s3-website-us-east-1.amazonaws.com/"
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
