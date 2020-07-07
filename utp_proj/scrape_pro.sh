

option=0

while [	$option != "q" ]
do
echo " "
echo " "
echo "Select an option : (Enter q to exit)"
echo "****** STOCK MARKET DATA TOOL ********"
echo "1.Search stocks"
echo "2.Show stock history"
echo "3.Generate stock history csv"
echo "4.Stock statistics and plot stock details"
echo "*********** OTHER TOOLS ****************"
echo "5.word dictionary"
echo "6.live and recent cric match scores"
echo " "
echo "Your option:"
read option
if [ $option == "q" ] 
then
	break
fi	
case $option in 
	1)
		echo "1)List all stocks under alphabet"
		echo "2)Search for a stock"
		read option
		if [ $option == 1 ] 
		then
			echo "Enter alphabet(A-Z):"
			read alpha
			alpha=`echo $alpha|tr [:lower:] [:upper:]`
				 
			bash get_names.sh $alpha 
		else
			echo "Enter stock name to search:"
			read name
			name=`echo $name|tr [:lower:] [:upper:]`
			bash get_names.sh ${name:0:1} | grep -i $name
		fi
	;;
	2)
		echo "Enter stock code:"
		read name
		bash scrap.sh $name		

	;;
	3)
		echo "Enter stock code:"
		read name
		bash csv_gen.sh $name
	;;
	4)
		echo "Enter stock code:"
		read name
		bash csv_gen.sh $name
		awk -f stats.awk -F "," < $name.csv
		awk -F "," '{if($3!="High" && $3!="Dividend") print $1 " " $2}' < $name.csv > dummy.dat
		gnuplot -p -e "set xdata time;set timefmt '%d-%b-%Y';set xlabel 'Date Axis';set ylabel 'Stock opening';set title 'Stock opening vs dates';plot 'dummy.dat' using 1:2 title 'stock value' with lines"
		rm dummy.dat
	;;
	5)
		echo "Enter word to define:"
		read word
		bash define.sh $word
	;;
	6)
		echo "****** LIVE CRIC SCORES ********"
		bash cric_scores.sh
	;;
esac
done

