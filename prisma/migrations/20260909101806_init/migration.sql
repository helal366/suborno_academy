-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- CreateEnum
CREATE TYPE "BloodGroup" AS ENUM ('A_POSITIVE', 'A_NEGATIVE', 'B_POSITIVE', 'B_NEGATIVE', 'AB_POSITIVE', 'AB_NEGATIVE', 'O_POSITIVE', 'O_NEGATIVE');

-- CreateEnum
CREATE TYPE "Religion" AS ENUM ('ISLAM', 'HINDU', 'CHRISTIAN', 'BUDDO', 'OTHER');

-- CreateEnum
CREATE TYPE "Quranic_Section" AS ENUM ('NURANI', 'NAZERA', 'HIFZ');

-- CreateEnum
CREATE TYPE "WeekDays" AS ENUM ('SATURDAY', 'SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY');

-- CreateEnum
CREATE TYPE "Months" AS ENUM ('JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER');

-- CreateEnum
CREATE TYPE "ActiveStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "AuditAction" AS ENUM ('CREATE', 'UPDATE', 'DELETE');

-- CreateEnum
CREATE TYPE "EducationDegree" AS ENUM ('SSC', 'HSC', 'BSC', 'B_COM', 'B_ARTS', 'MSC', 'M_COM', 'M_ARTS', 'PHD', 'ALIM', 'DAKHIL', 'KAMIL', 'FAZIL', 'OTHERS');

-- CreateTable
CREATE TABLE "academic_teachers" (
    "id" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "current_position_id" TEXT NOT NULL,
    "current_role_id" TEXT NOT NULL,
    "teaching_working_experience_year" INTEGER,
    "teaching_working_experience_month" INTEGER,
    "alternative_contact_no" TEXT[],
    "user_id" TEXT NOT NULL,
    "is_subject_teacher" BOOLEAN NOT NULL DEFAULT false,
    "is_responsible_teacher" BOOLEAN NOT NULL DEFAULT false,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "academic_teachers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "academic_results" (
    "id" TEXT NOT NULL,
    "ssc_result" TEXT,
    "dakhil_result" TEXT,
    "hsc_result" TEXT,
    "alim_result" TEXT,
    "hons_result" TEXT,
    "fazil_result" TEXT,
    "masters_result" TEXT,
    "kamil" TEXT,
    "teacher_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "academic_results_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "academic_years" (
    "id" TEXT NOT NULL,
    "academic_year_number" INTEGER NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "academic_years_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "audit_log" (
    "audit_id" TEXT NOT NULL,
    "entity_name" TEXT NOT NULL,
    "entity_id" TEXT NOT NULL,
    "action" "AuditAction" NOT NULL,
    "changed_by_id" TEXT NOT NULL,
    "old_value" JSONB,
    "new_value" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "audit_log_pkey" PRIMARY KEY ("audit_id")
);

-- CreateTable
CREATE TABLE "books" (
    "id" TEXT NOT NULL,
    "book_name" TEXT NOT NULL,
    "publication" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "books_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "books_classes" (
    "id" TEXT NOT NULL,
    "class_id" TEXT NOT NULL,
    "book_id" TEXT NOT NULL,
    "academic_year_id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "books_classes_pkey" PRIMARY KEY ("book_id","class_id","academic_year_id")
);

-- CreateTable
CREATE TABLE "classes" (
    "id" TEXT NOT NULL,
    "class_name" TEXT NOT NULL,
    "grade_teacher_id" TEXT,
    "group_teacher_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "classes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "class_routine" (
    "id" TEXT NOT NULL,
    "day" "WeekDays" NOT NULL,
    "shift_id" TEXT NOT NULL,
    "period_id" TEXT NOT NULL,
    "teacher_id" TEXT NOT NULL,
    "class_id" TEXT NOT NULL,
    "academic_year_id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "class_routine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cultural_club" (
    "id" TEXT NOT NULL,
    "cultural_name" TEXT NOT NULL,
    "extra_curriculum_activity_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "cultural_club_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "extra_curriculum_activities" (
    "id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "extra_curriculum_activities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher_interview_information" (
    "id" TEXT NOT NULL,
    "writen_marks" DOUBLE PRECISION,
    "viva_voice_mark" DOUBLE PRECISION,
    "practical_mark" DOUBLE PRECISION,
    "total_mark" DOUBLE PRECISION,
    "joining_history_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "teacher_interview_information_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher_joining_history" (
    "id" TEXT NOT NULL,
    "applied_position" TEXT,
    "joining_date" TIMESTAMP(3),
    "resign_data" TIMESTAMP(3),
    "teacher_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "teacher_joining_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "language_club" (
    "id" TEXT NOT NULL,
    "language_name" TEXT NOT NULL,
    "extra_curriculum_activity_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "language_club_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "periods" (
    "id" TEXT NOT NULL,
    "period_name" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "periods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permanent_addresses" (
    "id" TEXT NOT NULL,
    "house_no" TEXT,
    "house_name" TEXT,
    "plot_no" TEXT,
    "road_no" TEXT,
    "neighbourhood" TEXT,
    "region" TEXT,
    "village" TEXT,
    "post_code" INTEGER,
    "post_office" TEXT,
    "thana" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "country" TEXT NOT NULL DEFAULT 'Bangladesh',
    "user_id" TEXT,
    "spouse_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "permanent_addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "present_addresses" (
    "id" TEXT NOT NULL,
    "house_no" TEXT,
    "house_name" TEXT,
    "plot_no" TEXT,
    "road_no" TEXT,
    "neighbourhood" TEXT,
    "region" TEXT,
    "village" TEXT,
    "post_code" INTEGER,
    "post_office" TEXT,
    "thana" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "country" TEXT NOT NULL DEFAULT 'Bangladesh',
    "user_id" TEXT,
    "spouse_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "present_addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher_previous_institute_information" (
    "id" TEXT NOT NULL,
    "institute_name" TEXT,
    "institute_contact" TEXT,
    "job_duration_year" INTEGER,
    "job_duration_month" INTEGER,
    "salary" INTEGER,
    "designation" TEXT,
    "joining_history_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "teacher_previous_institute_information_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher_promoted_history" (
    "id" TEXT NOT NULL,
    "previous_position" TEXT NOT NULL,
    "promoted_position" TEXT NOT NULL,
    "previous_position_joining_date" TIMESTAMP(3) NOT NULL,
    "previous_position_ending_date" TIMESTAMP(3) NOT NULL,
    "promoted_position_joining_date" TIMESTAMP(3) NOT NULL,
    "academic_administrative_staff_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "teacher_promoted_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quran_club" (
    "id" TEXT NOT NULL,
    "quran_name" TEXT NOT NULL,
    "extra_curriculum_activity_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "quran_club_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quranic_special_periods" (
    "id" TEXT NOT NULL,
    "period_name" TEXT NOT NULL,
    "start_time" TEXT NOT NULL,
    "end_time" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "quranic_special_periods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quranic_subjects" (
    "id" TEXT NOT NULL,
    "subject_name" TEXT NOT NULL,
    "quranic_section" "Quranic_Section" NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "quranic_subjects_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher_references" (
    "id" TEXT NOT NULL,
    "ref1_name" TEXT,
    "ref1_mobile_number" TEXT,
    "ref1_occupation" TEXT,
    "ref1_job_title" TEXT,
    "ref2_name" TEXT,
    "ref2_mobile_number" TEXT,
    "ref2_occupation" TEXT,
    "ref2_job_title" TEXT,
    "joining_history_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "teacher_references_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "science_club" (
    "id" TEXT NOT NULL,
    "science_name" TEXT NOT NULL,
    "extra_curriculum_activity_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "science_club_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "scout_sports_club" (
    "id" TEXT NOT NULL,
    "scout_sports_name" TEXT NOT NULL,
    "extra_curriculum_activity_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "scout_sports_club_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shifts" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "shifts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spouse_infromation" (
    "spouse_id" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "contact_no" TEXT,
    "father_name" TEXT,
    "father_contact_no" TEXT,
    "mother_name" TEXT,
    "mother_contact_no" TEXT,
    "occupation" TEXT,
    "job_title" TEXT,
    "monthly_income" INTEGER,
    "teacher_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "spouse_infromation_pkey" PRIMARY KEY ("spouse_id")
);

-- CreateTable
CREATE TABLE "students" (
    "id" TEXT NOT NULL,
    "quranic_section" "Quranic_Section",
    "quranic_subject_id" TEXT,
    "active_class_id" TEXT NOT NULL,
    "responsible_guardian_id" TEXT,
    "user_id" TEXT NOT NULL,
    "isActiveResponsibleTeacher" BOOLEAN NOT NULL DEFAULT false,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "students_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "student_institute_addresses" (
    "id" TEXT NOT NULL,
    "house_no" TEXT,
    "house_name" TEXT,
    "plot_no" TEXT,
    "road_no" TEXT,
    "neighbourhood" TEXT,
    "region" TEXT,
    "village" TEXT,
    "post_code" INTEGER,
    "post_office" TEXT,
    "thana" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "country" TEXT NOT NULL DEFAULT 'Bangladesh',
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "student_institute_addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "student_previous_institute_information" (
    "id" TEXT NOT NULL,
    "institute_name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "result" TEXT,
    "tc_no" TEXT,
    "institute_address_id" TEXT,
    "student_id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "student_previous_institute_information_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students_responsibility" (
    "id" TEXT NOT NULL,
    "responsibility_start" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "responsibility_end" TIMESTAMP(3),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "academic_year_id" TEXT NOT NULL,
    "teacher_id" TEXT,
    "student_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "students_responsibility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "student_responsible_guardians" (
    "id" TEXT NOT NULL,
    "guardian" TEXT NOT NULL,
    "nid_no" TEXT,
    "occupation" TEXT,
    "job_title" TEXT,
    "educational_qualification" "EducationDegree",
    "monthly_income" TEXT,
    "mobile_no_1" TEXT,
    "mobile_no_2" TEXT,
    "mobile_no_3" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "student_responsible_guardians_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subject_teachers" (
    "id" TEXT NOT NULL,
    "subject_name" TEXT NOT NULL,
    "teacher_id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "subject_teachers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher_honourableresponsibilities" (
    "id" TEXT NOT NULL,
    "responsibility_name" TEXT NOT NULL,
    "teacher_id" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "teacher_honourableresponsibilities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "mobile_number" TEXT NOT NULL,
    "is_mobile_verified" BOOLEAN NOT NULL DEFAULT false,
    "gender" "Gender" NOT NULL,
    "blood_group" "BloodGroup",
    "date_of_birth" TIMESTAMP(3),
    "height_in_cm" DOUBLE PRECISION,
    "weight_in_kg" DOUBLE PRECISION,
    "religion" "Religion",
    "nationality" TEXT NOT NULL DEFAULT 'Bangladeshi',
    "birth_certificate_number" TEXT,
    "nid_number" TEXT,
    "photo_url" TEXT,
    "father_details_id" TEXT,
    "mother_details_id" TEXT,
    "email" TEXT,
    "user_name" TEXT,
    "user_password" TEXT DEFAULT 'sm1234ps',
    "active_status" "ActiveStatus" NOT NULL DEFAULT 'ACTIVE',
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "position_id" TEXT,
    "role_name" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "active_inactive_histories" (
    "id" TEXT NOT NULL,
    "active_status" "ActiveStatus" NOT NULL,
    "activation_time" TIMESTAMP(3),
    "inactivation_time" TIMESTAMP(3),
    "user_id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "active_inactive_histories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_father_details" (
    "id" TEXT NOT NULL,
    "father_name" TEXT NOT NULL,
    "nid_no" TEXT,
    "occupation" TEXT,
    "job_title" TEXT,
    "educational_qualification" "EducationDegree",
    "monthly_income" TEXT,
    "mobile_no_1" TEXT,
    "mobile_no_2" TEXT,
    "mobile_no_3" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "user_father_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_mother_details" (
    "id" TEXT NOT NULL,
    "mother_name" TEXT NOT NULL,
    "nid_no" TEXT,
    "occupation" TEXT,
    "job_title" TEXT,
    "educational_qualification" "EducationDegree",
    "monthly_income" TEXT,
    "mobile_no_1" TEXT,
    "mobile_no_2" TEXT,
    "mobile_no_3" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "user_mother_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_positions" (
    "id" TEXT NOT NULL,
    "position_name" TEXT NOT NULL,
    "role_id" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "user_positions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_roles" (
    "id" TEXT NOT NULL,
    "role_name" TEXT NOT NULL,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "user_roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_academic_teacher_positions" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_academic_teacher_positions_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_academic_teacher_roles" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_academic_teacher_roles_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_student_classes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_student_classes_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_CulturalClubToStudent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_CulturalClubToStudent_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_LanguageClubToStudent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_LanguageClubToStudent_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_QuranClubToStudent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_QuranClubToStudent_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_QuranicSpecialPeriodToStudent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_QuranicSpecialPeriodToStudent_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ScienceClubToStudent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ScienceClubToStudent_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ScoutSportsClubToStudent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ScoutSportsClubToStudent_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "academic_teachers_user_id_key" ON "academic_teachers"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "academic_results_teacher_id_key" ON "academic_results"("teacher_id");

-- CreateIndex
CREATE INDEX "books_book_name_idx" ON "books"("book_name");

-- CreateIndex
CREATE UNIQUE INDEX "books_book_name_publication_key" ON "books"("book_name", "publication");

-- CreateIndex
CREATE UNIQUE INDEX "books_classes_id_key" ON "books_classes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "classes_class_name_key" ON "classes"("class_name");

-- CreateIndex
CREATE UNIQUE INDEX "classes_grade_teacher_id_key" ON "classes"("grade_teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "classes_group_teacher_id_key" ON "classes"("group_teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "class_routine_day_period_id_teacher_id_key" ON "class_routine"("day", "period_id", "teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "class_routine_day_period_id_class_id_key" ON "class_routine"("day", "period_id", "class_id");

-- CreateIndex
CREATE UNIQUE INDEX "teacher_interview_information_joining_history_id_key" ON "teacher_interview_information"("joining_history_id");

-- CreateIndex
CREATE UNIQUE INDEX "permanent_addresses_user_id_key" ON "permanent_addresses"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "permanent_addresses_spouse_id_key" ON "permanent_addresses"("spouse_id");

-- CreateIndex
CREATE UNIQUE INDEX "present_addresses_user_id_key" ON "present_addresses"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "present_addresses_spouse_id_key" ON "present_addresses"("spouse_id");

-- CreateIndex
CREATE UNIQUE INDEX "teacher_previous_institute_information_joining_history_id_key" ON "teacher_previous_institute_information"("joining_history_id");

-- CreateIndex
CREATE UNIQUE INDEX "teacher_promoted_history_academic_administrative_staff_id_key" ON "teacher_promoted_history"("academic_administrative_staff_id");

-- CreateIndex
CREATE UNIQUE INDEX "quranic_special_periods_period_name_key" ON "quranic_special_periods"("period_name");

-- CreateIndex
CREATE UNIQUE INDEX "quranic_subjects_subject_name_key" ON "quranic_subjects"("subject_name");

-- CreateIndex
CREATE UNIQUE INDEX "teacher_references_joining_history_id_key" ON "teacher_references"("joining_history_id");

-- CreateIndex
CREATE UNIQUE INDEX "shifts_name_key" ON "shifts"("name");

-- CreateIndex
CREATE UNIQUE INDEX "spouse_infromation_teacher_id_key" ON "spouse_infromation"("teacher_id");

-- CreateIndex
CREATE UNIQUE INDEX "students_user_id_key" ON "students"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "student_previous_institute_information_institute_address_id_key" ON "student_previous_institute_information"("institute_address_id");

-- CreateIndex
CREATE UNIQUE INDEX "teacher_honourableresponsibilities_responsibility_name_key" ON "teacher_honourableresponsibilities"("responsibility_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_user_name_key" ON "users"("user_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_full_name_mobile_number_key" ON "users"("full_name", "mobile_number");

-- CreateIndex
CREATE UNIQUE INDEX "user_positions_position_name_key" ON "user_positions"("position_name");

-- CreateIndex
CREATE UNIQUE INDEX "user_roles_role_name_key" ON "user_roles"("role_name");

-- CreateIndex
CREATE INDEX "_academic_teacher_positions_B_index" ON "_academic_teacher_positions"("B");

-- CreateIndex
CREATE INDEX "_academic_teacher_roles_B_index" ON "_academic_teacher_roles"("B");

-- CreateIndex
CREATE INDEX "_student_classes_B_index" ON "_student_classes"("B");

-- CreateIndex
CREATE INDEX "_CulturalClubToStudent_B_index" ON "_CulturalClubToStudent"("B");

-- CreateIndex
CREATE INDEX "_LanguageClubToStudent_B_index" ON "_LanguageClubToStudent"("B");

-- CreateIndex
CREATE INDEX "_QuranClubToStudent_B_index" ON "_QuranClubToStudent"("B");

-- CreateIndex
CREATE INDEX "_QuranicSpecialPeriodToStudent_B_index" ON "_QuranicSpecialPeriodToStudent"("B");

-- CreateIndex
CREATE INDEX "_ScienceClubToStudent_B_index" ON "_ScienceClubToStudent"("B");

-- CreateIndex
CREATE INDEX "_ScoutSportsClubToStudent_B_index" ON "_ScoutSportsClubToStudent"("B");

-- AddForeignKey
ALTER TABLE "academic_teachers" ADD CONSTRAINT "academic_teachers_current_position_id_fkey" FOREIGN KEY ("current_position_id") REFERENCES "user_positions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_teachers" ADD CONSTRAINT "academic_teachers_current_role_id_fkey" FOREIGN KEY ("current_role_id") REFERENCES "user_roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_teachers" ADD CONSTRAINT "academic_teachers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_teachers" ADD CONSTRAINT "academic_teachers_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_teachers" ADD CONSTRAINT "academic_teachers_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_results" ADD CONSTRAINT "academic_results_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_results" ADD CONSTRAINT "academic_results_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_results" ADD CONSTRAINT "academic_results_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_years" ADD CONSTRAINT "academic_years_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "academic_years" ADD CONSTRAINT "academic_years_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "audit_log" ADD CONSTRAINT "audit_log_changed_by_id_fkey" FOREIGN KEY ("changed_by_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "books" ADD CONSTRAINT "books_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "books" ADD CONSTRAINT "books_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "books_classes" ADD CONSTRAINT "books_classes_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "books_classes" ADD CONSTRAINT "books_classes_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "books_classes" ADD CONSTRAINT "books_classes_academic_year_id_fkey" FOREIGN KEY ("academic_year_id") REFERENCES "academic_years"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "books_classes" ADD CONSTRAINT "books_classes_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_grade_teacher_id_fkey" FOREIGN KEY ("grade_teacher_id") REFERENCES "academic_teachers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_group_teacher_id_fkey" FOREIGN KEY ("group_teacher_id") REFERENCES "academic_teachers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classes" ADD CONSTRAINT "classes_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_shift_id_fkey" FOREIGN KEY ("shift_id") REFERENCES "shifts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_period_id_fkey" FOREIGN KEY ("period_id") REFERENCES "periods"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "classes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_academic_year_id_fkey" FOREIGN KEY ("academic_year_id") REFERENCES "academic_years"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "class_routine" ADD CONSTRAINT "class_routine_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cultural_club" ADD CONSTRAINT "cultural_club_extra_curriculum_activity_id_fkey" FOREIGN KEY ("extra_curriculum_activity_id") REFERENCES "extra_curriculum_activities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cultural_club" ADD CONSTRAINT "cultural_club_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cultural_club" ADD CONSTRAINT "cultural_club_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "extra_curriculum_activities" ADD CONSTRAINT "extra_curriculum_activities_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "extra_curriculum_activities" ADD CONSTRAINT "extra_curriculum_activities_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_interview_information" ADD CONSTRAINT "teacher_interview_information_joining_history_id_fkey" FOREIGN KEY ("joining_history_id") REFERENCES "teacher_joining_history"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_interview_information" ADD CONSTRAINT "teacher_interview_information_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_interview_information" ADD CONSTRAINT "teacher_interview_information_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_joining_history" ADD CONSTRAINT "teacher_joining_history_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_joining_history" ADD CONSTRAINT "teacher_joining_history_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_joining_history" ADD CONSTRAINT "teacher_joining_history_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "language_club" ADD CONSTRAINT "language_club_extra_curriculum_activity_id_fkey" FOREIGN KEY ("extra_curriculum_activity_id") REFERENCES "extra_curriculum_activities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "language_club" ADD CONSTRAINT "language_club_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "language_club" ADD CONSTRAINT "language_club_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "periods" ADD CONSTRAINT "periods_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "periods" ADD CONSTRAINT "periods_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permanent_addresses" ADD CONSTRAINT "permanent_addresses_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permanent_addresses" ADD CONSTRAINT "permanent_addresses_spouse_id_fkey" FOREIGN KEY ("spouse_id") REFERENCES "spouse_infromation"("spouse_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permanent_addresses" ADD CONSTRAINT "permanent_addresses_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "permanent_addresses" ADD CONSTRAINT "permanent_addresses_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "present_addresses" ADD CONSTRAINT "present_addresses_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "present_addresses" ADD CONSTRAINT "present_addresses_spouse_id_fkey" FOREIGN KEY ("spouse_id") REFERENCES "spouse_infromation"("spouse_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "present_addresses" ADD CONSTRAINT "present_addresses_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "present_addresses" ADD CONSTRAINT "present_addresses_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_previous_institute_information" ADD CONSTRAINT "teacher_previous_institute_information_joining_history_id_fkey" FOREIGN KEY ("joining_history_id") REFERENCES "teacher_joining_history"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_previous_institute_information" ADD CONSTRAINT "teacher_previous_institute_information_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_previous_institute_information" ADD CONSTRAINT "teacher_previous_institute_information_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_promoted_history" ADD CONSTRAINT "teacher_promoted_history_academic_administrative_staff_id_fkey" FOREIGN KEY ("academic_administrative_staff_id") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_promoted_history" ADD CONSTRAINT "teacher_promoted_history_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_promoted_history" ADD CONSTRAINT "teacher_promoted_history_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quran_club" ADD CONSTRAINT "quran_club_extra_curriculum_activity_id_fkey" FOREIGN KEY ("extra_curriculum_activity_id") REFERENCES "extra_curriculum_activities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quran_club" ADD CONSTRAINT "quran_club_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quran_club" ADD CONSTRAINT "quran_club_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quranic_special_periods" ADD CONSTRAINT "quranic_special_periods_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quranic_special_periods" ADD CONSTRAINT "quranic_special_periods_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quranic_subjects" ADD CONSTRAINT "quranic_subjects_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quranic_subjects" ADD CONSTRAINT "quranic_subjects_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_references" ADD CONSTRAINT "teacher_references_joining_history_id_fkey" FOREIGN KEY ("joining_history_id") REFERENCES "teacher_joining_history"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_references" ADD CONSTRAINT "teacher_references_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_references" ADD CONSTRAINT "teacher_references_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "science_club" ADD CONSTRAINT "science_club_extra_curriculum_activity_id_fkey" FOREIGN KEY ("extra_curriculum_activity_id") REFERENCES "extra_curriculum_activities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "science_club" ADD CONSTRAINT "science_club_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "science_club" ADD CONSTRAINT "science_club_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scout_sports_club" ADD CONSTRAINT "scout_sports_club_extra_curriculum_activity_id_fkey" FOREIGN KEY ("extra_curriculum_activity_id") REFERENCES "extra_curriculum_activities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scout_sports_club" ADD CONSTRAINT "scout_sports_club_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scout_sports_club" ADD CONSTRAINT "scout_sports_club_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shifts" ADD CONSTRAINT "shifts_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shifts" ADD CONSTRAINT "shifts_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spouse_infromation" ADD CONSTRAINT "spouse_infromation_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spouse_infromation" ADD CONSTRAINT "spouse_infromation_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spouse_infromation" ADD CONSTRAINT "spouse_infromation_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_quranic_subject_id_fkey" FOREIGN KEY ("quranic_subject_id") REFERENCES "quranic_subjects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_active_class_id_fkey" FOREIGN KEY ("active_class_id") REFERENCES "classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_responsible_guardian_id_fkey" FOREIGN KEY ("responsible_guardian_id") REFERENCES "student_responsible_guardians"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students" ADD CONSTRAINT "students_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_institute_addresses" ADD CONSTRAINT "student_institute_addresses_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_institute_addresses" ADD CONSTRAINT "student_institute_addresses_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_previous_institute_information" ADD CONSTRAINT "student_previous_institute_information_institute_address_i_fkey" FOREIGN KEY ("institute_address_id") REFERENCES "student_institute_addresses"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_previous_institute_information" ADD CONSTRAINT "student_previous_institute_information_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_previous_institute_information" ADD CONSTRAINT "student_previous_institute_information_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_previous_institute_information" ADD CONSTRAINT "student_previous_institute_information_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students_responsibility" ADD CONSTRAINT "students_responsibility_academic_year_id_fkey" FOREIGN KEY ("academic_year_id") REFERENCES "academic_years"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students_responsibility" ADD CONSTRAINT "students_responsibility_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students_responsibility" ADD CONSTRAINT "students_responsibility_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students_responsibility" ADD CONSTRAINT "students_responsibility_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "students_responsibility" ADD CONSTRAINT "students_responsibility_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_responsible_guardians" ADD CONSTRAINT "student_responsible_guardians_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student_responsible_guardians" ADD CONSTRAINT "student_responsible_guardians_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_honourableresponsibilities" ADD CONSTRAINT "teacher_honourableresponsibilities_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "academic_teachers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_honourableresponsibilities" ADD CONSTRAINT "teacher_honourableresponsibilities_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teacher_honourableresponsibilities" ADD CONSTRAINT "teacher_honourableresponsibilities_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_father_details_id_fkey" FOREIGN KEY ("father_details_id") REFERENCES "user_father_details"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_mother_details_id_fkey" FOREIGN KEY ("mother_details_id") REFERENCES "user_mother_details"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_position_id_fkey" FOREIGN KEY ("position_id") REFERENCES "user_positions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_role_name_fkey" FOREIGN KEY ("role_name") REFERENCES "user_roles"("role_name") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "active_inactive_histories" ADD CONSTRAINT "active_inactive_histories_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "active_inactive_histories" ADD CONSTRAINT "active_inactive_histories_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "active_inactive_histories" ADD CONSTRAINT "active_inactive_histories_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_father_details" ADD CONSTRAINT "user_father_details_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_father_details" ADD CONSTRAINT "user_father_details_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_mother_details" ADD CONSTRAINT "user_mother_details_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_mother_details" ADD CONSTRAINT "user_mother_details_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_positions" ADD CONSTRAINT "user_positions_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "user_roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_positions" ADD CONSTRAINT "user_positions_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_positions" ADD CONSTRAINT "user_positions_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_roles" ADD CONSTRAINT "user_roles_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_roles" ADD CONSTRAINT "user_roles_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_academic_teacher_positions" ADD CONSTRAINT "_academic_teacher_positions_A_fkey" FOREIGN KEY ("A") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_academic_teacher_positions" ADD CONSTRAINT "_academic_teacher_positions_B_fkey" FOREIGN KEY ("B") REFERENCES "user_positions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_academic_teacher_roles" ADD CONSTRAINT "_academic_teacher_roles_A_fkey" FOREIGN KEY ("A") REFERENCES "academic_teachers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_academic_teacher_roles" ADD CONSTRAINT "_academic_teacher_roles_B_fkey" FOREIGN KEY ("B") REFERENCES "user_roles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_student_classes" ADD CONSTRAINT "_student_classes_A_fkey" FOREIGN KEY ("A") REFERENCES "classes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_student_classes" ADD CONSTRAINT "_student_classes_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CulturalClubToStudent" ADD CONSTRAINT "_CulturalClubToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "cultural_club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CulturalClubToStudent" ADD CONSTRAINT "_CulturalClubToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LanguageClubToStudent" ADD CONSTRAINT "_LanguageClubToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "language_club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LanguageClubToStudent" ADD CONSTRAINT "_LanguageClubToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_QuranClubToStudent" ADD CONSTRAINT "_QuranClubToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "quran_club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_QuranClubToStudent" ADD CONSTRAINT "_QuranClubToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_QuranicSpecialPeriodToStudent" ADD CONSTRAINT "_QuranicSpecialPeriodToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "quranic_special_periods"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_QuranicSpecialPeriodToStudent" ADD CONSTRAINT "_QuranicSpecialPeriodToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScienceClubToStudent" ADD CONSTRAINT "_ScienceClubToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "science_club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScienceClubToStudent" ADD CONSTRAINT "_ScienceClubToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScoutSportsClubToStudent" ADD CONSTRAINT "_ScoutSportsClubToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "scout_sports_club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScoutSportsClubToStudent" ADD CONSTRAINT "_ScoutSportsClubToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddUniqueConstraintForSingleResponsibleTeacher
CREATE UNIQUE INDEX student_single_active_responsibility_idx 
ON "students_responsibility" ("student_id") 
WHERE "isActive" = true;