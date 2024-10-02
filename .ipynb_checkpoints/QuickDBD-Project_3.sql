-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/G6vBl0
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Natural_Disaster" (
    "DisNo." varchar(100)UNIQUE   NOT NULL,
    "Disaster_Type_id" varchar(100)   NOT NULL,
    "Disaster_Subtype_id" varchar(100)   NOT NULL,
    "Event_Name" varchar(100)   NOT NULL,
    "Region" varchar(100)   NOT NULL,
    "Subregion" varchar(100)   NOT NULL,
    "Country" varchar(100)   NOT NULL,
    "ISO" varchar(100)   NOT NULL,
    "Magnitude" varchar(100)   NOT NULL,
    "Magnitude_Scale" varchar(100)   NOT NULL,
    "Latitude" varchar(100)   NOT NULL,
    "Longitude" varchar(100)   NOT NULL,
    "Start_Year" varchar(100)   NOT NULL,
    "Start_Month" varchar(100)   NOT NULL,
    "Start_Day" varchar(100)   NOT NULL,
    "End_Year" varchar(100)   NOT NULL,
    "End_Month" varchar(100)   NOT NULL,
    "End_Day" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Natural_Disaster" PRIMARY KEY (
        "DisNo."
     )
);

CREATE TABLE "Category" (
    "Disaster_Type_id" varchar(100)   NOT NULL,
    "Disaster_Type" varchar(100)   NOT NULL
);

CREATE TABLE "Damage" (
    "DisNo." varchar(100)   NOT NULL,
    "OFDA/BHA_Response" varchar(100)   NOT NULL,
    "Appeal" varchar(100)   NOT NULL,
    "Declaration" varchar(100)   NOT NULL,
    "AID_Contribution_('000_US$)" varchar(100)   NOT NULL,
    "Reconstruction_Costs_('000_US$)" varchar(100)   NOT NULL,
    "Reconstruction_Costs_Adjusted_('000_US$)" varchar(100)   NOT NULL,
    "Insured_Damage_('000_US$)" varchar(100)   NOT NULL,
    "Insured_Damage,_Adjusted_('000_US$)" varchar(100)   NOT NULL,
    "Total_Damage_('000_US$)" varchar(100)   NOT NULL,
    "Total_Damage_Adjusted_('000_US$)" varchar(100)   NOT NULL,
    "CPI" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Damage" PRIMARY KEY (
        "DisNo."
     )
);

CREATE TABLE "Lives_Affected" (
    "DisNo." varchar(100)   NOT NULL,
    "Total_Deaths" varchar(100)   NOT NULL,
    "No._Injured" varchar(100)   NOT NULL,
    "No._Affected" varchar(100)   NOT NULL,
    "No._Homeless" varchar(100)   NOT NULL,
    "Total_Affected" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Lives_Affected" PRIMARY KEY (
        "DisNo."
     )
);

CREATE TABLE "Subcategory" (
    "Disaster_subtype_id" varchar(100)   NOT NULL,
    "Disaster_subtype" varchar(100)   NOT NULL
);

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_Disaster_Type_id" FOREIGN KEY("Disaster_Type_id")
REFERENCES "Natural_Disaster" ("Disaster_Type_id");

ALTER TABLE "Damage" ADD CONSTRAINT "fk_Damage_DisNo." FOREIGN KEY("DisNo.")
REFERENCES "Natural_Disaster" ("DisNo.");

ALTER TABLE "Lives_Affected" ADD CONSTRAINT "fk_Lives_Affected_DisNo." FOREIGN KEY("DisNo.")
REFERENCES "Natural_Disaster" ("DisNo.");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_Disaster_subtype_id" FOREIGN KEY("Disaster_subtype_id")
REFERENCES "Natural_Disaster" ("Disaster_Subtype_id");

