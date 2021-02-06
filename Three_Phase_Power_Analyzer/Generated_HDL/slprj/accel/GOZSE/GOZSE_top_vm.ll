; ModuleID = 'test'
target datalayout = "e-m:w-i64:64-f64:64-f80:128-n8:16:32:64-S128"

%DW_GOZSE_T = type { [3 x double], [3 x double], [3 x double], [3 x double], [3 x double], [3 x double], [3 x double], [3 x double], [2 x i8*], i32, i32, i32, i32, i32, i32, i8, i8, [6 x i8] }
%B_GOZSE_T = type { [3 x double], i8, i8, [3 x i8], i8, [2 x i8] }
%P_GOZSE_T = type { double, double, double, [3 x double], [3 x double], [3 x double], [3 x double], double, double, double, [3 x double], [3 x double], [3 x double], [3 x double], double, double, double, double, [3 x double], [3 x double], [3 x double], [3 x double], double, double, double, double, [3 x double], [3 x double], [3 x double], [3 x double], double, double, double, double, double, [3 x double], [3 x double], double, i8, i8, [6 x i8] }
%ExternalUPtrs_GOZSE_T = type { i8, i8, i8, [5 x i8] }

define void @GOZSE_CGInitializeSizes(i8* %S_0) {
GOZSE_CGInitializeSizes_entry:
  %S_0_ = alloca i8*, align 8
  store i8* %S_0, i8** %S_0_, align 8
  %tmp_ = alloca [4 x i32], align 4
  call void @GOZSE_Checksum([4 x i32]* nonnull %tmp_)
  %0 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp_, i64 0, i64 0
  %tmp__el = load i32, i32* %0, align 4
  call void @vm_ssSetChecksumVal(i8* %S_0, i32 0, i32 %tmp__el)
  %1 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp_, i64 0, i64 1
  %tmp__el3 = load i32, i32* %1, align 4
  call void @vm_ssSetChecksumVal(i8* %S_0, i32 1, i32 %tmp__el3)
  %2 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp_, i64 0, i64 2
  %tmp__el5 = load i32, i32* %2, align 4
  call void @vm_ssSetChecksumVal(i8* %S_0, i32 2, i32 %tmp__el5)
  %3 = getelementptr inbounds [4 x i32], [4 x i32]* %tmp_, i64 0, i64 3
  %tmp__el7 = load i32, i32* %3, align 4
  call void @vm_ssSetChecksumVal(i8* %S_0, i32 3, i32 %tmp__el7)
  call void @vm_blockIOSizeCheck(i8* %S_0, i32 32)
  call void @vm_dworkSizeCheck(i8* %S_0, i32 240)
  ret void
}

define void @GOZSE_Checksum([4 x i32]* %y) {
GOZSE_Checksum_entry:
  %y_ = alloca [4 x i32]*, align 8
  store [4 x i32]* %y, [4 x i32]** %y_, align 8
  %0 = getelementptr inbounds [4 x i32], [4 x i32]* %y, i64 0, i64 0
  store i32 35828265, i32* %0, align 1
  %1 = getelementptr inbounds [4 x i32], [4 x i32]* %y, i64 0, i64 1
  store i32 -1722788549, i32* %1, align 1
  %2 = getelementptr inbounds [4 x i32], [4 x i32]* %y, i64 0, i64 2
  store i32 2087204855, i32* %2, align 1
  %3 = getelementptr inbounds [4 x i32], [4 x i32]* %y, i64 0, i64 3
  store i32 -773172709, i32* %3, align 1
  ret void
}

declare void @vm_ssSetChecksumVal(i8*, i32, i32)

declare void @vm_blockIOSizeCheck(i8*, i32)

declare void @vm_dworkSizeCheck(i8*, i32)

define void @Enable(i8* %S) {
Enable_entry:
  %_rtDW_ = alloca %DW_GOZSE_T*, align 8
  %0 = call i8* @vm_ssGetRootDWork(i8* %S)
  %1 = bitcast %DW_GOZSE_T** %_rtDW_ to i8**
  store i8* %0, i8** %1, align 8
  %2 = getelementptr inbounds i8, i8* %0, i64 208
  %3 = bitcast i8* %2 to i32*
  store i32 1, i32* %3, align 1
  %4 = getelementptr inbounds i8, i8* %0, i64 212
  %5 = bitcast i8* %4 to i32*
  store i32 1, i32* %5, align 1
  %6 = bitcast i8* %0 to %DW_GOZSE_T*
  %7 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %6, i64 0, i32 11
  store i32 1, i32* %7, align 1
  %8 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %6, i64 0, i32 12
  store i32 1, i32* %8, align 1
  ret void
}

declare i8* @vm_ssGetRootDWork(i8*)

define void @Update0(i8* %S) {
Update0_entry:
  %S_ = alloca i8*, align 8
  store i8* %S, i8** %S_, align 8
  %HoldSine_ = alloca double, align 8
  %_rtB_ = alloca %B_GOZSE_T*, align 8
  %_rtP_ = alloca %P_GOZSE_T*, align 8
  %_rtDW_ = alloca %DW_GOZSE_T*, align 8
  %vm_ssIsSampleHitVar0_ = alloca i32, align 4
  %0 = call i32 @vm_ssIsSampleHit(i8* %S, i32 1, i32 0)
  store i32 %0, i32* %vm_ssIsSampleHitVar0_, align 4
  %1 = call i8* @vm_ssGetRootDWork(i8* %S)
  %2 = bitcast %DW_GOZSE_T** %_rtDW_ to i8**
  store i8* %1, i8** %2, align 8
  %3 = call i8* @vm_ssGetModelRtp(i8* %S)
  %4 = bitcast %P_GOZSE_T** %_rtP_ to i8**
  store i8* %3, i8** %4, align 8
  %5 = call i8* @vm__ssGetModelBlockIO(i8* %S)
  %6 = bitcast %B_GOZSE_T** %_rtB_ to i8**
  store i8* %5, i8** %6, align 8
  %7 = icmp eq i32 %0, 0
  %8 = ptrtoint i8* %5 to i64
  %9 = inttoptr i64 %8 to %B_GOZSE_T*
  br i1 %7, label %false, label %true

true:                                             ; preds = %Update0_entry
  %10 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %9, i64 0, i32 2
  %_rtB__LogicalOperator1 = load i8, i8* %10, align 1
  %_rtDW_8 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %11 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_8, i64 0, i32 15
  store i8 %_rtB__LogicalOperator1, i8* %11, align 1
  %12 = bitcast %DW_GOZSE_T** %_rtDW_ to i64**
  %_rtDW_9222 = load i64*, i64** %12, align 8
  %_rtDW__lastSin_el221 = load i64, i64* %_rtDW_9222, align 1
  %13 = bitcast double* %HoldSine_ to i64*
  store i64 %_rtDW__lastSin_el221, i64* %13, align 8
  %14 = bitcast i64* %_rtDW_9222 to double*
  %_rtDW__lastSin_el11 = load double, double* %14, align 1
  %_rtP_12 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %15 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_12, i64 0, i32 4, i64 0
  %_rtP__RefSignal_HCos_el = load double, double* %15, align 1
  %tmp0 = fmul double %_rtDW__lastSin_el11, %_rtP__RefSignal_HCos_el
  %16 = bitcast i64* %_rtDW_9222 to %DW_GOZSE_T*
  %17 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %16, i64 0, i32 1, i64 0
  %_rtDW__lastCos_el = load double, double* %17, align 1
  %18 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_12, i64 0, i32 3, i64 0
  %_rtP__RefSignal_Hsin_el = load double, double* %18, align 1
  %tmp1 = fmul double %_rtDW__lastCos_el, %_rtP__RefSignal_Hsin_el
  %tmp2 = fadd double %tmp0, %tmp1
  %19 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %16, i64 0, i32 0, i64 0
  store double %tmp2, double* %19, align 1
  %_rtDW_16 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %20 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_16, i64 0, i32 1, i64 0
  %_rtDW__lastCos_el17 = load double, double* %20, align 1
  %_rtP_18 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %21 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_18, i64 0, i32 4, i64 0
  %_rtP__RefSignal_HCos_el19 = load double, double* %21, align 1
  %tmp3 = fmul double %_rtDW__lastCos_el17, %_rtP__RefSignal_HCos_el19
  %HoldSine_20 = load double, double* %HoldSine_, align 8
  %22 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_18, i64 0, i32 3, i64 0
  %_rtP__RefSignal_Hsin_el22 = load double, double* %22, align 1
  %tmp4 = fmul double %HoldSine_20, %_rtP__RefSignal_Hsin_el22
  %tmp5 = fsub double %tmp3, %tmp4
  store double %tmp5, double* %20, align 1
  %_rtDW_24 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %23 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_24, i64 0, i32 2, i64 0
  %24 = bitcast double* %23 to i64*
  %_rtDW__lastSin_i_el223 = load i64, i64* %24, align 1
  store i64 %_rtDW__lastSin_i_el223, i64* %13, align 8
  %_rtDW__lastSin_i_el26 = load double, double* %23, align 1
  %_rtP_27 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %25 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_27, i64 0, i32 11, i64 0
  %_rtP__ThirdHarmonicInj_HCos_el = load double, double* %25, align 1
  %tmp6 = fmul double %_rtDW__lastSin_i_el26, %_rtP__ThirdHarmonicInj_HCos_el
  %26 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_24, i64 0, i32 3, i64 0
  %_rtDW__lastCos_d_el = load double, double* %26, align 1
  %27 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_27, i64 0, i32 10, i64 0
  %_rtP__ThirdHarmonicInj_Hsin_el = load double, double* %27, align 1
  %tmp7 = fmul double %_rtDW__lastCos_d_el, %_rtP__ThirdHarmonicInj_Hsin_el
  %tmp8 = fadd double %tmp6, %tmp7
  store double %tmp8, double* %23, align 1
  %_rtDW_31 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %28 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_31, i64 0, i32 3, i64 0
  %_rtDW__lastCos_d_el32 = load double, double* %28, align 1
  %_rtP_33 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %29 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_33, i64 0, i32 11, i64 0
  %_rtP__ThirdHarmonicInj_HCos_el34 = load double, double* %29, align 1
  %tmp9 = fmul double %_rtDW__lastCos_d_el32, %_rtP__ThirdHarmonicInj_HCos_el34
  %HoldSine_35 = load double, double* %HoldSine_, align 8
  %30 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_33, i64 0, i32 10, i64 0
  %_rtP__ThirdHarmonicInj_Hsin_el37 = load double, double* %30, align 1
  %tmp10 = fmul double %HoldSine_35, %_rtP__ThirdHarmonicInj_Hsin_el37
  %tmp11 = fsub double %tmp9, %tmp10
  store double %tmp11, double* %28, align 1
  %_rtDW_39 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %31 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_39, i64 0, i32 4, i64 0
  %32 = bitcast double* %31 to i64*
  %_rtDW__lastSin_b_el224 = load i64, i64* %32, align 1
  store i64 %_rtDW__lastSin_b_el224, i64* %13, align 8
  %_rtDW__lastSin_b_el41 = load double, double* %31, align 1
  %_rtP_42 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %33 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_42, i64 0, i32 19, i64 0
  %_rtP__uthHarmonicInj_HCos_el = load double, double* %33, align 1
  %tmp12 = fmul double %_rtDW__lastSin_b_el41, %_rtP__uthHarmonicInj_HCos_el
  %34 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_39, i64 0, i32 5, i64 0
  %_rtDW__lastCos_e_el = load double, double* %34, align 1
  %35 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_42, i64 0, i32 18, i64 0
  %_rtP__uthHarmonicInj_Hsin_el = load double, double* %35, align 1
  %tmp13 = fmul double %_rtDW__lastCos_e_el, %_rtP__uthHarmonicInj_Hsin_el
  %tmp14 = fadd double %tmp12, %tmp13
  store double %tmp14, double* %31, align 1
  %_rtDW_46 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %36 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_46, i64 0, i32 5, i64 0
  %_rtDW__lastCos_e_el47 = load double, double* %36, align 1
  %_rtP_48 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %37 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_48, i64 0, i32 19, i64 0
  %_rtP__uthHarmonicInj_HCos_el49 = load double, double* %37, align 1
  %tmp15 = fmul double %_rtDW__lastCos_e_el47, %_rtP__uthHarmonicInj_HCos_el49
  %HoldSine_50 = load double, double* %HoldSine_, align 8
  %38 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_48, i64 0, i32 18, i64 0
  %_rtP__uthHarmonicInj_Hsin_el52 = load double, double* %38, align 1
  %tmp16 = fmul double %HoldSine_50, %_rtP__uthHarmonicInj_Hsin_el52
  %tmp17 = fsub double %tmp15, %tmp16
  store double %tmp17, double* %36, align 1
  %_rtDW_54 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %39 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_54, i64 0, i32 6, i64 0
  %40 = bitcast double* %39 to i64*
  %_rtDW__lastSin_p_el225 = load i64, i64* %40, align 1
  store i64 %_rtDW__lastSin_p_el225, i64* %13, align 8
  %_rtDW__lastSin_p_el56 = load double, double* %39, align 1
  %_rtP_57 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %41 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_57, i64 0, i32 27, i64 0
  %_rtP__ThirdHarmonicInj1_HCos_el = load double, double* %41, align 1
  %tmp18 = fmul double %_rtDW__lastSin_p_el56, %_rtP__ThirdHarmonicInj1_HCos_el
  %42 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_54, i64 0, i32 7, i64 0
  %_rtDW__lastCos_p_el = load double, double* %42, align 1
  %43 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_57, i64 0, i32 26, i64 0
  %_rtP__ThirdHarmonicInj1_Hsin_el = load double, double* %43, align 1
  %tmp19 = fmul double %_rtDW__lastCos_p_el, %_rtP__ThirdHarmonicInj1_Hsin_el
  %tmp20 = fadd double %tmp18, %tmp19
  store double %tmp20, double* %39, align 1
  %_rtDW_61 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %44 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_61, i64 0, i32 7, i64 0
  %_rtDW__lastCos_p_el62 = load double, double* %44, align 1
  %_rtP_63 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %45 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_63, i64 0, i32 27, i64 0
  %_rtP__ThirdHarmonicInj1_HCos_el64 = load double, double* %45, align 1
  %tmp21 = fmul double %_rtDW__lastCos_p_el62, %_rtP__ThirdHarmonicInj1_HCos_el64
  %HoldSine_65 = load double, double* %HoldSine_, align 8
  %46 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_63, i64 0, i32 26, i64 0
  %_rtP__ThirdHarmonicInj1_Hsin_el67 = load double, double* %46, align 1
  %tmp22 = fmul double %HoldSine_65, %_rtP__ThirdHarmonicInj1_Hsin_el67
  %tmp23 = fsub double %tmp21, %tmp22
  store double %tmp23, double* %44, align 1
  %_rtDW_69 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %47 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_69, i64 0, i32 0, i64 1
  %48 = bitcast double* %47 to i64*
  %_rtDW__lastSin_el70226 = load i64, i64* %48, align 1
  store i64 %_rtDW__lastSin_el70226, i64* %13, align 8
  %49 = bitcast i64 %_rtDW__lastSin_el70226 to double
  %_rtP_73 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %50 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_73, i64 0, i32 4, i64 1
  %_rtP__RefSignal_HCos_el74 = load double, double* %50, align 1
  %tmp24 = fmul double %49, %_rtP__RefSignal_HCos_el74
  %51 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_69, i64 0, i32 1, i64 1
  %_rtDW__lastCos_el76 = load double, double* %51, align 1
  %52 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_73, i64 0, i32 3, i64 1
  %_rtP__RefSignal_Hsin_el78 = load double, double* %52, align 1
  %tmp25 = fmul double %_rtDW__lastCos_el76, %_rtP__RefSignal_Hsin_el78
  %tmp26 = fadd double %tmp24, %tmp25
  store double %tmp26, double* %47, align 1
  %_rtDW_80 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %53 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_80, i64 0, i32 1, i64 1
  %_rtDW__lastCos_el81 = load double, double* %53, align 1
  %_rtP_82 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %54 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_82, i64 0, i32 4, i64 1
  %_rtP__RefSignal_HCos_el83 = load double, double* %54, align 1
  %tmp27 = fmul double %_rtDW__lastCos_el81, %_rtP__RefSignal_HCos_el83
  %55 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_82, i64 0, i32 3, i64 1
  %_rtP__RefSignal_Hsin_el86 = load double, double* %55, align 1
  %tmp28 = fmul double %49, %_rtP__RefSignal_Hsin_el86
  %tmp29 = fsub double %tmp27, %tmp28
  store double %tmp29, double* %53, align 1
  %_rtDW_88 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %56 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_88, i64 0, i32 2, i64 1
  %57 = bitcast double* %56 to i64*
  %_rtDW__lastSin_i_el89227 = load i64, i64* %57, align 1
  store i64 %_rtDW__lastSin_i_el89227, i64* %13, align 8
  %58 = bitcast i64 %_rtDW__lastSin_i_el89227 to double
  %_rtP_92 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %59 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_92, i64 0, i32 11, i64 1
  %_rtP__ThirdHarmonicInj_HCos_el93 = load double, double* %59, align 1
  %tmp30 = fmul double %58, %_rtP__ThirdHarmonicInj_HCos_el93
  %60 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_88, i64 0, i32 3, i64 1
  %_rtDW__lastCos_d_el95 = load double, double* %60, align 1
  %61 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_92, i64 0, i32 10, i64 1
  %_rtP__ThirdHarmonicInj_Hsin_el97 = load double, double* %61, align 1
  %tmp31 = fmul double %_rtDW__lastCos_d_el95, %_rtP__ThirdHarmonicInj_Hsin_el97
  %tmp32 = fadd double %tmp30, %tmp31
  store double %tmp32, double* %56, align 1
  %_rtDW_99 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %62 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_99, i64 0, i32 3, i64 1
  %_rtDW__lastCos_d_el100 = load double, double* %62, align 1
  %_rtP_101 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %63 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_101, i64 0, i32 11, i64 1
  %_rtP__ThirdHarmonicInj_HCos_el102 = load double, double* %63, align 1
  %tmp33 = fmul double %_rtDW__lastCos_d_el100, %_rtP__ThirdHarmonicInj_HCos_el102
  %64 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_101, i64 0, i32 10, i64 1
  %_rtP__ThirdHarmonicInj_Hsin_el105 = load double, double* %64, align 1
  %tmp34 = fmul double %58, %_rtP__ThirdHarmonicInj_Hsin_el105
  %tmp35 = fsub double %tmp33, %tmp34
  store double %tmp35, double* %62, align 1
  %_rtDW_107 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %65 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_107, i64 0, i32 4, i64 1
  %66 = bitcast double* %65 to i64*
  %_rtDW__lastSin_b_el108228 = load i64, i64* %66, align 1
  store i64 %_rtDW__lastSin_b_el108228, i64* %13, align 8
  %67 = bitcast i64 %_rtDW__lastSin_b_el108228 to double
  %_rtP_111 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %68 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_111, i64 0, i32 19, i64 1
  %_rtP__uthHarmonicInj_HCos_el112 = load double, double* %68, align 1
  %tmp36 = fmul double %67, %_rtP__uthHarmonicInj_HCos_el112
  %69 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_107, i64 0, i32 5, i64 1
  %_rtDW__lastCos_e_el114 = load double, double* %69, align 1
  %70 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_111, i64 0, i32 18, i64 1
  %_rtP__uthHarmonicInj_Hsin_el116 = load double, double* %70, align 1
  %tmp37 = fmul double %_rtDW__lastCos_e_el114, %_rtP__uthHarmonicInj_Hsin_el116
  %tmp38 = fadd double %tmp36, %tmp37
  store double %tmp38, double* %65, align 1
  %_rtDW_118 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %71 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_118, i64 0, i32 5, i64 1
  %_rtDW__lastCos_e_el119 = load double, double* %71, align 1
  %_rtP_120 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %72 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_120, i64 0, i32 19, i64 1
  %_rtP__uthHarmonicInj_HCos_el121 = load double, double* %72, align 1
  %tmp39 = fmul double %_rtDW__lastCos_e_el119, %_rtP__uthHarmonicInj_HCos_el121
  %73 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_120, i64 0, i32 18, i64 1
  %_rtP__uthHarmonicInj_Hsin_el124 = load double, double* %73, align 1
  %tmp40 = fmul double %67, %_rtP__uthHarmonicInj_Hsin_el124
  %tmp41 = fsub double %tmp39, %tmp40
  store double %tmp41, double* %71, align 1
  %_rtDW_126 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %74 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_126, i64 0, i32 6, i64 1
  %75 = bitcast double* %74 to i64*
  %_rtDW__lastSin_p_el127229 = load i64, i64* %75, align 1
  store i64 %_rtDW__lastSin_p_el127229, i64* %13, align 8
  %76 = bitcast i64 %_rtDW__lastSin_p_el127229 to double
  %_rtP_130 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %77 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_130, i64 0, i32 27, i64 1
  %_rtP__ThirdHarmonicInj1_HCos_el131 = load double, double* %77, align 1
  %tmp42 = fmul double %76, %_rtP__ThirdHarmonicInj1_HCos_el131
  %78 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_126, i64 0, i32 7, i64 1
  %_rtDW__lastCos_p_el133 = load double, double* %78, align 1
  %79 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_130, i64 0, i32 26, i64 1
  %_rtP__ThirdHarmonicInj1_Hsin_el135 = load double, double* %79, align 1
  %tmp43 = fmul double %_rtDW__lastCos_p_el133, %_rtP__ThirdHarmonicInj1_Hsin_el135
  %tmp44 = fadd double %tmp42, %tmp43
  store double %tmp44, double* %74, align 1
  %_rtDW_137 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %80 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_137, i64 0, i32 7, i64 1
  %_rtDW__lastCos_p_el138 = load double, double* %80, align 1
  %_rtP_139 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %81 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_139, i64 0, i32 27, i64 1
  %_rtP__ThirdHarmonicInj1_HCos_el140 = load double, double* %81, align 1
  %tmp45 = fmul double %_rtDW__lastCos_p_el138, %_rtP__ThirdHarmonicInj1_HCos_el140
  %82 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_139, i64 0, i32 26, i64 1
  %_rtP__ThirdHarmonicInj1_Hsin_el143 = load double, double* %82, align 1
  %tmp46 = fmul double %76, %_rtP__ThirdHarmonicInj1_Hsin_el143
  %tmp47 = fsub double %tmp45, %tmp46
  store double %tmp47, double* %80, align 1
  %_rtDW_145 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %83 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_145, i64 0, i32 0, i64 2
  %84 = bitcast double* %83 to i64*
  %_rtDW__lastSin_el146230 = load i64, i64* %84, align 1
  store i64 %_rtDW__lastSin_el146230, i64* %13, align 8
  %85 = bitcast i64 %_rtDW__lastSin_el146230 to double
  %_rtP_149 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %86 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_149, i64 0, i32 4, i64 2
  %_rtP__RefSignal_HCos_el150 = load double, double* %86, align 1
  %tmp48 = fmul double %85, %_rtP__RefSignal_HCos_el150
  %87 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_145, i64 0, i32 1, i64 2
  %_rtDW__lastCos_el152 = load double, double* %87, align 1
  %88 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_149, i64 0, i32 3, i64 2
  %_rtP__RefSignal_Hsin_el154 = load double, double* %88, align 1
  %tmp49 = fmul double %_rtDW__lastCos_el152, %_rtP__RefSignal_Hsin_el154
  %tmp50 = fadd double %tmp48, %tmp49
  store double %tmp50, double* %83, align 1
  %_rtDW_156 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %89 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_156, i64 0, i32 1, i64 2
  %_rtDW__lastCos_el157 = load double, double* %89, align 1
  %_rtP_158 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %90 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_158, i64 0, i32 4, i64 2
  %_rtP__RefSignal_HCos_el159 = load double, double* %90, align 1
  %tmp51 = fmul double %_rtDW__lastCos_el157, %_rtP__RefSignal_HCos_el159
  %91 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_158, i64 0, i32 3, i64 2
  %_rtP__RefSignal_Hsin_el162 = load double, double* %91, align 1
  %tmp52 = fmul double %85, %_rtP__RefSignal_Hsin_el162
  %tmp53 = fsub double %tmp51, %tmp52
  store double %tmp53, double* %89, align 1
  %_rtDW_164 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %92 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_164, i64 0, i32 2, i64 2
  %93 = bitcast double* %92 to i64*
  %_rtDW__lastSin_i_el165231 = load i64, i64* %93, align 1
  store i64 %_rtDW__lastSin_i_el165231, i64* %13, align 8
  %94 = bitcast i64 %_rtDW__lastSin_i_el165231 to double
  %_rtP_168 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %95 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_168, i64 0, i32 11, i64 2
  %_rtP__ThirdHarmonicInj_HCos_el169 = load double, double* %95, align 1
  %tmp54 = fmul double %94, %_rtP__ThirdHarmonicInj_HCos_el169
  %96 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_164, i64 0, i32 3, i64 2
  %_rtDW__lastCos_d_el171 = load double, double* %96, align 1
  %97 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_168, i64 0, i32 10, i64 2
  %_rtP__ThirdHarmonicInj_Hsin_el173 = load double, double* %97, align 1
  %tmp55 = fmul double %_rtDW__lastCos_d_el171, %_rtP__ThirdHarmonicInj_Hsin_el173
  %tmp56 = fadd double %tmp54, %tmp55
  store double %tmp56, double* %92, align 1
  %_rtDW_175 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %98 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_175, i64 0, i32 3, i64 2
  %_rtDW__lastCos_d_el176 = load double, double* %98, align 1
  %_rtP_177 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %99 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_177, i64 0, i32 11, i64 2
  %_rtP__ThirdHarmonicInj_HCos_el178 = load double, double* %99, align 1
  %tmp57 = fmul double %_rtDW__lastCos_d_el176, %_rtP__ThirdHarmonicInj_HCos_el178
  %100 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_177, i64 0, i32 10, i64 2
  %_rtP__ThirdHarmonicInj_Hsin_el181 = load double, double* %100, align 1
  %tmp58 = fmul double %94, %_rtP__ThirdHarmonicInj_Hsin_el181
  %tmp59 = fsub double %tmp57, %tmp58
  store double %tmp59, double* %98, align 1
  %_rtDW_183 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %101 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_183, i64 0, i32 4, i64 2
  %102 = bitcast double* %101 to i64*
  %_rtDW__lastSin_b_el184232 = load i64, i64* %102, align 1
  store i64 %_rtDW__lastSin_b_el184232, i64* %13, align 8
  %103 = bitcast i64 %_rtDW__lastSin_b_el184232 to double
  %_rtP_187 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %104 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_187, i64 0, i32 19, i64 2
  %_rtP__uthHarmonicInj_HCos_el188 = load double, double* %104, align 1
  %tmp60 = fmul double %103, %_rtP__uthHarmonicInj_HCos_el188
  %105 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_183, i64 0, i32 5, i64 2
  %_rtDW__lastCos_e_el190 = load double, double* %105, align 1
  %106 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_187, i64 0, i32 18, i64 2
  %_rtP__uthHarmonicInj_Hsin_el192 = load double, double* %106, align 1
  %tmp61 = fmul double %_rtDW__lastCos_e_el190, %_rtP__uthHarmonicInj_Hsin_el192
  %tmp62 = fadd double %tmp60, %tmp61
  store double %tmp62, double* %101, align 1
  %_rtDW_194 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %107 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 5, i64 2
  %_rtDW__lastCos_e_el195 = load double, double* %107, align 1
  %_rtP_196 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %108 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_196, i64 0, i32 19, i64 2
  %_rtP__uthHarmonicInj_HCos_el197 = load double, double* %108, align 1
  %tmp63 = fmul double %_rtDW__lastCos_e_el195, %_rtP__uthHarmonicInj_HCos_el197
  %109 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_196, i64 0, i32 18, i64 2
  %_rtP__uthHarmonicInj_Hsin_el200 = load double, double* %109, align 1
  %tmp64 = fmul double %103, %_rtP__uthHarmonicInj_Hsin_el200
  %tmp65 = fsub double %tmp63, %tmp64
  store double %tmp65, double* %107, align 1
  %_rtDW_202 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %110 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_202, i64 0, i32 6, i64 2
  %111 = bitcast double* %110 to i64*
  %_rtDW__lastSin_p_el203233 = load i64, i64* %111, align 1
  store i64 %_rtDW__lastSin_p_el203233, i64* %13, align 8
  %112 = bitcast i64 %_rtDW__lastSin_p_el203233 to double
  %_rtP_206 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %113 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_206, i64 0, i32 27, i64 2
  %_rtP__ThirdHarmonicInj1_HCos_el207 = load double, double* %113, align 1
  %tmp66 = fmul double %112, %_rtP__ThirdHarmonicInj1_HCos_el207
  %114 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_202, i64 0, i32 7, i64 2
  %_rtDW__lastCos_p_el209 = load double, double* %114, align 1
  %115 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_206, i64 0, i32 26, i64 2
  %_rtP__ThirdHarmonicInj1_Hsin_el211 = load double, double* %115, align 1
  %tmp67 = fmul double %_rtDW__lastCos_p_el209, %_rtP__ThirdHarmonicInj1_Hsin_el211
  %tmp68 = fadd double %tmp66, %tmp67
  store double %tmp68, double* %110, align 1
  %_rtDW_213 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %116 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_213, i64 0, i32 7, i64 2
  %_rtDW__lastCos_p_el214 = load double, double* %116, align 1
  %_rtP_215 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %117 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_215, i64 0, i32 27, i64 2
  %_rtP__ThirdHarmonicInj1_HCos_el216 = load double, double* %117, align 1
  %tmp69 = fmul double %_rtDW__lastCos_p_el214, %_rtP__ThirdHarmonicInj1_HCos_el216
  %118 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_215, i64 0, i32 26, i64 2
  %_rtP__ThirdHarmonicInj1_Hsin_el219 = load double, double* %118, align 1
  %tmp70 = fmul double %112, %_rtP__ThirdHarmonicInj1_Hsin_el219
  %tmp71 = fsub double %tmp69, %tmp70
  store double %tmp71, double* %116, align 1
  br label %false

false:                                            ; preds = %Update0_entry, %true
  ret void
}

declare i32 @vm_ssIsSampleHit(i8*, i32, i32)

declare i8* @vm_ssGetModelRtp(i8*)

declare i8* @vm__ssGetModelBlockIO(i8*)

define void @Outputs0(i8* %S) {
Outputs0_entry:
  %S_ = alloca i8*, align 8
  store i8* %S, i8** %S_, align 8
  %rtb_uDLookupTable_ = alloca double, align 8
  %tmp_ = alloca double, align 8
  %_rtU_ = alloca %ExternalUPtrs_GOZSE_T*, align 8
  %_rtB_ = alloca %B_GOZSE_T*, align 8
  %_rtP_ = alloca %P_GOZSE_T*, align 8
  %_rtDW_ = alloca %DW_GOZSE_T*, align 8
  %vm_ssIsSampleHitVar0_ = alloca i32, align 4
  %vm_ssGetTaskTimeVar1_ = alloca double, align 8
  %0 = call double @vm_ssGetTaskTime(i8* %S, i32 1)
  store double %0, double* %vm_ssGetTaskTimeVar1_, align 8
  %1 = call i32 @vm_ssIsSampleHit(i8* %S, i32 1, i32 0)
  store i32 %1, i32* %vm_ssIsSampleHitVar0_, align 4
  %2 = call i8* @vm_ssGetRootDWork(i8* %S)
  %3 = bitcast %DW_GOZSE_T** %_rtDW_ to i8**
  store i8* %2, i8** %3, align 8
  %4 = call i8* @vm_ssGetModelRtp(i8* %S)
  %5 = bitcast %P_GOZSE_T** %_rtP_ to i8**
  store i8* %4, i8** %5, align 8
  %6 = call i8* @vm__ssGetModelBlockIO(i8* %S)
  %7 = bitcast %B_GOZSE_T** %_rtB_ to i8**
  store i8* %6, i8** %7, align 8
  %8 = call i8* @vm_ssGetU(i8* %S)
  %9 = bitcast %ExternalUPtrs_GOZSE_T** %_rtU_ to i8**
  store i8* %8, i8** %9, align 8
  %10 = icmp eq i32 %1, 0
  %11 = ptrtoint i8* %8 to i64
  %12 = inttoptr i64 %11 to %ExternalUPtrs_GOZSE_T*
  %13 = ptrtoint i8* %6 to i64
  %14 = inttoptr i64 %13 to %B_GOZSE_T*
  br i1 %10, label %false, label %true

true:                                             ; preds = %Outputs0_entry
  %15 = getelementptr inbounds %ExternalUPtrs_GOZSE_T, %ExternalUPtrs_GOZSE_T* %12, i64 0, i32 0
  %_rtU__dPA_Enable = load i8, i8* %15, align 1
  %16 = getelementptr inbounds %ExternalUPtrs_GOZSE_T, %ExternalUPtrs_GOZSE_T* %12, i64 0, i32 2
  %_rtU__Reload = load i8, i8* %16, align 1
  %_rtDW_24 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %17 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_24, i64 0, i32 15
  %_rtDW__UnitDelay_DSTATE = load i8, i8* %17, align 1
  %18 = or i8 %_rtDW__UnitDelay_DSTATE, %_rtU__Reload
  %19 = and i8 %18, %_rtU__dPA_Enable
  %20 = and i8 %19, 1
  %21 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %14, i64 0, i32 1
  store i8 %20, i8* %21, align 1
  %22 = icmp eq i8 %20, 0
  br i1 %22, label %false2, label %true1

false:                                            ; preds = %false11, %false2, %Outputs0_entry
  ret void

true1:                                            ; preds = %true
  %_rtU_27 = load %ExternalUPtrs_GOZSE_T*, %ExternalUPtrs_GOZSE_T** %_rtU_, align 8
  %23 = getelementptr inbounds %ExternalUPtrs_GOZSE_T, %ExternalUPtrs_GOZSE_T* %_rtU_27, i64 0, i32 1
  %_rtU__MulNumber = load i8, i8* %23, align 1
  %_rtB_28 = load %B_GOZSE_T*, %B_GOZSE_T** %_rtB_, align 8
  %24 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_28, i64 0, i32 4
  store i8 %_rtU__MulNumber, i8* %24, align 1
  %_rtDW_29 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %25 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_29, i64 0, i32 16
  call void @vm_srUpdateBC(i8* %25)
  br label %false2

false2:                                           ; preds = %true, %true1
  %S_30 = load i8*, i8** %S_, align 8
  call void @vm_ssCallAccelRunBlock(i8* %S_30, i32 1, i32 5, i32 104)
  %26 = call i8 @vm_getHasError(i8* %S_30)
  %27 = and i8 %26, 1
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %false3, label %false

false3:                                           ; preds = %false2
  %_rtB_32 = load %B_GOZSE_T*, %B_GOZSE_T** %_rtB_, align 8
  %29 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_32, i64 0, i32 4
  %_rtB__MulNumber = load i8, i8* %29, align 1
  %30 = and i8 %_rtB__MulNumber, 1
  %31 = xor i8 %30, 1
  %32 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_32, i64 0, i32 2
  store i8 %31, i8* %32, align 1
  %_rtDW_34 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %33 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_34, i64 0, i32 9
  %_rtDW__systemEnable = load i32, i32* %33, align 1
  %34 = icmp eq i32 %_rtDW__systemEnable, 0
  br i1 %34, label %false5, label %true4

true4:                                            ; preds = %false3
  %35 = bitcast double* %vm_ssGetTaskTimeVar1_ to i64*
  %vm_ssGetTaskTimeVar1_35449 = load i64, i64* %35, align 8
  %36 = bitcast double* %rtb_uDLookupTable_ to i64*
  store i64 %vm_ssGetTaskTimeVar1_35449, i64* %36, align 8
  %37 = bitcast double* %tmp_ to i64*
  store i64 %vm_ssGetTaskTimeVar1_35449, i64* %37, align 8
  %_rtP_37 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %38 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_37, i64 0, i32 2
  %_rtP__RefSignal_Freq = load double, double* %38, align 1
  %rtb_uDLookupTable_38.cast = bitcast i64 %vm_ssGetTaskTimeVar1_35449 to double
  %tmp0 = fmul double %rtb_uDLookupTable_38.cast, %_rtP__RefSignal_Freq
  %39 = call double @muDoubleScalarSin(double %tmp0)
  %_rtDW_39 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %40 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_39, i64 0, i32 0, i64 0
  store double %39, double* %40, align 1
  %_rtP_40 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %41 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_40, i64 0, i32 2
  %_rtP__RefSignal_Freq41 = load double, double* %41, align 1
  %tmp1 = fmul double %_rtP__RefSignal_Freq41, %rtb_uDLookupTable_38.cast
  %42 = call double @muDoubleScalarCos(double %tmp1)
  %_rtDW_43 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %43 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_43, i64 0, i32 1, i64 0
  store double %42, double* %43, align 1
  %_rtP_44 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %44 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_44, i64 0, i32 2
  %_rtP__RefSignal_Freq45 = load double, double* %44, align 1
  %tmp2 = fmul double %_rtP__RefSignal_Freq45, %rtb_uDLookupTable_38.cast
  %45 = call double @muDoubleScalarSin(double %tmp2)
  %_rtDW_47 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %46 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_47, i64 0, i32 0, i64 1
  store double %45, double* %46, align 1
  %_rtP_48 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %47 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_48, i64 0, i32 2
  %_rtP__RefSignal_Freq49 = load double, double* %47, align 1
  %tmp3 = fmul double %_rtP__RefSignal_Freq49, %rtb_uDLookupTable_38.cast
  %48 = call double @muDoubleScalarCos(double %tmp3)
  %_rtDW_51 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %49 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_51, i64 0, i32 1, i64 1
  store double %48, double* %49, align 1
  %_rtP_52 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %50 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_52, i64 0, i32 2
  %_rtP__RefSignal_Freq53 = load double, double* %50, align 1
  %tmp4 = fmul double %_rtP__RefSignal_Freq53, %rtb_uDLookupTable_38.cast
  %51 = call double @muDoubleScalarSin(double %tmp4)
  %_rtDW_55 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %52 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_55, i64 0, i32 0, i64 2
  store double %51, double* %52, align 1
  %_rtP_56 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %53 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_56, i64 0, i32 2
  %_rtP__RefSignal_Freq57 = load double, double* %53, align 1
  %tmp5 = fmul double %_rtP__RefSignal_Freq57, %rtb_uDLookupTable_38.cast
  %54 = call double @muDoubleScalarCos(double %tmp5)
  %_rtDW_59 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %55 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_59, i64 0, i32 1, i64 2
  store double %54, double* %55, align 1
  %_rtDW_60 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %56 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_60, i64 0, i32 9
  store i32 0, i32* %56, align 1
  %_rtDW_61.pre = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  br label %false5

false5:                                           ; preds = %false3, %true4
  %_rtDW_61 = phi %DW_GOZSE_T* [ %_rtDW_34, %false3 ], [ %_rtDW_61.pre, %true4 ]
  %57 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_61, i64 0, i32 10
  %_rtDW__systemEnable_p = load i32, i32* %57, align 1
  %58 = icmp eq i32 %_rtDW__systemEnable_p, 0
  br i1 %58, label %false7, label %true6

true6:                                            ; preds = %false5
  %59 = bitcast double* %vm_ssGetTaskTimeVar1_ to i64*
  %vm_ssGetTaskTimeVar1_62447 = load i64, i64* %59, align 8
  %60 = bitcast double* %rtb_uDLookupTable_ to i64*
  store i64 %vm_ssGetTaskTimeVar1_62447, i64* %60, align 8
  %61 = bitcast double* %tmp_ to i64*
  store i64 %vm_ssGetTaskTimeVar1_62447, i64* %61, align 8
  %_rtP_64 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %62 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_64, i64 0, i32 9
  %_rtP__ThirdHarmonicInj_Freq = load double, double* %62, align 1
  %rtb_uDLookupTable_65.cast = bitcast i64 %vm_ssGetTaskTimeVar1_62447 to double
  %tmp6 = fmul double %rtb_uDLookupTable_65.cast, %_rtP__ThirdHarmonicInj_Freq
  %63 = call double @muDoubleScalarSin(double %tmp6)
  %_rtDW_66 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %64 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_66, i64 0, i32 2, i64 0
  store double %63, double* %64, align 1
  %_rtP_67 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %65 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_67, i64 0, i32 9
  %_rtP__ThirdHarmonicInj_Freq68 = load double, double* %65, align 1
  %tmp7 = fmul double %_rtP__ThirdHarmonicInj_Freq68, %rtb_uDLookupTable_65.cast
  %66 = call double @muDoubleScalarCos(double %tmp7)
  %_rtDW_70 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %67 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_70, i64 0, i32 3, i64 0
  store double %66, double* %67, align 1
  %_rtP_71 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %68 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_71, i64 0, i32 9
  %_rtP__ThirdHarmonicInj_Freq72 = load double, double* %68, align 1
  %tmp8 = fmul double %_rtP__ThirdHarmonicInj_Freq72, %rtb_uDLookupTable_65.cast
  %69 = call double @muDoubleScalarSin(double %tmp8)
  %_rtDW_74 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %70 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_74, i64 0, i32 2, i64 1
  store double %69, double* %70, align 1
  %_rtP_75 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %71 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_75, i64 0, i32 9
  %_rtP__ThirdHarmonicInj_Freq76 = load double, double* %71, align 1
  %tmp9 = fmul double %_rtP__ThirdHarmonicInj_Freq76, %rtb_uDLookupTable_65.cast
  %72 = call double @muDoubleScalarCos(double %tmp9)
  %_rtDW_78 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %73 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_78, i64 0, i32 3, i64 1
  store double %72, double* %73, align 1
  %_rtP_79 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %74 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_79, i64 0, i32 9
  %_rtP__ThirdHarmonicInj_Freq80 = load double, double* %74, align 1
  %tmp10 = fmul double %_rtP__ThirdHarmonicInj_Freq80, %rtb_uDLookupTable_65.cast
  %75 = call double @muDoubleScalarSin(double %tmp10)
  %_rtDW_82 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %76 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_82, i64 0, i32 2, i64 2
  store double %75, double* %76, align 1
  %_rtP_83 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %77 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_83, i64 0, i32 9
  %_rtP__ThirdHarmonicInj_Freq84 = load double, double* %77, align 1
  %tmp11 = fmul double %_rtP__ThirdHarmonicInj_Freq84, %rtb_uDLookupTable_65.cast
  %78 = call double @muDoubleScalarCos(double %tmp11)
  %_rtDW_86 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %79 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_86, i64 0, i32 3, i64 2
  store double %78, double* %79, align 1
  %_rtDW_87 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %80 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_87, i64 0, i32 10
  store i32 0, i32* %80, align 1
  %_rtDW_88.pre = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  br label %false7

false7:                                           ; preds = %false5, %true6
  %_rtDW_88 = phi %DW_GOZSE_T* [ %_rtDW_61, %false5 ], [ %_rtDW_88.pre, %true6 ]
  %81 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_88, i64 0, i32 11
  %_rtDW__systemEnable_g = load i32, i32* %81, align 1
  %82 = icmp eq i32 %_rtDW__systemEnable_g, 0
  br i1 %82, label %false9, label %true8

true8:                                            ; preds = %false7
  %83 = bitcast double* %vm_ssGetTaskTimeVar1_ to i64*
  %vm_ssGetTaskTimeVar1_89445 = load i64, i64* %83, align 8
  %84 = bitcast double* %rtb_uDLookupTable_ to i64*
  store i64 %vm_ssGetTaskTimeVar1_89445, i64* %84, align 8
  %85 = bitcast double* %tmp_ to i64*
  store i64 %vm_ssGetTaskTimeVar1_89445, i64* %85, align 8
  %_rtP_91 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %86 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_91, i64 0, i32 17
  %_rtP__uthHarmonicInj_Freq = load double, double* %86, align 1
  %rtb_uDLookupTable_92.cast = bitcast i64 %vm_ssGetTaskTimeVar1_89445 to double
  %tmp12 = fmul double %rtb_uDLookupTable_92.cast, %_rtP__uthHarmonicInj_Freq
  %87 = call double @muDoubleScalarSin(double %tmp12)
  %_rtDW_93 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %88 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_93, i64 0, i32 4, i64 0
  store double %87, double* %88, align 1
  %_rtP_94 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %89 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_94, i64 0, i32 17
  %_rtP__uthHarmonicInj_Freq95 = load double, double* %89, align 1
  %tmp13 = fmul double %_rtP__uthHarmonicInj_Freq95, %rtb_uDLookupTable_92.cast
  %90 = call double @muDoubleScalarCos(double %tmp13)
  %_rtDW_97 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %91 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_97, i64 0, i32 5, i64 0
  store double %90, double* %91, align 1
  %_rtP_98 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %92 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_98, i64 0, i32 17
  %_rtP__uthHarmonicInj_Freq99 = load double, double* %92, align 1
  %tmp14 = fmul double %_rtP__uthHarmonicInj_Freq99, %rtb_uDLookupTable_92.cast
  %93 = call double @muDoubleScalarSin(double %tmp14)
  %_rtDW_101 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %94 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_101, i64 0, i32 4, i64 1
  store double %93, double* %94, align 1
  %_rtP_102 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %95 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_102, i64 0, i32 17
  %_rtP__uthHarmonicInj_Freq103 = load double, double* %95, align 1
  %tmp15 = fmul double %_rtP__uthHarmonicInj_Freq103, %rtb_uDLookupTable_92.cast
  %96 = call double @muDoubleScalarCos(double %tmp15)
  %_rtDW_105 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %97 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_105, i64 0, i32 5, i64 1
  store double %96, double* %97, align 1
  %_rtP_106 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %98 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_106, i64 0, i32 17
  %_rtP__uthHarmonicInj_Freq107 = load double, double* %98, align 1
  %tmp16 = fmul double %_rtP__uthHarmonicInj_Freq107, %rtb_uDLookupTable_92.cast
  %99 = call double @muDoubleScalarSin(double %tmp16)
  %_rtDW_109 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %100 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_109, i64 0, i32 4, i64 2
  store double %99, double* %100, align 1
  %_rtP_110 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %101 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_110, i64 0, i32 17
  %_rtP__uthHarmonicInj_Freq111 = load double, double* %101, align 1
  %tmp17 = fmul double %_rtP__uthHarmonicInj_Freq111, %rtb_uDLookupTable_92.cast
  %102 = call double @muDoubleScalarCos(double %tmp17)
  %_rtDW_113 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %103 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_113, i64 0, i32 5, i64 2
  store double %102, double* %103, align 1
  %_rtDW_114 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %104 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_114, i64 0, i32 11
  store i32 0, i32* %104, align 1
  %_rtDW_115.pre = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  br label %false9

false9:                                           ; preds = %false7, %true8
  %_rtDW_115 = phi %DW_GOZSE_T* [ %_rtDW_88, %false7 ], [ %_rtDW_115.pre, %true8 ]
  %105 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_115, i64 0, i32 12
  %_rtDW__systemEnable_a = load i32, i32* %105, align 1
  %106 = icmp eq i32 %_rtDW__systemEnable_a, 0
  br i1 %106, label %false11, label %true10

true10:                                           ; preds = %false9
  %107 = bitcast double* %vm_ssGetTaskTimeVar1_ to i64*
  %vm_ssGetTaskTimeVar1_116443 = load i64, i64* %107, align 8
  %108 = bitcast double* %rtb_uDLookupTable_ to i64*
  store i64 %vm_ssGetTaskTimeVar1_116443, i64* %108, align 8
  %109 = bitcast double* %tmp_ to i64*
  store i64 %vm_ssGetTaskTimeVar1_116443, i64* %109, align 8
  %_rtP_118 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %110 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_118, i64 0, i32 25
  %_rtP__ThirdHarmonicInj1_Freq = load double, double* %110, align 1
  %rtb_uDLookupTable_119.cast = bitcast i64 %vm_ssGetTaskTimeVar1_116443 to double
  %tmp18 = fmul double %rtb_uDLookupTable_119.cast, %_rtP__ThirdHarmonicInj1_Freq
  %111 = call double @muDoubleScalarSin(double %tmp18)
  %_rtDW_120 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %112 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_120, i64 0, i32 6, i64 0
  store double %111, double* %112, align 1
  %_rtP_121 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %113 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_121, i64 0, i32 25
  %_rtP__ThirdHarmonicInj1_Freq122 = load double, double* %113, align 1
  %tmp19 = fmul double %_rtP__ThirdHarmonicInj1_Freq122, %rtb_uDLookupTable_119.cast
  %114 = call double @muDoubleScalarCos(double %tmp19)
  %_rtDW_124 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %115 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_124, i64 0, i32 7, i64 0
  store double %114, double* %115, align 1
  %_rtP_125 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %116 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_125, i64 0, i32 25
  %_rtP__ThirdHarmonicInj1_Freq126 = load double, double* %116, align 1
  %tmp20 = fmul double %_rtP__ThirdHarmonicInj1_Freq126, %rtb_uDLookupTable_119.cast
  %117 = call double @muDoubleScalarSin(double %tmp20)
  %_rtDW_128 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %118 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_128, i64 0, i32 6, i64 1
  store double %117, double* %118, align 1
  %_rtP_129 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %119 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_129, i64 0, i32 25
  %_rtP__ThirdHarmonicInj1_Freq130 = load double, double* %119, align 1
  %tmp21 = fmul double %_rtP__ThirdHarmonicInj1_Freq130, %rtb_uDLookupTable_119.cast
  %120 = call double @muDoubleScalarCos(double %tmp21)
  %_rtDW_132 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %121 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_132, i64 0, i32 7, i64 1
  store double %120, double* %121, align 1
  %_rtP_133 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %122 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_133, i64 0, i32 25
  %_rtP__ThirdHarmonicInj1_Freq134 = load double, double* %122, align 1
  %tmp22 = fmul double %_rtP__ThirdHarmonicInj1_Freq134, %rtb_uDLookupTable_119.cast
  %123 = call double @muDoubleScalarSin(double %tmp22)
  %_rtDW_136 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %124 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_136, i64 0, i32 6, i64 2
  store double %123, double* %124, align 1
  %_rtP_137 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %125 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_137, i64 0, i32 25
  %_rtP__ThirdHarmonicInj1_Freq138 = load double, double* %125, align 1
  %tmp23 = fmul double %_rtP__ThirdHarmonicInj1_Freq138, %rtb_uDLookupTable_119.cast
  %126 = call double @muDoubleScalarCos(double %tmp23)
  %_rtDW_140 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %127 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_140, i64 0, i32 7, i64 2
  store double %126, double* %127, align 1
  %_rtDW_141 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %128 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_141, i64 0, i32 12
  store i32 0, i32* %128, align 1
  %_rtDW_142.pre = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  br label %false11

false11:                                          ; preds = %false9, %true10
  %_rtDW_194 = phi %DW_GOZSE_T* [ %_rtDW_115, %false9 ], [ %_rtDW_142.pre, %true10 ]
  %129 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 2, i64 0
  %_rtDW__lastSin_i_el = load double, double* %129, align 1
  %_rtP_143 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %130 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 13, i64 0
  %_rtP__ThirdHarmonicInj_PCos_el = load double, double* %130, align 1
  %tmp24 = fmul double %_rtDW__lastSin_i_el, %_rtP__ThirdHarmonicInj_PCos_el
  %131 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 3, i64 0
  %_rtDW__lastCos_d_el = load double, double* %131, align 1
  %132 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 12, i64 0
  %_rtP__ThirdHarmonicInj_PSin_el = load double, double* %132, align 1
  %tmp25 = fmul double %_rtDW__lastCos_d_el, %_rtP__ThirdHarmonicInj_PSin_el
  %tmp26 = fadd double %tmp24, %tmp25
  %133 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 11, i64 0
  %_rtP__ThirdHarmonicInj_HCos_el = load double, double* %133, align 1
  %tmp27 = fmul double %_rtP__ThirdHarmonicInj_HCos_el, %tmp26
  %tmp28 = fmul double %_rtDW__lastCos_d_el, %_rtP__ThirdHarmonicInj_PCos_el
  %tmp29 = fmul double %_rtDW__lastSin_i_el, %_rtP__ThirdHarmonicInj_PSin_el
  %tmp30 = fsub double %tmp28, %tmp29
  %134 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 10, i64 0
  %_rtP__ThirdHarmonicInj_Hsin_el = load double, double* %134, align 1
  %tmp31 = fmul double %_rtP__ThirdHarmonicInj_Hsin_el, %tmp30
  %tmp32 = fadd double %tmp27, %tmp31
  %135 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 7
  %_rtP__ThirdHarmonicInj_Amp = load double, double* %135, align 1
  %tmp33 = fmul double %_rtP__ThirdHarmonicInj_Amp, %tmp32
  %136 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 8
  %_rtP__ThirdHarmonicInj_Bias = load double, double* %136, align 1
  %tmp34 = fadd double %_rtP__ThirdHarmonicInj_Bias, %tmp33
  %137 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 14
  %_rtP__Gain2_Gain = load double, double* %137, align 1
  %tmp35 = fmul double %tmp34, %_rtP__Gain2_Gain
  %138 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 0, i64 0
  %_rtDW__lastSin_el = load double, double* %138, align 1
  %139 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 6, i64 0
  %_rtP__RefSignal_PCos_el = load double, double* %139, align 1
  %tmp36 = fmul double %_rtDW__lastSin_el, %_rtP__RefSignal_PCos_el
  %140 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 1, i64 0
  %_rtDW__lastCos_el = load double, double* %140, align 1
  %141 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 5, i64 0
  %_rtP__RefSignal_PSin_el = load double, double* %141, align 1
  %tmp37 = fmul double %_rtDW__lastCos_el, %_rtP__RefSignal_PSin_el
  %tmp38 = fadd double %tmp36, %tmp37
  %142 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 4, i64 0
  %_rtP__RefSignal_HCos_el = load double, double* %142, align 1
  %tmp39 = fmul double %_rtP__RefSignal_HCos_el, %tmp38
  %tmp40 = fmul double %_rtDW__lastCos_el, %_rtP__RefSignal_PCos_el
  %tmp41 = fmul double %_rtDW__lastSin_el, %_rtP__RefSignal_PSin_el
  %tmp42 = fsub double %tmp40, %tmp41
  %143 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 3, i64 0
  %_rtP__RefSignal_Hsin_el = load double, double* %143, align 1
  %tmp43 = fmul double %_rtP__RefSignal_Hsin_el, %tmp42
  %tmp44 = fadd double %tmp39, %tmp43
  %144 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 0
  %_rtP__RefSignal_Amp = load double, double* %144, align 1
  %tmp45 = fmul double %_rtP__RefSignal_Amp, %tmp44
  %145 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 1
  %_rtP__RefSignal_Bias = load double, double* %145, align 1
  %tmp46 = fadd double %_rtP__RefSignal_Bias, %tmp45
  %tmp47 = fadd double %tmp35, %tmp46
  %146 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 4, i64 0
  %_rtDW__lastSin_b_el = load double, double* %146, align 1
  %147 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 21, i64 0
  %_rtP__uthHarmonicInj_PCos_el = load double, double* %147, align 1
  %tmp48 = fmul double %_rtDW__lastSin_b_el, %_rtP__uthHarmonicInj_PCos_el
  %148 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 5, i64 0
  %_rtDW__lastCos_e_el = load double, double* %148, align 1
  %149 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 20, i64 0
  %_rtP__uthHarmonicInj_PSin_el = load double, double* %149, align 1
  %tmp49 = fmul double %_rtDW__lastCos_e_el, %_rtP__uthHarmonicInj_PSin_el
  %tmp50 = fadd double %tmp48, %tmp49
  %150 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 19, i64 0
  %_rtP__uthHarmonicInj_HCos_el = load double, double* %150, align 1
  %tmp51 = fmul double %_rtP__uthHarmonicInj_HCos_el, %tmp50
  %tmp52 = fmul double %_rtDW__lastCos_e_el, %_rtP__uthHarmonicInj_PCos_el
  %tmp53 = fmul double %_rtDW__lastSin_b_el, %_rtP__uthHarmonicInj_PSin_el
  %tmp54 = fsub double %tmp52, %tmp53
  %151 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 18, i64 0
  %_rtP__uthHarmonicInj_Hsin_el = load double, double* %151, align 1
  %tmp55 = fmul double %_rtP__uthHarmonicInj_Hsin_el, %tmp54
  %tmp56 = fadd double %tmp51, %tmp55
  %152 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 15
  %_rtP__uthHarmonicInj_Amp = load double, double* %152, align 1
  %tmp57 = fmul double %_rtP__uthHarmonicInj_Amp, %tmp56
  %153 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 16
  %_rtP__uthHarmonicInj_Bias = load double, double* %153, align 1
  %tmp58 = fadd double %_rtP__uthHarmonicInj_Bias, %tmp57
  %154 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 22
  %_rtP__Gain1_Gain = load double, double* %154, align 1
  %tmp59 = fmul double %tmp58, %_rtP__Gain1_Gain
  %tmp60 = fadd double %tmp47, %tmp59
  %155 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 6, i64 0
  %_rtDW__lastSin_p_el = load double, double* %155, align 1
  %156 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 29, i64 0
  %_rtP__ThirdHarmonicInj1_PCos_el = load double, double* %156, align 1
  %tmp61 = fmul double %_rtDW__lastSin_p_el, %_rtP__ThirdHarmonicInj1_PCos_el
  %157 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_194, i64 0, i32 7, i64 0
  %_rtDW__lastCos_p_el = load double, double* %157, align 1
  %158 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 28, i64 0
  %_rtP__ThirdHarmonicInj1_PSin_el = load double, double* %158, align 1
  %tmp62 = fmul double %_rtDW__lastCos_p_el, %_rtP__ThirdHarmonicInj1_PSin_el
  %tmp63 = fadd double %tmp61, %tmp62
  %159 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_143, i64 0, i32 27, i64 0
  %_rtP__ThirdHarmonicInj1_HCos_el = load double, double* %159, align 1
  %tmp64 = fmul double %_rtP__ThirdHarmonicInj1_HCos_el, %tmp63
  %_rtDW_197 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %160 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_197, i64 0, i32 7, i64 0
  %_rtDW__lastCos_p_el198 = load double, double* %160, align 1
  %_rtP_199 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %161 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_199, i64 0, i32 29, i64 0
  %_rtP__ThirdHarmonicInj1_PCos_el200 = load double, double* %161, align 1
  %tmp65 = fmul double %_rtDW__lastCos_p_el198, %_rtP__ThirdHarmonicInj1_PCos_el200
  %162 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_197, i64 0, i32 6, i64 0
  %_rtDW__lastSin_p_el202 = load double, double* %162, align 1
  %163 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_199, i64 0, i32 28, i64 0
  %_rtP__ThirdHarmonicInj1_PSin_el204 = load double, double* %163, align 1
  %tmp66 = fmul double %_rtDW__lastSin_p_el202, %_rtP__ThirdHarmonicInj1_PSin_el204
  %tmp67 = fsub double %tmp65, %tmp66
  %164 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_199, i64 0, i32 26, i64 0
  %_rtP__ThirdHarmonicInj1_Hsin_el = load double, double* %164, align 1
  %tmp68 = fmul double %_rtP__ThirdHarmonicInj1_Hsin_el, %tmp67
  %tmp69 = fadd double %tmp64, %tmp68
  %165 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_199, i64 0, i32 23
  %_rtP__ThirdHarmonicInj1_Amp = load double, double* %165, align 1
  %tmp70 = fmul double %_rtP__ThirdHarmonicInj1_Amp, %tmp69
  %166 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_199, i64 0, i32 24
  %_rtP__ThirdHarmonicInj1_Bias = load double, double* %166, align 1
  %tmp71 = fadd double %_rtP__ThirdHarmonicInj1_Bias, %tmp70
  %167 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_199, i64 0, i32 30
  %_rtP__Gain4_Gain = load double, double* %167, align 1
  %tmp72 = fmul double %tmp71, %_rtP__Gain4_Gain
  %tmp73 = fadd double %tmp60, %tmp72
  %168 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_199, i64 0, i32 31
  %_rtP__Gain3_Gain = load double, double* %168, align 1
  %tmp74 = fmul double %_rtP__Gain3_Gain, %tmp73
  %_rtB_210 = load %B_GOZSE_T*, %B_GOZSE_T** %_rtB_, align 8
  %169 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_210, i64 0, i32 0, i64 0
  store double %tmp74, double* %169, align 1
  %_rtDW_211 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %170 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_211, i64 0, i32 2, i64 1
  %_rtDW__lastSin_i_el212 = load double, double* %170, align 1
  %_rtP_213 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %171 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 13, i64 1
  %_rtP__ThirdHarmonicInj_PCos_el214 = load double, double* %171, align 1
  %tmp75 = fmul double %_rtDW__lastSin_i_el212, %_rtP__ThirdHarmonicInj_PCos_el214
  %172 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_211, i64 0, i32 3, i64 1
  %_rtDW__lastCos_d_el216 = load double, double* %172, align 1
  %173 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 12, i64 1
  %_rtP__ThirdHarmonicInj_PSin_el218 = load double, double* %173, align 1
  %tmp76 = fmul double %_rtDW__lastCos_d_el216, %_rtP__ThirdHarmonicInj_PSin_el218
  %tmp77 = fadd double %tmp75, %tmp76
  %174 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 11, i64 1
  %_rtP__ThirdHarmonicInj_HCos_el220 = load double, double* %174, align 1
  %tmp78 = fmul double %_rtP__ThirdHarmonicInj_HCos_el220, %tmp77
  %tmp79 = fmul double %_rtDW__lastCos_d_el216, %_rtP__ThirdHarmonicInj_PCos_el214
  %tmp80 = fmul double %_rtDW__lastSin_i_el212, %_rtP__ThirdHarmonicInj_PSin_el218
  %tmp81 = fsub double %tmp79, %tmp80
  %175 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 10, i64 1
  %_rtP__ThirdHarmonicInj_Hsin_el230 = load double, double* %175, align 1
  %tmp82 = fmul double %_rtP__ThirdHarmonicInj_Hsin_el230, %tmp81
  %tmp83 = fadd double %tmp78, %tmp82
  %176 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 7
  %_rtP__ThirdHarmonicInj_Amp232 = load double, double* %176, align 1
  %tmp84 = fmul double %_rtP__ThirdHarmonicInj_Amp232, %tmp83
  %177 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 8
  %_rtP__ThirdHarmonicInj_Bias234 = load double, double* %177, align 1
  %tmp85 = fadd double %_rtP__ThirdHarmonicInj_Bias234, %tmp84
  %178 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 14
  %_rtP__Gain2_Gain236 = load double, double* %178, align 1
  %tmp86 = fmul double %tmp85, %_rtP__Gain2_Gain236
  %179 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_211, i64 0, i32 0, i64 1
  %_rtDW__lastSin_el238 = load double, double* %179, align 1
  %180 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 6, i64 1
  %_rtP__RefSignal_PCos_el240 = load double, double* %180, align 1
  %tmp87 = fmul double %_rtDW__lastSin_el238, %_rtP__RefSignal_PCos_el240
  %181 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_211, i64 0, i32 1, i64 1
  %_rtDW__lastCos_el242 = load double, double* %181, align 1
  %182 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 5, i64 1
  %_rtP__RefSignal_PSin_el244 = load double, double* %182, align 1
  %tmp88 = fmul double %_rtDW__lastCos_el242, %_rtP__RefSignal_PSin_el244
  %tmp89 = fadd double %tmp87, %tmp88
  %183 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 4, i64 1
  %_rtP__RefSignal_HCos_el246 = load double, double* %183, align 1
  %tmp90 = fmul double %_rtP__RefSignal_HCos_el246, %tmp89
  %tmp91 = fmul double %_rtDW__lastCos_el242, %_rtP__RefSignal_PCos_el240
  %tmp92 = fmul double %_rtDW__lastSin_el238, %_rtP__RefSignal_PSin_el244
  %tmp93 = fsub double %tmp91, %tmp92
  %184 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 3, i64 1
  %_rtP__RefSignal_Hsin_el256 = load double, double* %184, align 1
  %tmp94 = fmul double %_rtP__RefSignal_Hsin_el256, %tmp93
  %tmp95 = fadd double %tmp90, %tmp94
  %185 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 0
  %_rtP__RefSignal_Amp258 = load double, double* %185, align 1
  %tmp96 = fmul double %_rtP__RefSignal_Amp258, %tmp95
  %186 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 1
  %_rtP__RefSignal_Bias260 = load double, double* %186, align 1
  %tmp97 = fadd double %_rtP__RefSignal_Bias260, %tmp96
  %tmp98 = fadd double %tmp86, %tmp97
  %187 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_211, i64 0, i32 4, i64 1
  %_rtDW__lastSin_b_el262 = load double, double* %187, align 1
  %188 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 21, i64 1
  %_rtP__uthHarmonicInj_PCos_el264 = load double, double* %188, align 1
  %tmp99 = fmul double %_rtDW__lastSin_b_el262, %_rtP__uthHarmonicInj_PCos_el264
  %189 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_211, i64 0, i32 5, i64 1
  %_rtDW__lastCos_e_el266 = load double, double* %189, align 1
  %190 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 20, i64 1
  %_rtP__uthHarmonicInj_PSin_el268 = load double, double* %190, align 1
  %tmp100 = fmul double %_rtDW__lastCos_e_el266, %_rtP__uthHarmonicInj_PSin_el268
  %tmp101 = fadd double %tmp99, %tmp100
  %191 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 19, i64 1
  %_rtP__uthHarmonicInj_HCos_el270 = load double, double* %191, align 1
  %tmp102 = fmul double %_rtP__uthHarmonicInj_HCos_el270, %tmp101
  %tmp103 = fmul double %_rtDW__lastCos_e_el266, %_rtP__uthHarmonicInj_PCos_el264
  %tmp104 = fmul double %_rtDW__lastSin_b_el262, %_rtP__uthHarmonicInj_PSin_el268
  %tmp105 = fsub double %tmp103, %tmp104
  %192 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 18, i64 1
  %_rtP__uthHarmonicInj_Hsin_el280 = load double, double* %192, align 1
  %tmp106 = fmul double %_rtP__uthHarmonicInj_Hsin_el280, %tmp105
  %tmp107 = fadd double %tmp102, %tmp106
  %193 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 15
  %_rtP__uthHarmonicInj_Amp282 = load double, double* %193, align 1
  %tmp108 = fmul double %_rtP__uthHarmonicInj_Amp282, %tmp107
  %194 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 16
  %_rtP__uthHarmonicInj_Bias284 = load double, double* %194, align 1
  %tmp109 = fadd double %_rtP__uthHarmonicInj_Bias284, %tmp108
  %195 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 22
  %_rtP__Gain1_Gain286 = load double, double* %195, align 1
  %tmp110 = fmul double %tmp109, %_rtP__Gain1_Gain286
  %tmp111 = fadd double %tmp98, %tmp110
  %196 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_211, i64 0, i32 6, i64 1
  %_rtDW__lastSin_p_el288 = load double, double* %196, align 1
  %197 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 29, i64 1
  %_rtP__ThirdHarmonicInj1_PCos_el290 = load double, double* %197, align 1
  %tmp112 = fmul double %_rtDW__lastSin_p_el288, %_rtP__ThirdHarmonicInj1_PCos_el290
  %198 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_211, i64 0, i32 7, i64 1
  %_rtDW__lastCos_p_el292 = load double, double* %198, align 1
  %199 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 28, i64 1
  %_rtP__ThirdHarmonicInj1_PSin_el294 = load double, double* %199, align 1
  %tmp113 = fmul double %_rtDW__lastCos_p_el292, %_rtP__ThirdHarmonicInj1_PSin_el294
  %tmp114 = fadd double %tmp112, %tmp113
  %200 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_213, i64 0, i32 27, i64 1
  %_rtP__ThirdHarmonicInj1_HCos_el296 = load double, double* %200, align 1
  %tmp115 = fmul double %_rtP__ThirdHarmonicInj1_HCos_el296, %tmp114
  %_rtDW_297 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %201 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_297, i64 0, i32 7, i64 1
  %_rtDW__lastCos_p_el298 = load double, double* %201, align 1
  %_rtP_299 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %202 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_299, i64 0, i32 29, i64 1
  %_rtP__ThirdHarmonicInj1_PCos_el300 = load double, double* %202, align 1
  %tmp116 = fmul double %_rtDW__lastCos_p_el298, %_rtP__ThirdHarmonicInj1_PCos_el300
  %203 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_297, i64 0, i32 6, i64 1
  %_rtDW__lastSin_p_el302 = load double, double* %203, align 1
  %204 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_299, i64 0, i32 28, i64 1
  %_rtP__ThirdHarmonicInj1_PSin_el304 = load double, double* %204, align 1
  %tmp117 = fmul double %_rtDW__lastSin_p_el302, %_rtP__ThirdHarmonicInj1_PSin_el304
  %tmp118 = fsub double %tmp116, %tmp117
  %205 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_299, i64 0, i32 26, i64 1
  %_rtP__ThirdHarmonicInj1_Hsin_el306 = load double, double* %205, align 1
  %tmp119 = fmul double %_rtP__ThirdHarmonicInj1_Hsin_el306, %tmp118
  %tmp120 = fadd double %tmp115, %tmp119
  %206 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_299, i64 0, i32 23
  %_rtP__ThirdHarmonicInj1_Amp308 = load double, double* %206, align 1
  %tmp121 = fmul double %_rtP__ThirdHarmonicInj1_Amp308, %tmp120
  %207 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_299, i64 0, i32 24
  %_rtP__ThirdHarmonicInj1_Bias310 = load double, double* %207, align 1
  %tmp122 = fadd double %_rtP__ThirdHarmonicInj1_Bias310, %tmp121
  %208 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_299, i64 0, i32 30
  %_rtP__Gain4_Gain312 = load double, double* %208, align 1
  %tmp123 = fmul double %tmp122, %_rtP__Gain4_Gain312
  %tmp124 = fadd double %tmp111, %tmp123
  %209 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_299, i64 0, i32 31
  %_rtP__Gain3_Gain314 = load double, double* %209, align 1
  %tmp125 = fmul double %_rtP__Gain3_Gain314, %tmp124
  %_rtB_315 = load %B_GOZSE_T*, %B_GOZSE_T** %_rtB_, align 8
  %210 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_315, i64 0, i32 0, i64 1
  store double %tmp125, double* %210, align 1
  %_rtDW_316 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %211 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_316, i64 0, i32 2, i64 2
  %_rtDW__lastSin_i_el317 = load double, double* %211, align 1
  %_rtP_318 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %212 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 13, i64 2
  %_rtP__ThirdHarmonicInj_PCos_el319 = load double, double* %212, align 1
  %tmp126 = fmul double %_rtDW__lastSin_i_el317, %_rtP__ThirdHarmonicInj_PCos_el319
  %213 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_316, i64 0, i32 3, i64 2
  %_rtDW__lastCos_d_el321 = load double, double* %213, align 1
  %214 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 12, i64 2
  %_rtP__ThirdHarmonicInj_PSin_el323 = load double, double* %214, align 1
  %tmp127 = fmul double %_rtDW__lastCos_d_el321, %_rtP__ThirdHarmonicInj_PSin_el323
  %tmp128 = fadd double %tmp126, %tmp127
  %215 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 11, i64 2
  %_rtP__ThirdHarmonicInj_HCos_el325 = load double, double* %215, align 1
  %tmp129 = fmul double %_rtP__ThirdHarmonicInj_HCos_el325, %tmp128
  %tmp130 = fmul double %_rtDW__lastCos_d_el321, %_rtP__ThirdHarmonicInj_PCos_el319
  %tmp131 = fmul double %_rtDW__lastSin_i_el317, %_rtP__ThirdHarmonicInj_PSin_el323
  %tmp132 = fsub double %tmp130, %tmp131
  %216 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 10, i64 2
  %_rtP__ThirdHarmonicInj_Hsin_el335 = load double, double* %216, align 1
  %tmp133 = fmul double %_rtP__ThirdHarmonicInj_Hsin_el335, %tmp132
  %tmp134 = fadd double %tmp129, %tmp133
  %217 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 7
  %_rtP__ThirdHarmonicInj_Amp337 = load double, double* %217, align 1
  %tmp135 = fmul double %_rtP__ThirdHarmonicInj_Amp337, %tmp134
  %218 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 8
  %_rtP__ThirdHarmonicInj_Bias339 = load double, double* %218, align 1
  %tmp136 = fadd double %_rtP__ThirdHarmonicInj_Bias339, %tmp135
  %219 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 14
  %_rtP__Gain2_Gain341 = load double, double* %219, align 1
  %tmp137 = fmul double %tmp136, %_rtP__Gain2_Gain341
  %220 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_316, i64 0, i32 0, i64 2
  %_rtDW__lastSin_el343 = load double, double* %220, align 1
  %221 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 6, i64 2
  %_rtP__RefSignal_PCos_el345 = load double, double* %221, align 1
  %tmp138 = fmul double %_rtDW__lastSin_el343, %_rtP__RefSignal_PCos_el345
  %222 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_316, i64 0, i32 1, i64 2
  %_rtDW__lastCos_el347 = load double, double* %222, align 1
  %223 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 5, i64 2
  %_rtP__RefSignal_PSin_el349 = load double, double* %223, align 1
  %tmp139 = fmul double %_rtDW__lastCos_el347, %_rtP__RefSignal_PSin_el349
  %tmp140 = fadd double %tmp138, %tmp139
  %224 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 4, i64 2
  %_rtP__RefSignal_HCos_el351 = load double, double* %224, align 1
  %tmp141 = fmul double %_rtP__RefSignal_HCos_el351, %tmp140
  %tmp142 = fmul double %_rtDW__lastCos_el347, %_rtP__RefSignal_PCos_el345
  %tmp143 = fmul double %_rtDW__lastSin_el343, %_rtP__RefSignal_PSin_el349
  %tmp144 = fsub double %tmp142, %tmp143
  %225 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 3, i64 2
  %_rtP__RefSignal_Hsin_el361 = load double, double* %225, align 1
  %tmp145 = fmul double %_rtP__RefSignal_Hsin_el361, %tmp144
  %tmp146 = fadd double %tmp141, %tmp145
  %226 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 0
  %_rtP__RefSignal_Amp363 = load double, double* %226, align 1
  %tmp147 = fmul double %_rtP__RefSignal_Amp363, %tmp146
  %227 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 1
  %_rtP__RefSignal_Bias365 = load double, double* %227, align 1
  %tmp148 = fadd double %_rtP__RefSignal_Bias365, %tmp147
  %tmp149 = fadd double %tmp137, %tmp148
  %228 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_316, i64 0, i32 4, i64 2
  %_rtDW__lastSin_b_el367 = load double, double* %228, align 1
  %229 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 21, i64 2
  %_rtP__uthHarmonicInj_PCos_el369 = load double, double* %229, align 1
  %tmp150 = fmul double %_rtDW__lastSin_b_el367, %_rtP__uthHarmonicInj_PCos_el369
  %230 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_316, i64 0, i32 5, i64 2
  %_rtDW__lastCos_e_el371 = load double, double* %230, align 1
  %231 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 20, i64 2
  %_rtP__uthHarmonicInj_PSin_el373 = load double, double* %231, align 1
  %tmp151 = fmul double %_rtDW__lastCos_e_el371, %_rtP__uthHarmonicInj_PSin_el373
  %tmp152 = fadd double %tmp150, %tmp151
  %232 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 19, i64 2
  %_rtP__uthHarmonicInj_HCos_el375 = load double, double* %232, align 1
  %tmp153 = fmul double %_rtP__uthHarmonicInj_HCos_el375, %tmp152
  %tmp154 = fmul double %_rtDW__lastCos_e_el371, %_rtP__uthHarmonicInj_PCos_el369
  %tmp155 = fmul double %_rtDW__lastSin_b_el367, %_rtP__uthHarmonicInj_PSin_el373
  %tmp156 = fsub double %tmp154, %tmp155
  %233 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 18, i64 2
  %_rtP__uthHarmonicInj_Hsin_el385 = load double, double* %233, align 1
  %tmp157 = fmul double %_rtP__uthHarmonicInj_Hsin_el385, %tmp156
  %tmp158 = fadd double %tmp153, %tmp157
  %234 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 15
  %_rtP__uthHarmonicInj_Amp387 = load double, double* %234, align 1
  %tmp159 = fmul double %_rtP__uthHarmonicInj_Amp387, %tmp158
  %235 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 16
  %_rtP__uthHarmonicInj_Bias389 = load double, double* %235, align 1
  %tmp160 = fadd double %_rtP__uthHarmonicInj_Bias389, %tmp159
  %236 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 22
  %_rtP__Gain1_Gain391 = load double, double* %236, align 1
  %tmp161 = fmul double %tmp160, %_rtP__Gain1_Gain391
  %tmp162 = fadd double %tmp149, %tmp161
  %237 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_316, i64 0, i32 6, i64 2
  %_rtDW__lastSin_p_el393 = load double, double* %237, align 1
  %238 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 29, i64 2
  %_rtP__ThirdHarmonicInj1_PCos_el395 = load double, double* %238, align 1
  %tmp163 = fmul double %_rtDW__lastSin_p_el393, %_rtP__ThirdHarmonicInj1_PCos_el395
  %239 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_316, i64 0, i32 7, i64 2
  %_rtDW__lastCos_p_el397 = load double, double* %239, align 1
  %240 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 28, i64 2
  %_rtP__ThirdHarmonicInj1_PSin_el399 = load double, double* %240, align 1
  %tmp164 = fmul double %_rtDW__lastCos_p_el397, %_rtP__ThirdHarmonicInj1_PSin_el399
  %tmp165 = fadd double %tmp163, %tmp164
  %241 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_318, i64 0, i32 27, i64 2
  %_rtP__ThirdHarmonicInj1_HCos_el401 = load double, double* %241, align 1
  %tmp166 = fmul double %_rtP__ThirdHarmonicInj1_HCos_el401, %tmp165
  %_rtDW_402 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %242 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_402, i64 0, i32 7, i64 2
  %_rtDW__lastCos_p_el403 = load double, double* %242, align 1
  %_rtP_404 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %243 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_404, i64 0, i32 29, i64 2
  %_rtP__ThirdHarmonicInj1_PCos_el405 = load double, double* %243, align 1
  %tmp167 = fmul double %_rtDW__lastCos_p_el403, %_rtP__ThirdHarmonicInj1_PCos_el405
  %244 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_402, i64 0, i32 6, i64 2
  %_rtDW__lastSin_p_el407 = load double, double* %244, align 1
  %245 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_404, i64 0, i32 28, i64 2
  %_rtP__ThirdHarmonicInj1_PSin_el409 = load double, double* %245, align 1
  %tmp168 = fmul double %_rtDW__lastSin_p_el407, %_rtP__ThirdHarmonicInj1_PSin_el409
  %tmp169 = fsub double %tmp167, %tmp168
  %246 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_404, i64 0, i32 26, i64 2
  %_rtP__ThirdHarmonicInj1_Hsin_el411 = load double, double* %246, align 1
  %tmp170 = fmul double %_rtP__ThirdHarmonicInj1_Hsin_el411, %tmp169
  %tmp171 = fadd double %tmp166, %tmp170
  %247 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_404, i64 0, i32 23
  %_rtP__ThirdHarmonicInj1_Amp413 = load double, double* %247, align 1
  %tmp172 = fmul double %_rtP__ThirdHarmonicInj1_Amp413, %tmp171
  %248 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_404, i64 0, i32 24
  %_rtP__ThirdHarmonicInj1_Bias415 = load double, double* %248, align 1
  %tmp173 = fadd double %_rtP__ThirdHarmonicInj1_Bias415, %tmp172
  %249 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_404, i64 0, i32 30
  %_rtP__Gain4_Gain417 = load double, double* %249, align 1
  %tmp174 = fmul double %tmp173, %_rtP__Gain4_Gain417
  %tmp175 = fadd double %tmp162, %tmp174
  %250 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_404, i64 0, i32 31
  %_rtP__Gain3_Gain419 = load double, double* %250, align 1
  %tmp176 = fmul double %_rtP__Gain3_Gain419, %tmp175
  %_rtB_420 = load %B_GOZSE_T*, %B_GOZSE_T** %_rtB_, align 8
  %251 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_420, i64 0, i32 0, i64 2
  store double %tmp176, double* %251, align 1
  %vm_ssGetTaskTimeVar1_421 = load double, double* %vm_ssGetTaskTimeVar1_, align 8
  %_rtP_422 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %252 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_422, i64 0, i32 32
  %_rtP__Constant3_Value = load double, double* %252, align 1
  %tmp177 = fadd double %vm_ssGetTaskTimeVar1_421, %_rtP__Constant3_Value
  %253 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_422, i64 0, i32 33
  %_rtP__Constant1_Value = load double, double* %253, align 1
  %254 = call double @muDoubleScalarRem(double %tmp177, double %_rtP__Constant1_Value)
  %_rtP_424 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %255 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_424, i64 0, i32 34
  %_rtP__uib1_Gain = load double, double* %255, align 1
  %tmp178 = fmul double %254, %_rtP__uib1_Gain
  %256 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_424, i64 0, i32 36, i64 0
  %257 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_424, i64 0, i32 35, i64 0
  %_rtDW_427 = load %DW_GOZSE_T*, %DW_GOZSE_T** %_rtDW_, align 8
  %258 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %_rtDW_427, i64 0, i32 14
  %259 = call double @look1_pbinlxpw(double %tmp178, double* %256, double* %257, i32* %258, i32 2)
  store double %259, double* %rtb_uDLookupTable_, align 8
  %_rtP_429 = load %P_GOZSE_T*, %P_GOZSE_T** %_rtP_, align 8
  %260 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %_rtP_429, i64 0, i32 37
  %_rtP__Constant2_Value = load double, double* %260, align 1
  %tmp179 = fsub double %259, %_rtP__Constant2_Value
  store double %tmp179, double* %rtb_uDLookupTable_, align 8
  %261 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_420, i64 0, i32 0, i64 0
  %_rtB__Gain3_el = load double, double* %261, align 1
  %262 = fcmp oge double %_rtB__Gain3_el, %tmp179
  %263 = zext i1 %262 to i8
  %264 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_420, i64 0, i32 3, i64 0
  store i8 %263, i8* %264, align 1
  %265 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_420, i64 0, i32 0, i64 1
  %_rtB__Gain3_el434 = load double, double* %265, align 1
  %266 = fcmp oge double %_rtB__Gain3_el434, %tmp179
  %267 = zext i1 %266 to i8
  %268 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_420, i64 0, i32 3, i64 1
  store i8 %267, i8* %268, align 1
  %_rtB__Gain3_el438 = load double, double* %251, align 1
  %269 = fcmp oge double %_rtB__Gain3_el438, %tmp179
  %270 = zext i1 %269 to i8
  %271 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %_rtB_420, i64 0, i32 3, i64 2
  store i8 %270, i8* %271, align 1
  %S_441 = load i8*, i8** %S_, align 8
  call void @vm_ssCallAccelRunBlock(i8* %S_441, i32 1, i32 26, i32 104)
  %272 = call i8 @vm_getHasError(i8* %S_441)
  br label %false
}

declare double @vm_ssGetTaskTime(i8*, i32)

declare i8* @vm_ssGetU(i8*)

declare void @vm_srUpdateBC(i8*)

declare void @vm_ssCallAccelRunBlock(i8*, i32, i32, i32)

declare i8 @vm_getHasError(i8*)

declare double @muDoubleScalarSin(double)

declare double @muDoubleScalarCos(double)

declare double @muDoubleScalarRem(double, double)

define double @look1_pbinlxpw(double %u0, double* %bp0, double* %table, i32* %prevIndex, i32 %maxIndex) {
look1_pbinlxpw_entry:
  %u0_ = alloca double, align 8
  store double %u0, double* %u0_, align 8
  %bp0_ = alloca double*, align 8
  store double* %bp0, double** %bp0_, align 8
  %table_ = alloca double*, align 8
  store double* %table, double** %table_, align 8
  %prevIndex_ = alloca i32*, align 8
  store i32* %prevIndex, i32** %prevIndex_, align 8
  %maxIndex_ = alloca i32, align 4
  store i32 %maxIndex, i32* %maxIndex_, align 4
  %frac_ = alloca double, align 8
  %iRght_ = alloca i32, align 4
  %iLeft_ = alloca i32, align 4
  %bpIdx_ = alloca i32, align 4
  %found_ = alloca i32, align 4
  %y_ = alloca double, align 8
  %bp0__el = load double, double* %bp0, align 1
  %0 = fcmp ugt double %u0, %bp0__el
  br i1 %0, label %false, label %true

true:                                             ; preds = %look1_pbinlxpw_entry
  store i32 0, i32* %bpIdx_, align 4
  %tmp15 = fsub double %u0, %bp0__el
  %1 = getelementptr inbounds double, double* %bp0, i64 1
  %bp0__el61 = load double, double* %1, align 1
  %tmp16 = fsub double %bp0__el61, %bp0__el
  %tmp17 = fdiv double %tmp15, %tmp16
  br label %merge12

false:                                            ; preds = %look1_pbinlxpw_entry
  %2 = sext i32 %maxIndex to i64
  %3 = getelementptr inbounds double, double* %bp0, i64 %2
  %bp0__el18 = load double, double* %3, align 1
  %4 = fcmp olt double %u0, %bp0__el18
  br i1 %4, label %true1, label %false2

true1:                                            ; preds = %false
  %prevIndex__el = load i32, i32* %prevIndex, align 1
  store i32 %prevIndex__el, i32* %bpIdx_, align 4
  store i32 0, i32* %iLeft_, align 4
  store i32 %maxIndex, i32* %iRght_, align 4
  store i32 0, i32* %found_, align 4
  br label %merge

false2:                                           ; preds = %false
  %tmp0 = add i32 %maxIndex, -1
  store i32 %tmp0, i32* %bpIdx_, align 4
  %5 = sext i32 %tmp0 to i64
  %6 = getelementptr inbounds double, double* %bp0, i64 %5
  %bp0__el23 = load double, double* %6, align 1
  %tmp2 = fsub double %u0, %bp0__el23
  %tmp4 = fsub double %bp0__el18, %bp0__el23
  %tmp5 = fdiv double %tmp2, %tmp4
  br label %merge12

true3:                                            ; preds = %merge
  %7 = fcmp olt double %u0, %bp0__el46
  br i1 %7, label %true5, label %false6

false4:                                           ; preds = %merge
  %tmp6 = fsub double %u0, %bp0__el46
  %tmp7 = add i32 %bpIdx_54, 1
  %8 = sext i32 %tmp7 to i64
  %9 = getelementptr inbounds double, double* %bp0, i64 %8
  %bp0__el39 = load double, double* %9, align 1
  %tmp8 = fsub double %bp0__el39, %bp0__el46
  %tmp9 = fdiv double %tmp6, %tmp8
  br label %merge12

true5:                                            ; preds = %true3
  %tmp13 = add i32 %bpIdx_54, -1
  store i32 %tmp13, i32* %iRght_, align 4
  %tmp14 = add i32 %iLeft_56, %tmp13
  %10 = lshr i32 %tmp14, 1
  store i32 %10, i32* %bpIdx_, align 4
  br label %merge

false6:                                           ; preds = %true3
  %tmp10 = add i32 %bpIdx_54, 1
  %11 = sext i32 %tmp10 to i64
  %12 = getelementptr inbounds double, double* %bp0, i64 %11
  %bp0__el50 = load double, double* %12, align 1
  %13 = fcmp olt double %u0, %bp0__el50
  br i1 %13, label %true7, label %false8

true7:                                            ; preds = %false6
  store i32 1, i32* %found_, align 4
  br label %merge

false8:                                           ; preds = %false6
  store i32 %tmp10, i32* %iLeft_, align 4
  %tmp12 = add i32 %iRght_52, %tmp10
  %14 = lshr i32 %tmp12, 1
  store i32 %14, i32* %bpIdx_, align 4
  br label %merge

merge:                                            ; preds = %true5, %true7, %false8, %true1
  %iLeft_56 = phi i32 [ 0, %true1 ], [ %iLeft_56, %true5 ], [ %iLeft_56, %true7 ], [ %tmp10, %false8 ]
  %iRght_52 = phi i32 [ %maxIndex, %true1 ], [ %tmp13, %true5 ], [ %iRght_52, %true7 ], [ %iRght_52, %false8 ]
  %bpIdx_54 = phi i32 [ %prevIndex__el, %true1 ], [ %10, %true5 ], [ %bpIdx_54, %true7 ], [ %14, %false8 ]
  %found_32 = phi i32 [ 0, %true1 ], [ 0, %true5 ], [ 1, %true7 ], [ 0, %false8 ]
  %15 = icmp eq i32 %found_32, 0
  %16 = sext i32 %bpIdx_54 to i64
  %17 = getelementptr inbounds double, double* %bp0, i64 %16
  %bp0__el46 = load double, double* %17, align 1
  br i1 %15, label %true3, label %false4

merge12:                                          ; preds = %false2, %false4, %true
  %bpIdx_73 = phi i32 [ 0, %true ], [ %bpIdx_54, %false4 ], [ %tmp0, %false2 ]
  %storemerge76 = phi double [ %tmp17, %true ], [ %tmp9, %false4 ], [ %tmp5, %false2 ]
  store double %storemerge76, double* %frac_, align 8
  store i32 %bpIdx_73, i32* %prevIndex, align 1
  %tmp18 = add i32 %bpIdx_73, 1
  %18 = sext i32 %tmp18 to i64
  %19 = getelementptr inbounds double, double* %table, i64 %18
  %table__el = load double, double* %19, align 1
  %20 = sext i32 %bpIdx_73 to i64
  %21 = getelementptr inbounds double, double* %table, i64 %20
  %table__el70 = load double, double* %21, align 1
  %tmp19 = fsub double %table__el, %table__el70
  %tmp20 = fmul double %tmp19, %storemerge76
  %tmp21 = fadd double %tmp20, %table__el70
  store double %tmp21, double* %y_, align 8
  ret double %tmp21
}

define void @SystemInitialize(i8* %S) {
SystemInitialize_entry:
  %S_ = alloca i8*, align 8
  store i8* %S, i8** %S_, align 8
  %_rtB_ = alloca %B_GOZSE_T*, align 8
  %_rtP_ = alloca %P_GOZSE_T*, align 8
  %_rtDW_ = alloca %DW_GOZSE_T*, align 8
  %0 = call i8* @vm_ssGetRootDWork(i8* %S)
  %1 = bitcast %DW_GOZSE_T** %_rtDW_ to i8**
  store i8* %0, i8** %1, align 8
  %2 = call i8* @vm_ssGetModelRtp(i8* %S)
  %3 = bitcast %P_GOZSE_T** %_rtP_ to i8**
  store i8* %2, i8** %3, align 8
  %4 = call i8* @vm__ssGetModelBlockIO(i8* %S)
  %5 = bitcast %B_GOZSE_T** %_rtB_ to i8**
  store i8* %4, i8** %5, align 8
  %6 = getelementptr inbounds i8, i8* %2, i64 593
  %_rtP__UnitDelay_InitialCondition = load i8, i8* %6, align 1
  %7 = bitcast i8* %0 to %DW_GOZSE_T*
  %8 = getelementptr inbounds %DW_GOZSE_T, %DW_GOZSE_T* %7, i64 0, i32 15
  store i8 %_rtP__UnitDelay_InitialCondition, i8* %8, align 1
  %9 = bitcast i8* %2 to %P_GOZSE_T*
  %10 = getelementptr inbounds %P_GOZSE_T, %P_GOZSE_T* %9, i64 0, i32 38
  %_rtP__MulResult_Y0 = load i8, i8* %10, align 1
  %11 = bitcast i8* %4 to %B_GOZSE_T*
  %12 = getelementptr inbounds %B_GOZSE_T, %B_GOZSE_T* %11, i64 0, i32 4
  store i8 %_rtP__MulResult_Y0, i8* %12, align 1
  ret void
}

define i32 @binsearch_u32d_prevIdx(double %u, double* %bp, i32 %startIndex, i32 %maxIndex) {
binsearch_u32d_prevIdx_entry:
  %u_ = alloca double, align 8
  store double %u, double* %u_, align 8
  %bp_ = alloca double*, align 8
  store double* %bp, double** %bp_, align 8
  %startIndex_ = alloca i32, align 4
  store i32 %startIndex, i32* %startIndex_, align 4
  %maxIndex_ = alloca i32, align 4
  store i32 %maxIndex, i32* %maxIndex_, align 4
  %iRght_ = alloca i32, align 4
  %iLeft_ = alloca i32, align 4
  %found_ = alloca i32, align 4
  %bpIndex_ = alloca i32, align 4
  store i32 %startIndex, i32* %bpIndex_, align 4
  store i32 0, i32* %iLeft_, align 4
  store i32 %maxIndex, i32* %iRght_, align 4
  store i32 0, i32* %found_, align 4
  br label %merge

true:                                             ; preds = %merge
  %0 = sext i32 %bpIndex_20 to i64
  %1 = getelementptr inbounds double, double* %bp, i64 %0
  %bp__el = load double, double* %1, align 1
  %2 = fcmp olt double %u, %bp__el
  br i1 %2, label %true1, label %false2

false:                                            ; preds = %merge
  ret i32 %bpIndex_20

true1:                                            ; preds = %true
  %tmp3 = add i32 %bpIndex_20, -1
  store i32 %tmp3, i32* %iRght_, align 4
  %tmp4 = add i32 %iLeft_22, %tmp3
  %3 = lshr i32 %tmp4, 1
  store i32 %3, i32* %bpIndex_, align 4
  br label %merge

false2:                                           ; preds = %true
  %tmp0 = add i32 %bpIndex_20, 1
  %4 = sext i32 %tmp0 to i64
  %5 = getelementptr inbounds double, double* %bp, i64 %4
  %bp__el16 = load double, double* %5, align 1
  %6 = fcmp olt double %u, %bp__el16
  br i1 %6, label %true3, label %false4

true3:                                            ; preds = %false2
  store i32 1, i32* %found_, align 4
  br label %merge

false4:                                           ; preds = %false2
  store i32 %tmp0, i32* %iLeft_, align 4
  %tmp2 = add i32 %iRght_18, %tmp0
  %7 = lshr i32 %tmp2, 1
  store i32 %7, i32* %bpIndex_, align 4
  br label %merge

merge:                                            ; preds = %true1, %true3, %false4, %binsearch_u32d_prevIdx_entry
  %iLeft_22 = phi i32 [ 0, %binsearch_u32d_prevIdx_entry ], [ %iLeft_22, %true1 ], [ %iLeft_22, %true3 ], [ %tmp0, %false4 ]
  %iRght_18 = phi i32 [ %maxIndex, %binsearch_u32d_prevIdx_entry ], [ %tmp3, %true1 ], [ %iRght_18, %true3 ], [ %iRght_18, %false4 ]
  %bpIndex_20 = phi i32 [ %startIndex, %binsearch_u32d_prevIdx_entry ], [ %3, %true1 ], [ %bpIndex_20, %true3 ], [ %7, %false4 ]
  %found_9 = phi i32 [ 0, %binsearch_u32d_prevIdx_entry ], [ 0, %true1 ], [ 1, %true3 ], [ 0, %false4 ]
  %8 = icmp eq i32 %found_9, 0
  br i1 %8, label %true, label %false
}

define double @intrp1d_l_pw(i32 %bpIndex, double %frac, double* %table) {
intrp1d_l_pw_entry:
  %bpIndex_ = alloca i32, align 4
  store i32 %bpIndex, i32* %bpIndex_, align 4
  %frac_ = alloca double, align 8
  store double %frac, double* %frac_, align 8
  %table_ = alloca double*, align 8
  store double* %table, double** %table_, align 8
  %y_ = alloca double, align 8
  %tmp0 = add i32 %bpIndex, 1
  %0 = sext i32 %tmp0 to i64
  %1 = getelementptr inbounds double, double* %table, i64 %0
  %table__el = load double, double* %1, align 1
  %2 = sext i32 %bpIndex to i64
  %3 = getelementptr inbounds double, double* %table, i64 %2
  %table__el5 = load double, double* %3, align 1
  %tmp1 = fsub double %table__el, %table__el5
  %tmp2 = fmul double %tmp1, %frac
  %tmp3 = fadd double %tmp2, %table__el5
  store double %tmp3, double* %y_, align 8
  ret double %tmp3
}

define i32 @plook_binxp(double %u, double* %bp, i32 %maxIndex, double* %fraction, i32* %prevIndex) {
plook_binxp_entry:
  %u_ = alloca double, align 8
  store double %u, double* %u_, align 8
  %bp_ = alloca double*, align 8
  store double* %bp, double** %bp_, align 8
  %maxIndex_ = alloca i32, align 4
  store i32 %maxIndex, i32* %maxIndex_, align 4
  %fraction_ = alloca double*, align 8
  store double* %fraction, double** %fraction_, align 8
  %prevIndex_ = alloca i32*, align 8
  store i32* %prevIndex, i32** %prevIndex_, align 8
  %bpIndex_ = alloca i32, align 4
  %bp__el = load double, double* %bp, align 1
  %0 = fcmp ugt double %u, %bp__el
  br i1 %0, label %false, label %true

true:                                             ; preds = %plook_binxp_entry
  store i32 0, i32* %bpIndex_, align 4
  %tmp10 = fsub double %u, %bp__el
  %1 = getelementptr inbounds double, double* %bp, i64 1
  %bp__el42 = load double, double* %1, align 1
  %tmp11 = fsub double %bp__el42, %bp__el
  %tmp12 = fdiv double %tmp10, %tmp11
  store double %tmp12, double* %fraction, align 1
  br label %merge3

false:                                            ; preds = %plook_binxp_entry
  %2 = sext i32 %maxIndex to i64
  %3 = getelementptr inbounds double, double* %bp, i64 %2
  %bp__el9 = load double, double* %3, align 1
  %4 = fcmp olt double %u, %bp__el9
  br i1 %4, label %true1, label %false2

true1:                                            ; preds = %false
  %prevIndex_25 = load i32, i32* %prevIndex, align 1
  %5 = call i32 @binsearch_u32d_prevIdx(double %u, double* %bp, i32 %prevIndex_25, i32 %maxIndex)
  store i32 %5, i32* %bpIndex_, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds double, double* %bp, i64 %6
  %bp__el30 = load double, double* %7, align 1
  %tmp6 = fsub double %u, %bp__el30
  %tmp7 = add i32 %5, 1
  %8 = sext i32 %tmp7 to i64
  %9 = getelementptr inbounds double, double* %bp, i64 %8
  %bp__el33 = load double, double* %9, align 1
  %tmp8 = fsub double %bp__el33, %bp__el30
  %tmp9 = fdiv double %tmp6, %tmp8
  store double %tmp9, double* %fraction, align 1
  br label %merge3

false2:                                           ; preds = %false
  %tmp0 = add i32 %maxIndex, -1
  store i32 %tmp0, i32* %bpIndex_, align 4
  %10 = sext i32 %tmp0 to i64
  %11 = getelementptr inbounds double, double* %bp, i64 %10
  %bp__el14 = load double, double* %11, align 1
  %tmp2 = fsub double %u, %bp__el14
  %tmp4 = fsub double %bp__el9, %bp__el14
  %tmp5 = fdiv double %tmp2, %tmp4
  store double %tmp5, double* %fraction, align 1
  br label %merge3

merge3:                                           ; preds = %false2, %true1, %true
  %bpIndex_48 = phi i32 [ 0, %true ], [ %5, %true1 ], [ %tmp0, %false2 ]
  store i32 %bpIndex_48, i32* %prevIndex, align 1
  ret i32 %bpIndex_48
}

