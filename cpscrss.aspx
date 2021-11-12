<%@ Page Language="VB" Debug="True" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Xml.Xsl" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>

<script language="VB" runat=server>
  Sub Page_Load(sender As Object, e As EventArgs)

  
  ' Path to XSL file.  
  Dim strXslFile As String = Server.MapPath("cpscrss.xsl")

  ' Load XML file into the XmlDocument object.
  Dim myXmlDoc As XmlDocument = New XmlDocument()
  myXmlDoc.Load(Server.MapPath("Recalls-RSS.xml"))

  ' Load XSL file into the XslTransform object.
  Dim myXslDoc As XslTransform = New XslTransform()
  myXslDoc.Load(strXslFile)

  ' Create a StringBuilder and then point a StringWriter at it.
  ' Holds HTML output by the Transform method.
  Dim myStringBuilder As StringBuilder = New StringBuilder()
  Dim myStringWriter As StringWriter = New StringWriter(myStringBuilder)

  ' Call Transform method of XslTransform object passing it via XmlDocument and getting output via StringWriter.
  myXslDoc.Transform(myXmlDoc, Nothing, myStringWriter)

  'Additional processing to remove html tag withing xml tags'
  Dim text As String = myStringBuilder.ToString
  Dim rx As Regex = New Regex("&lt;[^&gt;]*&gt;", RegexOptions.Compiled Or RegexOptions.IgnoreCase)
  Dim matches As MatchCollection = rx.Matches(text)

  If matches.Count > 0 Then
  text = rx.Replace(text, "")

  End If

    ' Take our resulting HTML and display it via an ASP.NET
  RssHtml.Text = text
  End Sub
</script>
<html>

<head>
  <title>RSS Feed Reader</title>

  <style>
    h2 {
      font-size: 12pt;
      font-family: arial, helvetica;
      font-weight: bold;
    }

    h3 {
      font-size: 10pt;
      font-family: arial, helvetica;
      font-weight: bold;
    }

    p {
      font-size: 8pt;
      font-family: arial, helvetica;
    }

    td {
      font-size: 8pt;
      font-family: arial, helvetica;
    }

    'body   {scrollbar-face-color: #ffffff;
'scrollbar-shadow-color: #cccccc;
'scrollbar-highlight-color: #cccccc;
'scrollbar-3dlight-color: #ffffff;
'scrollbar-darkshadow-color: #cccccc;
'scrollbar-track-color: #cccccc;
'scrollbar-arrow-color: #ffffff;
'}


    .table_format {
      border-width: 2px;
      border-color: #800000;
      border-top: 1px solid #800000;
      border-bottom: 1px solid #800000;
      border-left: 1px solid #800000;
      border-right: 1px solid #800000;
    }
  </style>

</head>

<body bgcolor="#FFFFFF" vlink="FF4500" link="0000FF">
  <font face="Arial,Helvetica,Geneva,Swiss,SunSans-Regular" size="2">
    <asp:Literal id="RssHtml" runat="server" />

</body>

</html>