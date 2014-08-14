
for(i in 1:10000)
{

Milestones=c(150,300,500,1000,1500,2000,3000,5000,7000,9000)

if(i %in% Milestones){
	cat("\n",format(Sys.time(), "%X "),"| i is",i,"| \n")

	}

}
