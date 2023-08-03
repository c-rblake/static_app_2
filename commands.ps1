# https://learn.microsoft.com/sv-se/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3
# update powershell to 7.3 to have language support extensions
# https://learn.microsoft.com/en-us/training/modules/publish-app-service-static-web-app-api-dotnet/4-exercise-static-web-apps
# to see the github ACTIONS (like azure deployment pipeline goto) https://github.com/c-rblake/my-static-blazor-app/actions
# With the extension you can see it in Visual Studio code and no need to go to Azure Devop
# Azure Static Web Apps added a GitHub Actions workflow file to the branch you selected in the previous exercise. First, you'll get this file by pulling your code from Git.
# But we need to Pull it.
# Add a default router to static web app config (not the actual app by wwwroot within the Client project.)

# Create an Item
# New-Item -ItemType File -Path . -Name "staticwebapp.config.json"  

# VS code open a file from command line
# code -r something.php

# Before making changes to an app, it's good practice to create a new branch for the changes.

# STAGE CHANGES
# GIT clone/copy a repo from github.
# git clone https://github.com/c-rblake/static_app_2.git
#git add filename    # Add a specific file
#git add .  
# COMMIT CHANGES WITH COMMIT MESSAGE (NOT OPTIONAL!)
#git commit -m "Descriptive message about the changes"
# PUSH CHANGES
#git push
#git push origin branch-name  # sends to specific branch.

#git pull to get from main like this

# Make a new branch
# git checkout main
# git pull origin main
# git checkout -b new-branch-name
# git push --set-upstream origin add-api-feature

# Delete a branch git branch -d branch-name
#git push origin :branch-name


# Unit 7 Deals with and API in Azure Functions
# So far you've been using a front-end framework. Soon you'll add an API and connect it to your front-end app. Your repository has an Api project that contains an incomplete Azure Functions project and HTTP endpoints for PUT, POST, and DELETE of your products. 
# The API is missing the HTTP GET function
# You won't have to worry about CORS when you publish to Azure Static Web Apps. REVERSE PROXY
# That's because Azure Static Web Apps automatically configures your app so it can communicate with your API on Azure using a reverse proxy. A reverse proxy is what allows your web app and API to appear to come from the same web domain. So you only have to set up CORS when you run locally.

# Azure functions is not so out of the box in visual studio code as in visual studio
# Basically we get the boiler plate code generated for us if we use visual studio
# But we can do it with command palette ctrl-shift-p
# CTRL SHIFT P => "Azure Functions - Create Function"

# Configure Cross-Origin Resource Sharing (CORS) locally
# Not needed in Azure since the Reverse Proxy handles this.

# Azure Functions tooling. If you want to use the Azure Functions command line tool, you will also need a local.settings.json file 
# described the Azure Functions Core Tools docs.

# KILL A PORT THAT IS BEING USED
# netstat -ano | findstr :5001
# taskkill /PID typeyourPIDhere /F  - F is for FORCE
# TASKKILL /PID 18036 /F    

# The API cant 'run'
# The current OutputType is 'Library'.
# https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=windows%2Cportal%2Cv2%2Cbash&pivots=programming-language-csharp#local-settings-file
# npm install -g azure-functions-core-tools@3 --unsafe-perm true
# func start

# Merge api branch into main
# git checkout main
# git merge api
# git push

# Visual Studio Code navigation:
# CTRL-SHIF-O got to symbol
# CTRL-TAB and arrows to navigate files.




# Save the current directory.
$currentDir = Get-Location

# Define the path to your projects
$apiProjectPath = "C:\Users\Reserv3\\my-static-blazor-app\Api"
$clientProjectPath = "C:\Users\Reserv3\my-static-blazor-app\Client"

# Start the Client project
Set-Location -Path $clientProjectPath
Start-Process -FilePath "dotnet" -ArgumentList "run" -NoNewWindow
 
# Start the API project
Set-Location -Path $apiProjectPath
Start-Process -FilePath "func" -ArgumentList "start --csharp" -NoNewWindow

# Return to the original directory.
Set-Location $currentDir
