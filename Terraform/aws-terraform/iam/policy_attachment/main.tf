provider "aws" {
 region= "ap-south-1"
 access_key= "AKIAZSG7LV6DKH4INWFS"
 secret_key= "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"
}


resource "aws_iam_user" "testuser" {
  name = "jm"
}


resource "aws_iam_policy" "policy" {
  name        = "test_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.testuser.name
  policy_arn = aws_iam_policy.policy.arn
}

