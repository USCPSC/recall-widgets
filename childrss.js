document.write(unescape("<div align='left' style=\"background-image:url('https://www.cpsc.gov/cgi-bin/javascripts/widget-border.jpg');background-repeat:no-repeat;\"><div style='font-size:7px;min-height:7px;display:inline-block;'></div><div align='center' style='width:239px;height:400px;'><div style='font-size:12px;font-family:arial;margin-top:3px;height:35px;' align='center'><img src='https://www.cpsc.gov/cgi-bin/javascripts/cpscseal4.png' width='28' height='28' style='width:28px;height:28px;float:left;margin-left:30px;border:none !important;' alt='CPSC Seal - Small' /><div style='margin-right:30px;margin-top:8px;line-height:15px;max-width:205px;'><a href='https://www.cpsc.gov/en/recalls/'><b>CPSC Recent Child<br>Product Recalls<div style='margin-top:-16px;display:inline-block;'></div></b></a></div></div><div style='margin-left:11px;margin-top:5px;clear:both;'>"));


var isMobile = {
    Android: function () {
        return navigator.userAgent.match(/Android/i) ? true : false;
    },
    BlackBerry: function () {
        return navigator.userAgent.match(/BlackBerry/i) ? true : false;
    },
    iOS: function () {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i) ? true : false;
    },
    Windows: function () {
        return navigator.userAgent.match(/IEMobile/i) ? true : false;
    },
    any: function () {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Windows());
    }
};

if (isMobile.any()) {
    document.write(unescape("<div id='scroller' style='position:relative;height:262px;-webkit-overflow-scrolling: touch;overflow:scroll;'><iframe style='border: 2px #CCCCCC solid;' src='https://www.cpsc.gov/cgi-bin/javascripts/childrss.aspx' title='CPSC RSS Feed' width='224' height = '258'></iframe></div>"));
} else {
    document.write(unescape("<div id='scroller' style='position:relative;height:262px;overflow-x:hidden;overflow-y:hidden;'><iframe style='border: 2px #CCCCCC solid;' src='https://www.cpsc.gov/cgi-bin/javascripts/childrss.aspx' title='CPSC RSS Feed' width='224' height='258' frameborder='0'></iframe></div>"));
}

document.write(unescape("<div style='height:40px;margin-top:-2px;line-height:13.5px;background-color:#F5F5F5;border-width:1px;border-bottom:1px solid #336699;border-top:1px solid #336699;border-right:1px solid #336699;border-left:1px solid #336699;font-size:13px;font-family:arial'>Join Child Recall Subscription List<form style= 'margin-top:0pt;margin-bottom:0pt' method='post' action='https://www.cpsc.gov/cgi-bin/javascripts/childrecalls.aspx' target='_blank'><input name='email' type='text' value='Email address' onclick=\"this.value=''\" style='font-style:italic;height:23px;width:150px;font-size:13px;' id='email' size='20' />&nbsp;&nbsp; <button type='submit' style='padding:0px;vertical-align:top;height:23px;width:25px;background-color:#CCF;'; value='Submit'>Go</button></form></div><a href='https://www.cpsc.gov/Newsroom/Downloadable-Data/widgets/' target='_parent' style='font-size:13px;color:#153a62;font-family:arial;line-height:2 !important;'>Add This To Your Web Site</a></div></div></div>"));