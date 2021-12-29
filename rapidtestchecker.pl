while (1) {

	#binax
	$name="Binax";
	$url="https://www.walmart.com/ip/BinaxNOW-COVID-19-Antigen-Self-Test-2-Count/142089281";	
	CheckStock($name,$url);
		
	$name="QuickVue";
	$url="https://www.walmart.com/ip/Quidel-QuickVue-At-Home-COVID-19-Test-10-Minute-Results-at-Home/929494774";
	CheckStock($name,$url);
	
	$name="IntelliSwab";	
	$url = "https://www.walmart.com/ip/InteliSwab-COVID-19-Rapid-Antigen-Test-For-results-anytime-and-anywhere-2-Tests/916411293";
	CheckStock($name,$url);
		
	#$name="Ellume";
	#$url = "https://www.walmart.com/ip/Ellume-COVID-Test-Kit-At-Home-COVID-19-Rapid-Antigen-Self-Test-Results-15-minutes-free-mobile-app-FDA-Emergency-Use-Authorization-1-Pack/953499978";
	#CheckStock($name,$url);	
	
	print "Done Loop, sleeping for 150\n";

	sleep(150);
}



sub CheckStock{
	$name = $_[0];
	$url = $_[1];

	print "Looking for $name?\n";		  
	
	$o=`curl -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36" --cookie cookies.txt --cookie-jar cookies.txt -o page.html $url`;
	open INFILE, "<page.html";
	$firstline = <INFILE>;
	if (($firstline=~ /Add to cart/) && not($firstline=~/Out of stock/)) {
		$o=`curl -s -X POST -H 'Content-type: application/json' --data '{"text":"$name is in stock at $url"}' *****WEBHOOK_HERE*****`;
		#die;
	}
	close INFILE;
	}
