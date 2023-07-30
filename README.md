# devops-netology
### change number 1
### change number 2
### change number 3

# Local .terraform directories
**/.terraform/*		- игнорировать все файлы и папки в директории .terraform, которая может лежать в любом месте репозотория 

# .tfstate files
*.tfstate			- игнорировать все файлы с расширением .tfstate
*.tfstate.*			- игнорировать все файлы, которые в своем имени имеют символы .tfstate. 

# Crash log files
crash.log			- игнорировать все файлы с таким именем
crash.*.log			- игнорировать все файлы, которые начинаются на crash. и заканчиваются на .log 

# Exclude all .tfvars files, which are likely to contain sensitive data, such as
# password, private keys, and other secrets. These should not be part of version 
# control as they are data points which are potentially sensitive and subject 
# to change depending on the environment.
*.tfvars			- игнорировать все файлы с расширением .tfvars
*.tfvars.json		- игнорировать все файлы, заканчивающиеся символами .tfvars.json

# Ignore override files as they are usually used to override resources locally and so
# are not checked in
override.tf			- игнорировать все файлы с таким именем
override.tf.json	- игнорировать все файлы с таким именем
*_override.tf		- игнорировать все файлы, заканчивающиеся символами _override.tf
*_override.tf.json	- игнорировать все файлы, заканчивающиеся символами _override.tf.json

# Include override files you do wish to add to version control using negated pattern
# !example_override.tf

# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*

# Ignore CLI configuration files
.terraformrc			- игнорировать все файлы с таким именем
terraform.rc			- игнорировать все файлы с таким именем