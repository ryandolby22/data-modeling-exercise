-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Teams" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" INTEGER   NOT NULL,
    "first_name" TEXT   NOT NULL,
    "last_name" TEXT   NOT NULL,
    "teams_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Season" (
    "id" INTEGER   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Matches" (
    "id" INTEGER   NOT NULL,
    "location" TEXT   NOT NULL,
    "date" DATE   NOT NULL,
    "start_time" TEXT   NOT NULL,
    "head_referee_id" INTEGER   NOT NULL,
    "assistant_referree_id" INTEGER   NOT NULL,
    "season_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Lineups" (
    "id" INTEGER   NOT NULL,
    "player_id" INTEGER   NOT NULL,
    "match_id" INTEGER   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Lineups" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" INTEGER   NOT NULL,
    "player_id" INTEGER   NOT NULL,
    "match_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Results" (
    "id" INTEGER   NOT NULL,
    "results" TEXT   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    "match_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_teams_id" FOREIGN KEY("teams_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_head_referee_id" FOREIGN KEY("head_referee_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_assistant_referree_id" FOREIGN KEY("assistant_referree_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_season_id" FOREIGN KEY("season_id")
REFERENCES "Season" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Lineups" ("player_id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

CREATE INDEX "idx_Teams_name"
ON "Teams" ("name");

CREATE INDEX "idx_Players_last_name"
ON "Players" ("last_name");

CREATE INDEX "idx_Referees_name"
ON "Referees" ("name");

CREATE INDEX "idx_Results_results"
ON "Results" ("results");

