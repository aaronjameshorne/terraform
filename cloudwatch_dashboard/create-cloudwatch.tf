  
terraform {
  backend "s3" {
      bucket   = "terraform-envs-state-files"
      key      = "terraform.tfstate"
      region   = "us-east-1"

  }
}

provider "aws"{
    region   = "us-east-1"
}

#Var used within the Dashboard
variable "ec2-instance"{
    type = "string"
    default = "i-01dcd7b61c516bcc0"
}

#Cloudwatch Dashboard
resource "aws_cloudwatch_dashboard" "starter-dashboard" {
    dashboard_name = "dashboard-${var.ec2-instance}"

    dashboard_body = <<EOF
    {
      "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "AWS/EC2",
            "CPUUtilization",
            "InstanceId",
            "${var.ec2-instance}"
          ]
        ],
        "period": 300,
        "stat": "Average",
        "region": "us-east-1",
        "title": "EC2 ${var.ec2-instance} - CPU"
      }
    },
    {
      "type": "text",
      "x": 0,
      "y": 7,
      "width": 3,
      "height": 3,
      "properties": {
        "markdown": "Hello world"
      }
    }
  ]
    }
    EOF
}

#Cloudwatch Alarm
resource "aws_cloudwatch_metric_alarm" "ec2-cpu-80" {
  alarm_name                = "test-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "3"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "Monitora CPU metric"


}