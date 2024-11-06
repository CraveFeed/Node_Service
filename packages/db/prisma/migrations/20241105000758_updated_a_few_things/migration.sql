/*
  Warnings:

  - The `pictures` column on the `Post` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `userId` on the `Tag` table. All the data in the column will be lost.
  - Added the required column `avatar` to the `Restaurant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `banner` to the `Restaurant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `banner` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Tag" DROP CONSTRAINT "Tag_userId_fkey";

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "pictures",
ADD COLUMN     "pictures" TEXT[],
ALTER COLUMN "city" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Restaurant" ADD COLUMN     "avatar" TEXT NOT NULL,
ADD COLUMN     "banner" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Tag" DROP COLUMN "userId";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "banner" TEXT NOT NULL,
ALTER COLUMN "Longitude" DROP NOT NULL;

-- CreateTable
CREATE TABLE "NotificationUpdate" (
    "id" TEXT NOT NULL,
    "dateTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "NotificationUpdate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "avatar" TEXT,
    "message" TEXT NOT NULL,
    "creatorId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "NotificationUpdate_userId_key" ON "NotificationUpdate"("userId");

-- AddForeignKey
ALTER TABLE "NotificationUpdate" ADD CONSTRAINT "NotificationUpdate_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
