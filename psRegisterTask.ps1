#----------------------------------------------------------
# Author: Cpsc\asalomon
# Description: register psGetXmlSource.ps1 script as scheduled tas
# Run as administrator
#----------------------------------------------------------
param ($executablePath)
if($executablePath -eq null){
	$executablePath = "./psGetXmlSource.ps1"
}
$taskRunInterval = 300
$taskName = "Update CPSC Recalls Widget Data"
$taskDesc =  "Runs update for CPSC Recalls Widget for (https://www.cpsc.gov/Newsroom/Downloadable-Data/widgets)"
$action = New-ScheduledTaskAction -Execute $executablePath 
$settings = New-ScheduledTaskSettingsSet -Hidden -RunOnlyIfNetworkAvailable
$trigger =  New-ScheduledTaskTrigger -once -at 6am -RepetitionInterval (New-TimeSpan -Minutes $taskRunInterval ) -RepetitionDuration ([System.TimeSpan]::MaxValue) 
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $taskDesc  -User System  -RunLevel Highest
start-sleep -seconds 10