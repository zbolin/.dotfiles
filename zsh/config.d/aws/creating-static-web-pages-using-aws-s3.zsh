CreateWebsite() {
    cd ~/GitProjects/z/aws/creating-static-web-pages-using-aws-s3
    CreateBucket my-bucket-$1
    CopyFile my-bucket-$1 index.html
    CopyFile my-bucket-$1 error.html
    Website my-bucket-$1
    tmp=$(mktemp)
    jq '.Statement[0].Resource[0] = "arn:aws:s3:::my-bucket-'$1'/*"' bucketpolicy.json > "tmp" && mv "tmp" bucketpolicy.json
    PutBucketPolicy my-bucket-$1 bucketpolicy.json
    OpenWebAddress my-bucket-$1
}

DestroyWebsite() {
    DeleteBucketFolderRecursive my-bucket-$1
    DeleteBucket my-bucket-$1
}

