#include "mpi.h"
#include <stdio.h>
#include <math.h>

#ifndef DBG
 #ifdef _DEBUG
 #define DBG(m) printf("%s\n",m); fflush(stdout);
 #else
 #define DBG(m)
 #endif
#endif
//release
double f(double a)
{
    return (4.0 / (1.0 + a*a));
}

int main(int argc,char *argv[])
{
    int done = 0, n, myid, numprocs, i;
    double PI25DT = 3.141592653589793238462643;
    double mypi, pi, h, sum, x;
    double startwtime = 0.0, endwtime;
    int  namelen;
    char processor_name[MPI_MAX_PROCESSOR_NAME];
	DWORD mytestnum=0,n1=0,n2=0,n3=0;

	DBG("calling MPI_Init");
    MPI_Init(&argc,&argv);
	DBG("calling MPI_Comm_size");
    MPI_Comm_size(MPI_COMM_WORLD,&numprocs);
	DBG("calling MPI_Comm_rank");
    MPI_Comm_rank(MPI_COMM_WORLD,&myid);
	DBG("calling MPI_Get_processor_name");
    MPI_Get_processor_name(processor_name,&namelen);

    fprintf(stdout,"Executing %s: Process %d of %d on %s\n",argv[0],
	    myid, numprocs, processor_name);fflush (stdout);

    n = 25000;
    while (TRUE)
    {   
        if (myid == 0)
        {
         /*printf("Enter the number of intervals: (0 quits) \n");  
         fflush (stdout); 
         scanf("%d",&n); */

	    printf("Processing with %d intervals\n",n);


		DBG("calling MPI_Wtime");
	    startwtime = MPI_Wtime();
        }
		DBG("calling MPI_Bcast");

		try{
			MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);
		}
		catch(int errcode)
		{
			printf("catch error %i\n",errcode);
		}

        if (n == 0)
            done = 1;
        else
        {
            h   = 1.0 / (double) n;
            sum = 0.0;
	    /* A slightly better approach starts from large i and works back */
            for (i = myid + 1; i <= n; i += numprocs)
            {
                x = h * ((double)i - 0.5);
                sum += f(x);
            }
            mypi = h * sum;

			DBG("calling MPI_Reduce");
            MPI_Reduce(&mypi, &pi, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

            if (myid == 0)
	    {
		DBG("calling MPI_Wtime");
		endwtime = MPI_Wtime();
	    }
        }
   
		if (myid == 0)
		{
			printf("pi is approximately %.16f, Error is %.16f\n",
				pi, fabs(pi - PI25DT));
			printf("wall clock time = %f\n", endwtime-startwtime);	       
			fflush( stdout );
		}
		mytestnum=0;
		for(n1=0; n1<11111; n1++){
			mytestnum+=1;
			for(n2=0; n2<11111; n2++){
				mytestnum-=n2;
				for(n3=1; n3<6; n3++){
					mytestnum+=n1;
					mytestnum+=mytestnum%n3;
				}
			}
		}
		if (myid == 0)
		{
		printf("wtestnum = %d\n", mytestnum);
		}

	 }   

	DBG("calling MPI_Finalize");
    MPI_Finalize();
	
    return 0;
}

            
