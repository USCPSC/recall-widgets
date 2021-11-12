<%@ Page Language="VB" debug="true" enableViewStateMac="false" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace="System.IO" %>
<script language="VB" runat="server">

Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
Dim stremail, strlist, strconfirm, strshowconfirm as string
stremail = Request.Form("email")
strlist = "recalls"
strconfirm = "one"
strshowconfirm = "T"

Dim mnow, dnow, hnow, minow, snow as String
mnow = cstr(month(Now))
dnow = cstr(day(Now))
hnow = cstr(hour(Now))
minow = cstr(minute(Now))
snow = cstr(second(Now))
if len(mnow) = 1 then
  mnow = "0" + mnow
end if
if len(dnow) = 1 then
  dnow = "0" + dnow
end if
if len(hnow) = 1 then
  hnow = "0" + hnow
end if
if len(minow) = 1 then
  minow = "0" + minow
end if
if len(snow) = 1 then
  snow = "0" + snow
end if
Dim filepath as string = MapPath("widget.txt")
Dim objStreamWriter As New StreamWriter(filePath, True)
objStreamWriter.WriteLine(mnow + "/" + dnow + "/" + cstr(year(Now)) + " " + hnow + ":" + minow + ":" + snow)
objStreamWriter.Close()
objStreamWriter = Nothing

Response.Redirect("http://list.cpsc.gov/subscribe/subscribe.tml?email=" + stremail + "&list=" + strlist + "&confirm=" + strconfirm + "&showconfirm=" + strshowconfirm)
End Sub

</script> 


<HTML><HEAD><TITLE>Recall Subscription List</TITLE>

</HEAD><font face="Arial,Helvetica,Geneva,Swiss,SunSans-Regular" size="2">
<BODY VLINK="FF4500" LINK="0000FF">
</BODY> </HTML>