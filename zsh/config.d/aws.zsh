aws-profiles() {
  cat ~/.aws/credentials | grep '\[' | grep -v '#' | tr -d '[' | tr -d ']'
}

set-aws-profile() {
  local aws_profile=$1
  set -x
  export AWS_PROFILE=${aws_profile}
  set +x
}

set-aws-keys() {
  local aws_profile=$1
  profile_data=$(cat ~/.aws/credentials | grep "\[$aws_profile\]" -A4)
  AWS_ACCESS_KEY_ID="$(echo $profile_data | grep aws_access_key_id | cut -f2 -d'=' | tr -d ' ')"
  AWS_SECRET_ACCESS_KEY="$(echo $profile_data | grep aws_secret_access_key | cut -f2 -d'=' | tr -d ' ')"
  set -x
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
  set +x
}

alias aconf="nvim $HOME/.aws/config"
alias acred="nvim $HOME/.aws/credentials"

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

AddUserToGroup() {
    aws iam add-user-to-group --user-name $1 --group-name $2
}
