<%@ Page Language="VB" debug="true" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "System.Net" %>
<%@ Import Namespace = "System.IO" %>


<script language="VB" runat="server">

sub Page_Load

   Dim sourceString As String = New System.Net.WebClient().DownloadString("https://cpsc-prod.ctacdev.com/Newsroom/CPSC-RSS-Feed/Recalls-RSS")
   Dim fpurl as String = "Recalls-RSS.xml"
   Dim filepath as string = MapPath(fpurl)

   Dim objStreamWriter As New StreamWriter(filepath, False)
   objStreamWriter.WriteLine(sourceString)
   objStreamWriter.Close()
   objStreamWriter = Nothing

end sub

</script>

<html>
<body>

<script language="javascript">window.open("closer.htm", '_self');</script>

</body>
</html>