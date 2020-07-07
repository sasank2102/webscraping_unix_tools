echo "Scraping data .... please wait !"

wget -qO- http://www.espncricinfo.com/ci/engine/match/index.html?view=live |    hxnormalize -x |hxselect section[id="live-match-data"] |   lynx -stdin -dump -nolist
