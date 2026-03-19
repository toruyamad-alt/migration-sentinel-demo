ALTER TABLE "User" ADD COLUMN "timezone" TEXT DEFAULT 'UTC';

UPDATE "User" SET "timezone" = 'UTC' WHERE "timezone" IS NULL;

ALTER TABLE "User" ALTER COLUMN "timezone" SET NOT NULL;
