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

