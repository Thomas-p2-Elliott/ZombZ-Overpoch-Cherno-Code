
<?php

$chances="                                                  0.03,  
                                                            0.03,  
                                                            0.03,  
                                                           
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  

                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  

                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,
                                                            0.02,  
                                                            0.02,
 
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,
                                                            0.01,  
                                                            0.01,  
                                                            0.01,  
                                                            0.01,
                                                            0.01,  
                                                            0.01,  
                                                            0.01,
                                                            0.01,
                                                            0.01,  
                                                            0.01,  
                                                            0.01,

                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,  
                                                            0.02,
                                                             

                                                            0.04,  
                                                            0.04,  
                                                            0.04,  
                                                            0.04,  
                                                            0.04,  
                                                            0.04,
                                                            0.04,  
                                                            0.04,  
                                                            0.04,  
                                                            0.04,
                                                            0.04,  
                                                            0.04,  
                                                            0.04,
                                                            0.04,
                                                            0.04,  
                                                            0.04,  
                                                            0.04,
                                                            0.04,  
                                                            0.04,
                                                            0.04,  
                                                            0.04,  
                                                            0.04,
                                                            0.04,
                                                            0.04,  
                                                            0.04,  
                                                            0.04,
 
                                                            0.03,
                                                            0.03,  
                                                            0.03,  
                                                            0.03,
                                                            0.03,
                                                            0.03,  
                                                            0.03,  
                                                            0.03,
                                                            0.03,  
                                                            0.03,
                                                            0.03,  
                                                            0.03,  
                                                            0.03,
                                                            0.03,
                                                            0.03,  
                                                            0.03,  
                                                            0.03,

                                                            0.04,  
                                                            0.04,
                                                            0.04,
                                                            0.04,  
                                                            0.04,  
                                                            0.04,
                                                            0.04,  
                                                            0.04,
                                                            0.04,  
                                                            0.04,  
                                                            0.04,
                                                            0.04,
                                                            0.04,  
                                                            0.04,  

                                                            0.05,
                                                            0.05,
                                                            0.05,  
                                                            0.05,  
                                                            0.05,
                                                            0.05,  
                                                            0.05,
                                                            0.05,  
                                                            0.05,  
                                                            0.05,
                                                            0.05,
                                                            0.05,  
                                                            0.05,  
                                                            0.06,
                                                            0.06,
                                                            0.06,  
                                                            0.06,  
                                                            0.06,
                                                            0.06,  
                                                            0.06,
                                                            0.06,  
                                                            0.06,  
                                                            0.06,
                                                            0.06,
                                                            0.06,  
                                                            0.06,
                                                            0.06,  
                                                            0.06,
                                                            0.06,
                                                            0.06,  
                                                            0.06,  
                                                            0.06,
                                                            0.06,  
                                                            0.06,
                                                            0.06,  
                                                            0.06,  
                                                            0.06,
                                                            0.06,
                                                            0.06,  
                                                            0.06,
                                                            0.06,
                                                            0.06,
                                                            0.06,  
                                                            0.06,
 
                                                          
                                                            0.09,
                                                            0.09,
                                                            0.09,
 
                                                            
                                                            0.002,  
                                                            0.002,  
                                                            0.002,
                                                            0.002,  
                                                            0.002,
                                                            0.002,  
                                                            0.002,  
                                                            0.002,
                                                            0.002,
                                                            0.002,  
                                                            0.002,
                                                            0.002,  
                                                            0.002,
                                                            0.002,
                                                            0.002,  
                                                            0.002,  
                                                            0.002,
                                                            0.002,  
                                                            0.002,
                                                            0.002,  
                                                            0.002,  
                                                            0.002,
                                                            0.002,
                                                            0.002,  
                                                            0.002,
                                                            0.002,
                                                            0.002,
                                                            0.002,  
                                                            0.002";
$chances = str_replace(" ","",$chances);

$explodechances = explode(",",$chances);

foreach ($explodechances AS $chance){
	$chancetotal = $chance + $chancetotal;

}

echo $chancetotal;