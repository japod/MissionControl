CREATE TABLE PERSON (ID BIGINT NOT NULL, DAYSWEEK INTEGER, EMAIL VARCHAR(255), HOURSWEEK INTEGER, LOCATION VARCHAR(255), NAME VARCHAR(255), PASSWORD VARCHAR(255), PICTURE BLOB(2147483647), PERSON_ROLE VARCHAR(255), ORGUNIT_ID BIGINT NOT NULL, PRIMARY KEY (ID))
CREATE TABLE ORGUNIT (ID BIGINT NOT NULL, COSTCENTER VARCHAR(255), LOCATION VARCHAR(255), NAME VARCHAR(255), SHORTNAME VARCHAR(255), managedby BIGINT, subunitof BIGINT, PRIMARY KEY (ID))
CREATE TABLE MISSION (ID BIGINT NOT NULL, BEGIN_DATE DATE, END_DATE DATE, ENGAGEMENT INTEGER, NAME VARCHAR(255), REMARKS VARCHAR(255), PROJECT_ROLE VARCHAR(255), MISSION_STATE INTEGER, requestedBy BIGINT, PRIMARY KEY (ID))
CREATE TABLE MISSION_PERSON (performedBy_ID BIGINT NOT NULL, missions_ID BIGINT NOT NULL, PRIMARY KEY (performedBy_ID, missions_ID))
ALTER TABLE PERSON ADD CONSTRAINT PERSON_ORGUNIT_ID FOREIGN KEY (ORGUNIT_ID) REFERENCES ORGUNIT (ID)
ALTER TABLE ORGUNIT ADD CONSTRAINT ORGUNIT_managedby FOREIGN KEY (managedby) REFERENCES PERSON (ID)
ALTER TABLE ORGUNIT ADD CONSTRAINT ORGUNIT_subunitof FOREIGN KEY (subunitof) REFERENCES ORGUNIT (ID)
ALTER TABLE MISSION ADD CONSTRAINT MISSIONrequestedBy FOREIGN KEY (requestedBy) REFERENCES PERSON (ID)
ALTER TABLE MISSION_PERSON ADD CONSTRAINT MSSNPRSNprfrmdByID FOREIGN KEY (performedBy_ID) REFERENCES PERSON (ID)
ALTER TABLE MISSION_PERSON ADD CONSTRAINT MSSNPERSONmssonsID FOREIGN KEY (missions_ID) REFERENCES MISSION (ID)
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(15), PRIMARY KEY (SEQ_NAME))
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0)