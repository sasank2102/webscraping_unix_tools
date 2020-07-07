echo "Scraping data .... please wait !"

wget -qO- http://www.advfn.com/nasdaq/nasdaq.asp?companies=$1 | 
  hxnormalize -x | 
  hxselect tr[class^="ts"]  |
  #hxselect "thead"+"tbody" "tr" | #prints only table data excluding column names and table footer. comment line 3 and uncomment line 4.
  lynx -stdin -dump -nolist |
	sed s/"\[.*\]"//g
