resource "aws_vpc" "test1" {
  cidr_block = "10.0.0.0/16"
}



resource "aws_dynamodb_table" "tf_state_lock" {
  name           = "TerraformStateLock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "dynamodb-tf-state-lock"
  }
}
