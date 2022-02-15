provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "docking_bay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "8926d81922b117c9875594f77b2d936842e7f657"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-15 21:23:21"
    git_last_modified_by = "99744293+t1clausen@users.noreply.github.com"
    git_modifiers        = "99744293+t1clausen"
    git_org              = "t1clausen"
    git_repo             = "terragoat"
    yor_trace            = "b4a9db73-15e9-446c-87a4-b2ab9a08f303"
  }
}
