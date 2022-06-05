echo "install apps below via winget source from MS Store"
# MS Store
(
	"9NBLGGH5R558", # Microsoft Todo	
	"9MSPC6MP8FM4", # Microsoft Whiteboard
	"9P1WXPKB68KX", # Snipaste
	"9NBLGGH1ZBKW", # Dynamic Theme
	"9PLFNLNT3G5G", # Intel® Graphics Command Center
	"XPDNH1FMW7NB40",	# 火绒安全软件
	"9NBLGGH43K0T"		# 小米感应钥匙
) | foreach { winget install -e --accept-package-agreements --id $_ }