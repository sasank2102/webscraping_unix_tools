echo "Scraping data .... please wait !"

wget -qO- https://in.finance.yahoo.com/quote/$1/history?ltr=1 | 
  hxnormalize -x | 
  hxselect table[class^="W"] |
  #hxselect "thead"+"tbody" "tr" | #prints only table data excluding column names and table footer. comment line 3 and uncomment line 4.
  lynx -stdin -dump -nolist



