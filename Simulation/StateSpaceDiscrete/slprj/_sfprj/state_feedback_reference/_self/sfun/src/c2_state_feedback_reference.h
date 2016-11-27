#ifndef __c2_state_feedback_reference_h__
#define __c2_state_feedback_reference_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc2_state_feedback_referenceInstanceStruct
#define typedef_SFc2_state_feedback_referenceInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_isStable;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_state_feedback_reference;
  real_T c2_M[9];
  real_T *c2_r1;
  real_T *c2_a;
  real_T *c2_b;
  real_T *c2_c;
  real_T *c2_r2;
  real_T *c2_r3;
} SFc2_state_feedback_referenceInstanceStruct;

#endif                                 /*typedef_SFc2_state_feedback_referenceInstanceStruct*/

/* Named Constants */

/* Variable Declarations */
extern struct SfDebugInstanceStruct *sfGlobalDebugInstanceStruct;

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c2_state_feedback_reference_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c2_state_feedback_reference_get_check_sum(mxArray *plhs[]);
extern void c2_state_feedback_reference_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif
