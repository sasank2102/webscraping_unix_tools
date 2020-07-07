
echo "Date,Open,High,Low,Close*,Adj. close**,Volume" >$1.csv

echo "Scraping data .... please wait !"

wget -qO- https://in.finance.yahoo.com/quote/$1/history?ltr=1 | 
  hxnormalize -x | 
  hxselect table[class^="W"] tbody|lynx -stdin -dump -nolist|tr -d ,|column -t|tr -s ' '|tr ' ' ',' >> $1.csv
  
echo "$1.csv created:"  



