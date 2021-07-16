# tfawsdemo

Able to run the Terraform scripts through Jenkins CD job

The  Jenkinsfile details the steps to achieve continuous delivery and will process all .tf files held in the root directory

Able to perform similar function in azure pipelines driven by azure-pipelines.yml file. 
The YML file does not include the apply or destry steps as this would cause the tf.state files to become out of sync.

Any adjustment to the .tf files will result in triggering both jenkins and Azure pipeline executions.
