import hudson.plugins.git.*;
import jenkins.model.Jenkins;

def scm = new GitSCM("http://<user>:<pass>@<repo-url.git>");
scm.branches = [new BranchSpec("*/master")];

def flowDefinition = new org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition(scm, "jenkinsfile");

def parent = Jenkins.instance;
def job = new org.jenkinsci.plugins.workflow.job.WorkflowJob(parent, "Job imported from Git");
job.definition = flowDefinition;

parent.reload();