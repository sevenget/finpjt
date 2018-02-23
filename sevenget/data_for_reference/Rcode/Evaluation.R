# 전문 패널 60% 점수 환산 총점 60점으로(일반인 평가가 없을 때는 이 60점에 10/6 곱해주기. 일반인 평가가 10개 이상이면...적용................)
# 
# 7가지 평가기준 각 10 10 10 10 10 5 5
# 
# ** 0/1(하면 0 안하면 1)
# 
# 연애 = 정시퇴근 가능일 수*1 + 금요일 조기퇴근(외 탄력근무제 등) 시행 여부*2.5 + 주말근무 여부(0/1)*2.5
# 결혼 = 신입연봉/3000(만원) + 유급휴가 사용 일 수(연 기준)/5 + 정시퇴근 가능일 수*1 + 주말근무 여부(0/1)*1
# 출산및육아 = 탄력근무제 시행 여부(0/1)*2.5 + 유급휴가 사용 일 수(연 기준)*2.5/15 + 사내 어린이집 등 시설 또는 돌보미 서비스 등의 유무(0/1)*2.5 + 교육비  지원 여부(0/1)*2.5 
# 내집마련 = 대출지원제도 유무(0/1)*4 + 기숙사/사택 제공 여부(0/1)*6
# 인간관계 = 사내 동호회 운영 여부(0/1)*1.5 +  사내 동호회 지원 여부(0/1)*1.5 + 실 동호회 가입 인원 비율/50 + 정시퇴근 가능일 수/5
# 꿈 = 자기계발 지원비 여부(0/1)*1 + 외부강사 초청 세미나 횟수(한달 기준)/5 + 수평적 구조(0/1)*1 + 다양한 업무 경험이 가능한지 여부(0/1)*1 + 재택근무 가능 여부(0/1)*1
# 희망 = 연봉인상률/10 + (1-퇴사율/50) + 기업성장률/100 + 산업성장률/50 + 정부지원 산업 여부(0/1)*1
noOTEPr <- 5
Flexible_Work_SchemeEPr <- 1
weekendWorkEPr <- 1
newcomerSalaryEPr <- 3000
Paid_vacationEPr <- 15
Company_kindergartenEPr <- 1
Educational_supportEPr <- 1
Loan_supportEPr <- 1
Dormitory_Companyhousing_SupportEPr <- 1
Operate_clubsEPr <- 1
Support_clubsEPr <- 1
club_membership_rateEPr <- 100
Self_development_supportEPr <- 1
Seminar_by_inviting_external_lecturersEPr <- 5
Horizontal_structureEPr <- 1
Possibility_of_various_work_experienceEPr <- 1
Telecommuting_availabilityEPr <- 1
Salary_increase_rateEPr <- 20
Retirement_rateEPr <- 0
Business_growth_rateEPr <- 100
Industry_growth_rateEPr <- 50
Government_supportEPr <- 1


dateEPr <- noOTEPr*1 + Flexible_Work_SchemeEPr*2.5 + weekendWorkEPr*2.5
marriageEPr <- newcomerSalaryEPr/3000 + Paid_vacationEPr/5 + noOTEPr*1 + weekendWorkEPr*1
babyEPr <- Flexible_Work_SchemeEPr*2.5 + Paid_vacationEPr*2.5/15 + Company_kindergartenEPr*2.5 + Educational_supportEPr*2.5 
houseEPr <- Loan_supportEPr*4 + Dormitory_Companyhousing_SupportEPr*6
relationshipEPr <- Operate_clubsEPr*1.5 +  Support_clubsEPr*1.5 + club_membership_rateEPr/50 + noOTEPr
dreamEPr <- Self_development_supportEPr*1 + Seminar_by_inviting_external_lecturersEPr/5 + Horizontal_structureEPr*1 + Possibility_of_various_work_experienceEPr*1 + Telecommuting_availabilityEPr*1
hopeEPr <- Salary_increase_rateEPr/20 + (1-Retirement_rateEPr/50) + Business_growth_rateEPr/100 + Industry_growth_rateEPr/50 + Government_supportEPr*1

EvaluationPrP <- dateEPr + marriageEPr + babyEPr + houseEPr + relationshipEPr + dreamEPr + hopeEPr


# =================================================================================================================
#   일반인 40% 점수 환산 총점 40점으로
# 
# 7가지 평가기준 각 7 7 7 7 7 3 3 
# 
# ** 각 평가기준의 요소점수는 0~1점입니다.
# 
# 연애 = 정시퇴근*46/79 + 주말근무X*15/79 + 눈치*6/79 + 재정적 지원*6/79 + 적절한 근무량*6/79
# 결혼 = 결혼 이후 관련 제도*18/62 + 충분한 급여*13/62 + 눈치*11/62 + 정시퇴근*11/62 + 재정적 지원*9/62
# 출산및육아 = 육아휴직*24/65 + 출산 및 육아휴직 후 복직 보장*13/65 + 휴가*11/65 + 눈치*9/65 + 재정적 지원*8/65
# 내집마련 = 충분한 급여*29/52 + 대출 지원*13/52 + 기숙사 및 사택 제공*6/52 + 돈 관리 코칭*4/52
# 인간관계 = 정시퇴근*29/58 + 회사 내 분위기 개선*11/58 + 주말근무X*8/58 + 탄력근무제도*5/58 +회식X*5/58
# 꿈 = 관련 보조금, 과정, 스터디 등의 지원*30/44 + 정시퇴근*14/44
# 희망 = 충분한 급여*20/36 + 사내 분위기 및 환경 개선*9/36 + 정시퇴근*7/36
EvaluationPuP

noOTPuP <- 10
Flexible_Work_SchemePuP <- 10
weekendWorkPuP <- 10
walking_on_eggshellsPuP <- 10
Financial_supportPuP <- 10
Dormitory_Companyhousing_SupportPuP <- 10
Loan_supportPuP <- 10
Self_development_supportPuP <- 10
appropriate_amount_of_work <- 10
sufficient_salary <- 10
Related_system_after_marriage <- 10
childcare_leave <- 10
Guaranteed_reinstatement <- 10
vacation <- 10
mood_environment_improvement <- 10
Dining_together <- 10
Money_management_coaching <- 10

datePuP <- (noOTPuP*(46/79) + weekendWorkPuP*15/79 + walking_on_eggshellsPuP*6/79 + Financial_supportPuP*6/79 + appropriate_amount_of_work*6/79)*6.8/10
marriagePuP <- (Related_system_after_marriage*18/62 + sufficient_salary*13/62 + walking_on_eggshellsPuP*11/62 + noOTPuP*11/62 + Financial_supportPuP*9/62)*6.8/10
babyPuP <- (childcare_leave*24/65 + Guaranteed_reinstatement*13/65 + vacation*11/65 + walking_on_eggshellsPuP*9/65 + Financial_supportPuP*8/65)*6.8/10
housePuP <- (sufficient_salary*29/52 + Loan_supportPuP*13/52 + Dormitory_Companyhousing_SupportPuP*6/52 + Money_management_coaching*4/52)*6.8/10
relationshipPuP <- (noOTPuP*29/58 + mood_environment_improvement*11/58 + weekendWorkPuP*8/58 + Flexible_Work_SchemePuP*5/58 +Dining_together*5/58)*6.8/10
dreamPuP <- (Self_development_supportPuP*30/44 + noOTPuP*14/44)*3/10
hopePuP <- (sufficient_salary*20/36 + mood_environment_improvement*9/36 + noOTPuP*7/36)*3/10

EvaluationPuP <- datePuP + marriagePuP + babyPuP + housePuP + relationshipPuP + dreamPuP + hopePuP
