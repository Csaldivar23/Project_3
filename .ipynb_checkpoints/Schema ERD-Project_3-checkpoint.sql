
CREATE TABLE "Natural_Disaster" (
    "DisNo." varchar(20)   NOT NULL,
    "Disaster_Type_id" varchar(100)   NOT NULL,
    "Disaster_Subtype_id" varchar(20)   NOT NULL,
    "Event_Name" varchar(50)   NOT NULL,
    "Region" varchar(20)   NOT NULL,
    "Subregion" varchar(20)   NOT NULL,
    "Country" varchar(40)   NOT NULL,
    "ISO" varchar(5)   NOT NULL,
    "Magnitude" varchar(10)   NOT NULL,
    "Magnitude_Scale" varchar(10)   NOT NULL,
    "Latitude" varchar(10)   NOT NULL,
    "Longitude" varchar(10)   NOT NULL,
    "Start_Year" varchar(5)   NOT NULL,
    "Start_Month" varchar(5)   NOT NULL,
    "Start_Day" varchar(5)   NOT NULL,
    "End_Year" varchar(5)   NOT NULL,
    "End_Month" varchar(5)   NOT NULL,
    "End_Day" varchar(5)   NOT NULL,
    CONSTRAINT "pk_Natural_Disaster" PRIMARY KEY (
        "DisNo."
     )
);

CREATE TABLE "Category" (
    "Disaster_Type_id" varchar(100)   NOT NULL,
    "Disaster_Type" varchar(100)   NOT NULL
);

CREATE TABLE "Damage" (
    "DisNo." varchar(20)   NOT NULL,
    "OFDA/BHA_Response" varchar(5)   NOT NULL,
    "Appeal" varchar(5)   NOT NULL,
    "Declaration" varchar(5)   NOT NULL,
    "AID_Contribution_('000_US$)" varchar(20)   NOT NULL,
    "Reconstruction_Costs_('000_US$)" varchar(20)   NOT NULL,
    "Reconstruction_Costs_Adjusted_('000_US$)" varchar   NOT NULL,
    "Insured_Damage_('000_US$)" varchar(50)   NOT NULL,
    "Insured_Damage,_Adjusted_('000_US$)" varchar(50)   NOT NULL,
    "Total_Damage_('000_US$)" varchar(20)   NOT NULL,
    "Total_Damage_Adjusted_('000_US$)" varchar(20)   NOT NULL,
    "CPI" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Damage" PRIMARY KEY (
        "DisNo."
     )
);

CREATE TABLE "Lives_Affected" (
    "DisNo." varchar(20)   NOT NULL,
    "Total_Deaths" varchar(20)   NOT NULL,
    "No._Injured" varchar(20)   NOT NULL,
    "No._Affected" varchar(20)   NOT NULL,
    "No._Homeless" varchar(20)   NOT NULL,
    "Total_Affected" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Lives_Affected" PRIMARY KEY (
        "DisNo."
     )
);

CREATE TABLE "Subcategory" (
    "Disaster_subtype_id" varchar(20)   NOT NULL,
    "Disaster_subtype" varchar(50)   NOT NULL
);

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_Disaster_Type_id" FOREIGN KEY("Disaster_Type_id")
REFERENCES "Natural_Disaster" ("Disaster_Type_id");

ALTER TABLE "Damage" ADD CONSTRAINT "fk_Damage_DisNo." FOREIGN KEY("DisNo.")
REFERENCES "Natural_Disaster" ("DisNo.");

ALTER TABLE "Lives_Affected" ADD CONSTRAINT "fk_Lives_Affected_DisNo." FOREIGN KEY("DisNo.")
REFERENCES "Natural_Disaster" ("DisNo.");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_Disaster_subtype_id" FOREIGN KEY("Disaster_subtype_id")
REFERENCES "Natural_Disaster" ("Disaster_Subtype_id");

