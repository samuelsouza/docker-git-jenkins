FROM jenkins/jenkins:lts

# Installs some plugins (script already provided by jenkins)
RUN /usr/local/bin/install-plugins.sh git matrix-auth workflow-aggregator docker-workflow blueocean credentials-binding groovy

# Define admin user/pass
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial installation setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Define Groovy scripts to be executed on jenkins initialization
COPY initjob.groovy /usr/share/jenkins/ref/init.groovy.d/initjob.groovy

# Define jenkins workspace
VOLUME /var/jenkins_home