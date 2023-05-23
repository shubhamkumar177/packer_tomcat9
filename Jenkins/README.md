# Creating Tomcat Image using Packer

This repository provides a Packer configuration file and a shell script to create a custom Tomcat image on AWS using Packer.

## Prerequisites

Before you begin, ensure that you have the following:

- Packer installed on your local machine. You can download Packer from the official website: [Packer Downloads](https://www.packer.io/downloads)
- AWS CLI installed and configured with your AWS access key and secret key. You can install AWS CLI and configure it using the following guide: [Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

## Usage

1. Clone this repository to your local machine.

2. Open the `jenkins.json` file in a text editor.

3. Modify the values of the variables in the `variables` section as per your requirements. The variables and their default values are listed below:

   - `aws_access_key`: Your AWS access key.
   - `aws_secret_key`: Your AWS secret key.
   - `source_ami`: The source AMI ID to use as the base for the image. Default: `<ami-id>`.
   - `ssh_username`: The SSH username for connecting to the instance. Default: `<user_name>`.
   - `ami_name`: The name for the generated AMI. Default: `<ami-name>`.
   - `region`: The AWS region in which to create the image. Default: `<region>`.
   - `instance_type`: The EC2 instance type to use. Default: `<instance_type>`.

4. Save the changes to the `jenkins.json` file.

5. Open the `jenkins.sh` script file in a text editor.

6. Customize the script if needed to install additional dependencies or configure Tomcat.

7. Save the changes to the `jenkins.sh` file.

8. Open a terminal or command prompt and navigate to the directory where the `jenkins.json` file is located.

9. Run the following command to build the Jenkins image:

packer build jenkins.json


Packer will launch an EC2 instance, provision it with jenkins using the `jenkins.sh` script, create an AMI, and terminate the instance.

10. Once the image creation process is complete, you can use the generated AMI for launching new instances with Tomcat pre-installed.

That's it! You have successfully created a custom Tomcat image using Packer.


