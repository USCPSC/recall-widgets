#----------------------------------------------------------
# Author: Cpsc\asalomon
# Description: Updates the CPSC Recalls Widget data by querying the CPSC RSS Feed and writing
# the children recalls (Recalls-Children-Rss.xml)  & the all recalls (Recalls-RSS.xml) to disk
# the legacy aspx script will then pick read these files to display in the widget https://www.cpsc.gov/Newsroom/Downloadable-Data/widgets
# 
#Trigger: will be triggered by task scheduler job named : Update CPSC Recalls Widget
#----------------------------------------------------------
function Get-XmlSource($path) {
  write-host $path
  $xml = New-object xml
  $xml.Load($path)
  $xmlData = $xml.OuterXml
  write-host $xmlData

  return $xmlData
    
}

function Save-XmlFile($fileName, $content) {
  $content | Out-File -FilePath "./$fileName"  -Encoding utf8 
}
write-host 'starting..'
$allPath = @{
  PathName = 'AllRecalls' 
  Path     = 'https://www.cpsc.gov/Newsroom/CPSC-RSS-Feed/Recalls-RSS'
}
$childrenRawPath = $allPath.Path
write-host "Children Raw Path is $childrenRawPath"
$childrenPath = @{
  PathName = 'Children' 
  Path     = "$childrenRawPath/Children" 
}
$paths = @($allPath, $childrenPath)
write-host $paths
foreach ($path in $paths) {

  $data = Get-XmlSource -path $path.Path


  if ($path.PathName -eq 'AllRecalls') {
    
    Save-XmlFile  -content  $data -fileName "Recalls-RSS.xml" 
  }
  else {
    
    Save-XmlFile -content $data -fileName "Recalls-Children-RSS.xml" 
  }

}