# resource "aws_iam_policy" "s3_policy" {
#   name        = "s3_policy"
#   # description = "IAM policy for static website"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:GetObject",
#           "s3:ListBucket",
#           "s3:PutBucketPolicy",
#           "s3:PutBucketAcl",
#         ],
#         Resource = [
#           "${aws_s3_bucket.my_bucket.arn}",
#           "${aws_s3_bucket.my_bucket.arn}/*",
#           "arn:aws:s3:::${var.bucket_name}",
#         ]
#       }
#     ]


#   })
# }


data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.my_bucket.arn}/*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:PutBucketPolicy"]
    resources = ["arn:aws:s3:::${var.bucket_name}"]

    principals {
      type        = "*"
      identifiers = ["*"]
    
    }
  }
}