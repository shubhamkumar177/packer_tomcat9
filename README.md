# Creating Tomcat Image using Packer

This repository provides a Packer configuration file and a shell script to create a custom Tomcat image on AWS using Packer.

## Prerequisites

Before you begin, ensure that you have the following:

- Packer installed on your local machine. You can download Packer from the official website: [Packer Downloads](https://www.packer.io/downloads)
- AWS CLI installed and configured with your AWS access key and secret key. You can install AWS CLI and configure it using the following guide: [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

## Usage

1. Clone this repository to your local machine.

2. Open the `tomcat.json` file in a text editor.

3. Modify the values of the variables in the `variables` section as per your requirements. The variables and their default values are listed below:

   - `aws_access_key`: Your AWS access key.
   - `aws_secret_key`: Your AWS secret key.
   - `source_ami`: The source AMI ID to use as the base for the image. Default: `ami-02eb7a4783e7e9317`.
   - `ssh_username`: The SSH username for connecting to the instance. Default: `ubuntu`.
   - `ami_name`: The name for the generated AMI. Default: `tomcat-ami-ubuntu-2`.
   - `region`: The AWS region in which to create the image. Default: `ap-south-1`.
   - `instance_type`: The EC2 instance type to use. Default: `t2.micro`.

4. Save the changes to the `tomcat.json` file.

5. Open the `tomcat-installation.sh` script file in a text editor.

6. Customize the script if needed to install additional dependencies or configure Tomcat.

7. Save the changes to the `tomcat-installation.sh` file.

8. Open a terminal or command prompt and navigate to the directory where the `tomcat.json` file is located.

9. Run the following command to build the Tomcat image:

packer build tomcat.json


Packer will launch an EC2 instance, provision it with Tomcat using the `tomcat-installation.sh` script, create an AMI, and terminate the instance.

10. Once the image creation process is complete, you can use the generated AMI for launching new instances with Tomcat pre-installed.

That's it! You have successfully created a custom Tomcat image using Packer.

