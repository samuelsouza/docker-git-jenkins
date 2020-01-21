

### Jenkins Automatic Job Import from Commited Jenkinsfile

This repository describes a simple way to retieve a jenkinsfile from a git repository and create the respective jobs on jenkins. This way, the jenkins server became more maintainable, all the jobs can be commited and the jobs will reflect the changes automatically.

There are three parts of it:
* _Dockerfile_   - Creates the jenkins instance, bypassing the wizard and defining user and password. Also, installs plugins and define the groovy script to import the jobs.

* _initJob.groovy_ - Creates a Job with a SCM Git step that imports a jenkinsfile to be executed in the job context.

* _jenkinsfile_ - Defines the pipeline steps itself.


In order to execute the container:

```
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
```
