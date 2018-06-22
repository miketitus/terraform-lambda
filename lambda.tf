resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "helloworld" {
  description      = "Hello World"
  filename         = "./.build/helloworld.zip"
  function_name    = "helloworld"
  handler          = "index.handler"
  role             = "${aws_iam_role.lambda_role.arn}"
  runtime          = "go1.x"
  source_code_hash = "${base64sha256(file("./.build/helloworld.zip"))}"

  tags {
    Terraform = "true"
  }
}
