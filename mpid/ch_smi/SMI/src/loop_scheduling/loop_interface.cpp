/* $Id$ */
#include <math.h>
#include "err.h"
#include "loop_interface.h"
#include "loop.h"



/////////////////////////////////////////////
// The loop scheduling interface functions //
/////////////////////////////////////////////
extern "C" {

//------------------------------------------------------------------------
//
// loop scheduling init, should be called by SMI_Init()
//
error_t SMI_Loop_scheduling_init()
{
   try
   {
      loop::initStatic();
   }
   catch(err fail)
   {
       
       std::cerr << fail;
      return(fail.error());
   }
   return(SMI_SUCCESS);
}
//------------------------------------------------------------------------
//
// initialization of the loop to be scheduled
//
error_t SMI_Loop_init(int* const id,const int globalLow,const int globalHigh
               	,int mode)
{
   loop* newloop;
   
   try
   {
      if(_smi_initialized==false)
         throw err("SMI not initialized",__LINE__,SMI_ERR_NOINIT);
      *id=loop::addLoop();
      newloop=loop::giveLoop(*id);
            
      newloop->setPartitionMode(mode);
      newloop->setGlobalBounds(globalLow,globalHigh);
      newloop->partition();
   }
   catch(err fail)
   {
      std::cerr << fail;
      return(fail.error());
   }
   return(SMI_SUCCESS);
}
//------------------------------------------------------------------------
//
// frees a loop generated by SMI_Loop_init() 
//
error_t SMI_Loop_free(const int id)
{
   try
   {
      if(_smi_initialized==false)
         throw err("SMI not initialized",__LINE__,SMI_ERR_NOINIT);  
	  
      loop::delLoop(id);     
   }
   catch(err fail)
   {
      std::cerr << fail;
      return(fail.error());
   }
   return(SMI_SUCCESS);
}
//------------------------------------------------------------------------
//
// Evaluates the speed of the processors. To use the speed call 
// SMI_Evaluated_speed()
//
error_t SMI_Evaluate_speed(double* const speedArray)
{
   try
   {
      if(_smi_initialized==false)
         throw err("SMI not initialized",__LINE__,SMI_ERR_NOINIT);   
      loop::evaluateSpeed(speedArray);
   }
   catch(err fail)
   {
      std::cerr << fail;
      return(fail.error());
   }
   return(SMI_SUCCESS);
}
//------------------------------------------------------------------------
//
// Call this function to use the speed of the processors for the partition of
// the iterations among the processors. 
//
error_t SMI_Use_evaluated_speed(const int id)
{
   loop*	workloop;

   try
   {
      if(_smi_initialized==false)
         throw err("SMI not initialized",__LINE__,SMI_ERR_NOINIT);

      workloop=loop::giveLoop(id);
      workloop->useProcSpeed();
      
   }
   catch(err fail)
   {
      std::cerr << fail;
      return(fail.error());
   }
   return(SMI_SUCCESS);
}
//------------------------------------------------------------------------
//
// This function, called just before the loop to be scheduled, returns the first
// (low) and the last iteration (high) for the following loop. Unless the status 
// is SMI_LOOP_READY this function must be called repeatedly and the iterations
// must be executed.  
//
error_t SMI_Get_iterations(const int id,int* const status,int* const low,
                     	 int* const high)
{
   loop*	workloop;
   			  
   try
   {
      if(_smi_initialized==false)
         throw err("SMI not initialized",__LINE__,SMI_ERR_NOINIT);

      workloop=loop::giveLoop(id);

      switch(workloop->currentStatus())
      {
      	case loopReady:
            workloop->rePartition();
  
      	case loopLocal:
            workloop->adaptK();
            
            switch(workloop->getPartitionMode())
            {
            	case SMI_PART_TIMED_BLOCKED:
                  workloop->getLocalTimed(*low,*high);	
                  *status=SMI_LOOP_READY;
                  return(SMI_SUCCESS);
               case SMI_PART_CYCLIC:
                  workloop->getLocalCyclic(*low,*high);
                  break;
               case SMI_PART_BLOCKED:
               case SMI_PART_ADAPTED_BLOCKED:
                  workloop->getLocalBlocked(*low,*high);
                  break;
               default: 
                  throw err("False param. from getPartitionMode",__LINE__,SMI_ERR_OTHER);
                  break;
            }
            
            if(*low<=*high) {
               *status=SMI_LOOP_LOCAL;
               return(SMI_SUCCESS);
            }
         case loopRemote:
            switch(workloop->getPartitionMode())
            {
               case SMI_PART_CYCLIC:
                 workloop->getRemoteCyclic(*low,*high);
                  break;
               case SMI_PART_BLOCKED:
               case SMI_PART_ADAPTED_BLOCKED:
                 workloop->getRemoteBlocked(*low,*high);
                  break;
               default: 
                  throw err("False param. from getPartitionMode",__LINE__,SMI_ERR_OTHER);
                  break;
            }

            if(*low<=*high)
               *status=SMI_LOOP_REMOTE;
            else
               *status=SMI_LOOP_READY;

            return(SMI_SUCCESS);
         default: 
            throw err("False param. from currentStatus",__LINE__,SMI_ERR_OTHER);
            break;
      }
   }
   catch(err fail)
   {
      std::cerr << fail;
      return(fail.error());
   }
}
//------------------------------------------------------------------------
//
// This is a function to set some parameters for the loop-scheduling:
// kNew : new value for chunck size control variable k
// minChunkSizeLocal: new minimum chunk size (local)
// minChunkSizeRemote: new minimum chunk size (remote)
//
error_t SMI_Set_loop_param(const int id,const double kNew,const int minChunkSizeLocal,
                  	const int minChunkSizeRemote, const int maxChunkSizeLocal,
                  	const int maxChunkSizeRemote)
{
   loop*	workloop;
   
   try
   {
      if(_smi_initialized==false)
         throw err("SMI not initialized",__LINE__,SMI_ERR_NOINIT);

      workloop=loop::giveLoop(id);

   	workloop->setK(kNew);
            
      workloop->setMinChunkSizeLocal(minChunkSizeLocal);
      workloop->setMinChunkSizeRemote(minChunkSizeRemote);
	  workloop->setMaxChunkSizeLocal(maxChunkSizeLocal);
      workloop->setMaxChunkSizeRemote(maxChunkSizeRemote);
      
      return(SMI_SUCCESS);      
   }
   catch(err fail)
   {
      std::cerr << fail;
      return(fail.error());
   }
}
//------------------------------------------------------------------------
//
// This function sets the adaption mode and the maximum number of processes 
// included in the adaption calculation. 
//
error_t SMI_Loop_k_adaption_mode(const int id,const int _smi_adaptionMode,const int maxCalcDist)
{
   loop*	workloop;
   
   try
   {
      if(_smi_initialized==false)
         throw err("SMI not initialized",__LINE__,SMI_ERR_NOINIT);

      workloop=loop::giveLoop(id);
      
      workloop->setAdaptionMode(_smi_adaptionMode);
      workloop->setMaxCalcDist(maxCalcDist);

      return(SMI_SUCCESS);      
   }
   catch(err fail)
   {
      std::cerr << fail;
      return(fail.error());
   }
}
//------------------------------------------------------------------------
//
// A call to this function sets the maximum number of work queues considered
// in the remote phase. If _smi_maxHelpDist is set to SMI_HELP_ONLY_SMP a process
// checks only the work queues on its own SMP_Node
//
error_t SMI_Set_loop_help_param(const int id, const int _smi_maxHelpDist)
{
   loop*	workloop;
   
   try
   {
      if(_smi_initialized==false)
         throw err("SMI not initialized",__LINE__,SMI_ERR_NOINIT);

      workloop=loop::giveLoop(id);
      
      workloop->setMaxHelpDist(_smi_maxHelpDist);

      return(SMI_SUCCESS);      
   }
   catch(err fail)
   {
      std::cerr << fail;
      return(fail.error());
   }
}

} // extern "C"

