# [HD IT] - Rewst Workflow Execution Results - Action

## Overview

- This Action allows you to bring any workflow execution results back into Rewst as a Rewst Context Variables.
- This Action was created to avoid running every task again in a workflow. Instead, you can simply test a single aspect of it by simulating the context that exists from a previous execution.
- It supports any result from you own organisation,the following is an example of the url you will get from a previous execution: https://app.rewst.io/organizations/xxxxxxxx-5288-45fc-b516-5cxxxxxx32/results/969xxxx5-ae87-44f1-8e0f-974e4478db75 (please note this url will not work)
- It also supports any shared Jinja workflow: https://app.rewst.io/jinja-live-editor?id=4ff8580d-2241-41b5-a106-16aa09c7159a
- I have already shared this information with the Rewst ROC.

## Requirements

- A new organization variable under your Organisation called "rewst_workflow_execution_result," which will have your session cookie attached.
- Import the workflow into your Rewst Instance. Giga has written a helpful guide here: https://github.com/gigacodedev/Rewst.

## Usage

1. Log into Rewst using chrome or edge.
2. Open up your developer console and select network. Click on a Workflow Execution and look for a "graphql" request.
3. Under the request headers you will see a Header of "Cookie" copy the content of this cookie.  (Please keep this secret)
 An example is below.  I have had to pixelate all the contents for security but it should give you an idea of how to use this.
<img width="246" alt="image" src="https://raw.githubusercontent.com/Mondyro/Rewst/main/Rewst%20Workflow%20Execution%20Results/Retrieved_Cookie.jpg">

4. Under your organisation varibles in Rewst create a new variable with the name of "rewst_workflow_execution_result", add your cookie contents as the value and set the category to secret.  You can set it as default if you wish to use this in your esxisting workflows.
5. To use this action edit the body of the action "Rewst_Execution_Results" and replace the url with url of a result of any workflow execution or a ctx varible so you can feed data in.
6. Once it is working you can copy the action and bring it into a failed workflow.
7. If a CTX you were using was called CTX.Firewalls_Mapping you could replace it with CTX.web_workflowExecution[0].contexts[4].Firewalls_Mapping in my case


## Examples

Input Variables on the Rewst_Execution_Results Action On Success
- One_Result - (true or blank) - This handels loops and speeds up the speed of viewing results.  This will only show the last instance of a context varible.
- Hide_WF_CTX - (true or blank) -  If your ininital Workflow Execution has more then 100 Execution Results I would suggest setting this to true
- include_vars - specify your input varibles here from the Workflow Execution e.g any of your CTX from the main workflow. Adds to the single Execution_Summary Action
- ignore_vars - specify the vars you want to ignore from the original Workflow Execution
- default_excludes - Default Items that I dont think most people need

Test it out for yourself.

## Examples
Before this workflow failed with almost 1000 tasks having been executed.
<img alt="image" src="https://raw.githubusercontent.com/Mondyro/Rewst/main/Rewst%20Workflow%20Execution%20Results/Example_Before.jpg">

After I used my action to just bring in the CTX from the last failed run
<img alt="image" src="https://raw.githubusercontent.com/Mondyro/Rewst/main/Rewst%20Workflow%20Execution%20Results/Example_With_Action.jpg">


