-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "restaurantId" TEXT;

-- CreateIndex
CREATE INDEX "User_username_Type_idx" ON "User"("username", "Type");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE SET NULL ON UPDATE CASCADE;
