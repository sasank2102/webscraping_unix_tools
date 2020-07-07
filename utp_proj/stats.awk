BEGIN{
	 max=0;min=9999999;max_o=0;min_o=9999999;
	 max_c=0;min_c=9999999;
	 avg_o=0;avg_c=0;
	 count=0;
	 
}

{
	
	
	count++;
	avg_o+=$2;
	avg_c+=$5;
	if($3=="High"||$3=="Dividend") { }
	else{
	if($2 > max_o) {max_o=$2;max_od=$1;}
	if($5 > max_c) {max_c=$5;max_cd=$1;}
	if($3 > max) {max=$3;maxd=$1;}
	if($2 < min_o) {min_o=$2;min_od=$1;}
	if($5 < min_c) {min_c=$5;min_cd=$1;}
	if($4 < min) {min=$4;mind=$1;}
	}
}

END{
	avg_c=avg_c/count;
	avg_o=avg_o/count;
	printf("\n**** MAX DETAILS ****\n");
	printf("max_open:%f on %s\n",max_o,max_od);
	printf("max_close:%f on %s\n",max_c,max_cd);
	printf("All time max:%f on %s\n",max,maxd);
	printf("\n**** MIN DETAILS ****\n");
	printf("min_open:%f on %s\n",min_o,min_od);
	printf("min_close:%f on %s\n",min_c,min_cd);
	printf("All time min:%f on %s\n",min,mind);
	printf("\n**** AVG DETAILS ****\n");
	printf("Avg open:%f\n",avg_o);
	printf("Avg close:%f\n",avg_c);

}
