-- AlterEnum
ALTER TYPE "Quranic_Section" ADD VALUE 'NAZERA';

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
    "quran_club" TEXT,
    "language_club" TEXT,
    "science_club" TEXT,
    "scout_sports_club" TEXT,
    "created_by_id" TEXT,
    "updated_by_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "extra_curriculum_activities_pkey" PRIMARY KEY ("id")
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
CREATE TABLE "_ExtraCurriculumActivityToStudent" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ExtraCurriculumActivityToStudent_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_ExtraCurriculumActivityToStudent_B_index" ON "_ExtraCurriculumActivityToStudent"("B");

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
ALTER TABLE "language_club" ADD CONSTRAINT "language_club_extra_curriculum_activity_id_fkey" FOREIGN KEY ("extra_curriculum_activity_id") REFERENCES "extra_curriculum_activities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "language_club" ADD CONSTRAINT "language_club_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "language_club" ADD CONSTRAINT "language_club_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quran_club" ADD CONSTRAINT "quran_club_extra_curriculum_activity_id_fkey" FOREIGN KEY ("extra_curriculum_activity_id") REFERENCES "extra_curriculum_activities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quran_club" ADD CONSTRAINT "quran_club_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quran_club" ADD CONSTRAINT "quran_club_updated_by_id_fkey" FOREIGN KEY ("updated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

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
ALTER TABLE "_ExtraCurriculumActivityToStudent" ADD CONSTRAINT "_ExtraCurriculumActivityToStudent_A_fkey" FOREIGN KEY ("A") REFERENCES "extra_curriculum_activities"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExtraCurriculumActivityToStudent" ADD CONSTRAINT "_ExtraCurriculumActivityToStudent_B_fkey" FOREIGN KEY ("B") REFERENCES "students"("id") ON DELETE CASCADE ON UPDATE CASCADE;
