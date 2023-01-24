-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Region" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" INTEGER   NOT NULL,
    "username" TEXT   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" INTEGER   NOT NULL,
    "title" TEXT   NOT NULL,
    "text" TEXT   NOT NULL,
    "location" TEXT   NOT NULL,
    "users.username" TEXT   NOT NULL,
    "region.name" TEXT   NOT NULL,
    "categories.category_name" TEXT   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Categories" (
    "id" INTEGER   NOT NULL,
    "category_name" TEXT   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_users.username" FOREIGN KEY("users.username")
REFERENCES "Users" ("username");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region.name" FOREIGN KEY("region.name")
REFERENCES "Region" ("name");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_categories.category_name" FOREIGN KEY("categories.category_name")
REFERENCES "Categories" ("category_name");

CREATE INDEX "idx_Region_name"
ON "Region" ("name");

CREATE INDEX "idx_Users_username"
ON "Users" ("username");

CREATE INDEX "idx_Posts_title"
ON "Posts" ("title");

