alias gb=GetBuckets
alias gb2=GetBuckets2
alias gb3=GetBuckets3
GetBuckets () {
    aws s3 ls | awk '{print $3}'
}

GetBuckets2 () {
    aws s3 ls s3://$1 | awk '{print $4}'
}

GetBuckets3 () {
    aws s3 cp s3://$1/$2 $2
}

