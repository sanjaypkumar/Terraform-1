

resource "aws_s3_bucket" "test" {
  bucket = "aws-s3-bucket-reg1"


}

resource "aws_s3_bucket" "test2" {
  bucket   = "aws-s3-bucket-reg2"
  provider = aws.Hyderabad
}
