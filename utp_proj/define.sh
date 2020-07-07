echo "Scraping data .... please wait !"

curl -s https://www.thefreedictionary.com/$1 | 
  hxnormalize -x | 
  hxselect section[data-src="hc_dict"] |
  #hxselect "thead"+"tbody" "tr" | #prints only table data excluding column names and table footer. comment line 3 and uncomment line 4.
  lynx -stdin -dump -nolist
























