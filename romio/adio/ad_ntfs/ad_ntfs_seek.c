/* 
 *   $Id$    
 *
 */

#include "ad_ntfs.h"

ADIO_Offset ADIOI_NTFS_SeekIndividual(ADIO_File fd, ADIO_Offset offset, 
		      int whence, int *error_code)
{
    return ADIOI_GEN_SeekIndividual(fd, offset, whence, error_code);
}
