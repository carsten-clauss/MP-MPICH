// Copyright 1997-2000, University of Notre Dame.
// Authors: Jeremy G. Siek, Jeffery M. Squyres, Michael P. McNally, and
//          Andrew Lumsdaine
// 
// This file is part of the Notre Dame C++ bindings for MPI.
// 
// You should have received a copy of the License Agreement for the Notre
// Dame C++ bindings for MPI along with the software; see the file
// LICENSE.  If not, contact Office of Research, University of Notre
// Dame, Notre Dame, IN 46556.
// 
// Permission to modify the code and to distribute modified code is
// granted, provided the text of this NOTICE is retained, a notice that
// the code was modified is included with the above COPYRIGHT NOTICE and
// with the COPYRIGHT NOTICE in the LICENSE file, and that the LICENSE
// file is distributed with the modified code.
// 
// LICENSOR MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED.
// By way of example, but not limitation, Licensor MAKES NO
// REPRESENTATIONS OR WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY
// PARTICULAR PURPOSE OR THAT THE USE OF THE LICENSED SOFTWARE COMPONENTS
// OR DOCUMENTATION WILL NOT INFRINGE ANY PATENTS, COPYRIGHTS, TRADEMARKS
// OR OTHER RIGHTS.
// 
// Additional copyrights may follow.
/****************************************************************************

 MESSAGE PASSING INTERFACE TEST CASE SUITE

 Copyright IBM Corp. 1995

 IBM Corp. hereby grants a non-exclusive license to use, copy, modify, and
 distribute this software for any purpose and without fee provided that the
 above copyright notice and the following paragraphs appear in all copies.

 IBM Corp. makes no representation that the test cases comprising this
 suite are correct or are an accurate representation of any standard.

 In no event shall IBM be liable to any party for direct, indirect, special
 incidental, or consequential damage arising out of the use of this software
 even if IBM Corp. has been advised of the possibility of such damage.

 IBM CORP. SPECIFICALLY DISCLAIMS ANY WARRANTIES INCLUDING, BUT NOT LIMITED
 TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS AND IBM
 CORP. HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
 ENHANCEMENTS, OR MODIFICATIONS.

****************************************************************************

 These test cases reflect an interpretation of the MPI Standard.  They are
 are, in most cases, unit tests of specific MPI behaviors.  If a user of any
 test case from this set believes that the MPI Standard requires behavior
 different than that implied by the test case we would appreciate feedback.

 Comments may be sent to:
    Richard Treumann
    treumann@kgn.ibm.com

****************************************************************************
*/
#include "mpi2c++_test.h"
#include <unistd.h>

struct foo {
  int a;
  double b[2];
};

void
bcast_struct()
{
  int len[2];
  char msg[150];
  struct foo bar;
  MPI::Aint disp[2];
  MPI::Datatype newtype;
  MPI::Datatype type[2];
  
  Testing("Create_struct");

  len[0] = 1; 
  len[1] = 2;
  disp[0] = (MPI::Aint) &bar.a;
  disp[1] = (MPI::Aint) &bar.b[0] - disp[0];
  disp[0] = (MPI::Aint) 0;

  type[0] = MPI::INT; 
  type[1] = MPI::DOUBLE;

  newtype = MPI::Datatype::Create_struct(2, len, disp, type);
  newtype.Commit();

  if (my_rank == 0) { 
    bar.a = 17;
    bar.b[0] = 123.456;  
    bar.b[1] = 456.123;
  }

  MPI::COMM_WORLD.Bcast(&bar, 1, newtype, 0);
   
  if (bar.a != 17 || bar.b[0] != 123.456 || bar.b[1] != 456.123) {
    sprintf(msg, "NODE %d - ERROR! %d %f %f", my_rank, bar.a, bar.b[0], 
	    bar.b[1]);
    Fail(msg);
  }

  if (newtype != MPI::DATATYPE_NULL)
    newtype.Free();

  Pass(); // Create_struct
}
