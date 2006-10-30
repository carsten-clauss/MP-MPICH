/*
 * $Id$
 */

#include <stdlib.h>
#include <stdio.h>
#include "mpi.h"
#include "../util/test.h"

int main(int argc, char **argv)
{
	char *buf;
	char err[200];
	int i, iam;
	MPI_Init(&argc, &argv);
	Test_Init_No_File();

	MPI_Barrier(MPI_COMM_WORLD);
	buf = (char *)malloc(32 * 1024);
	MPI_Comm_rank(MPI_COMM_WORLD, &iam);
	for(i = 1; i <= 32; i++) {
		if (iam == 0) {
			*buf = i;
#ifdef VERBOSE
			printf("Broadcasting %d bytes\n", i * 64);
#endif
		}
		MPI_Bcast(buf, i * 64, MPI_BYTE, 0, MPI_COMM_WORLD);
		if (*buf != i) {
			sprintf(err, "Broadcast of %d bytes", i * 64);
			Test_Failed(err);
		}
		/* gsync(); */
		MPI_Barrier(MPI_COMM_WORLD);
	}
	Test_Waitforall();
	Test_Global_Summary();
	MPI_Finalize();
	free(buf);

	return 0;
}
