CREATE TABLE ACCOUNT
  (
    ACCOUNT_ID VARCHAR2 (10 BYTE) CONSTRAINT ACC_ACCOUNT_ID_NN NOT NULL ,
    FIRST_NAME VARCHAR2 (20 BYTE) CONSTRAINT ACC_FIRST_NAME_NN NOT NULL ,
    LAST_NAME  VARCHAR2 (20 BYTE) CONSTRAINT ACC_LAST_NAME_NN NOT NULL ,
    COUNTRY    VARCHAR2 (50 BYTE)
  ) ;
  
CREATE UNIQUE INDEX ACCOUNT_ID_IDX ON ACCOUNT ( ACCOUNT_ID ASC ) ;
CREATE INDEX ACCOUNT_NAME_IDX ON ACCOUNT ( FIRST_NAME ASC , LAST_NAME ASC ) ;

ALTER TABLE ACCOUNT ADD CONSTRAINT ACCOUNT_PK PRIMARY KEY ( ACCOUNT_ID ) ;


CREATE TABLE CREDIT_CARD
  (
    CREDIT_CARD_ID VARCHAR2 (10 BYTE) CONSTRAINT CREDIT_CARD_ID_NN NOT NULL ,
    ACCOUNT_ID     VARCHAR2 (10 BYTE) CONSTRAINT CC_ACCOUNT_ID_NN NOT NULL ,
    CASH_AMOUNT    NUMBER (12,2) CONSTRAINT CC_CASH_AMOUNT_NN NOT NULL
  ) ;
  
CREATE UNIQUE INDEX CREDIT_CARD_ID_IDX ON CREDIT_CARD ( CREDIT_CARD_ID ASC ) ;
CREATE INDEX CC_ACCOUNT_IDX ON CREDIT_CARD ( ACCOUNT_ID ASC ) ;

ALTER TABLE CREDIT_CARD ADD CONSTRAINT CREDIT_CARD_PK PRIMARY KEY ( CREDIT_CARD_ID ) ;


CREATE TABLE TRANSACTION
  (
    TRANSACTION_ID   NUMBER (10) CONSTRAINT TRANSACTION_ID_NN NOT NULL ,
    DATE_TIME        TIMESTAMP CONSTRAINT DATE_TIME_NN NOT NULL ,
    CREDIT_CARD_FROM VARCHAR2 (10 BYTE) CONSTRAINT CREDIT_CARD_FROM_NN NOT NULL ,
    CREDIT_CARD_TO   VARCHAR2 (10 BYTE) CONSTRAINT CREDIT_CARD_TO_NN NOT NULL ,
    AMOUNT           NUMBER (10,2) CONSTRAINT AMOUNT_NN NOT NULL
  ) ;
  
CREATE UNIQUE INDEX TRANSACTION_ID_IDX ON TRANSACTION ( TRANSACTION_ID ASC ) ;
CREATE INDEX TRANSACTION_DATETIME_IDX ON TRANSACTION ( DATE_TIME ASC ) ;
CREATE INDEX TRANSACTION_CC_FROM_IDX ON TRANSACTION ( CREDIT_CARD_FROM ASC ) ;
CREATE INDEX TRANSACTION_CC_TO_IDX ON TRANSACTION ( CREDIT_CARD_TO ASC ) ;

ALTER TABLE TRANSACTION ADD CONSTRAINT TRANSACTION_PK PRIMARY KEY ( TRANSACTION_ID ) ;


ALTER TABLE CREDIT_CARD ADD CONSTRAINT CREDIT_CARD_ACCOUNT_FK FOREIGN KEY ( ACCOUNT_ID ) REFERENCES ACCOUNT ( ACCOUNT_ID ) ;

ALTER TABLE TRANSACTION ADD CONSTRAINT TRANSACTION_CARD_FROM_FK FOREIGN KEY ( CREDIT_CARD_FROM ) REFERENCES CREDIT_CARD ( CREDIT_CARD_ID ) ;

ALTER TABLE TRANSACTION ADD CONSTRAINT TRANSACTION_CARD_TO_FK FOREIGN KEY ( CREDIT_CARD_TO ) REFERENCES CREDIT_CARD ( CREDIT_CARD_ID ) ;


CREATE SEQUENCE ACCOUNT_SEQUENCE START WITH 0000000001 MINVALUE 0000000001 MAXVALUE 9999999999 NOCACHE ORDER ;

CREATE SEQUENCE CREDIT_CARD_SEQ START WITH 0000000001 MINVALUE 0000000001 MAXVALUE 9999999999 NOCACHE ORDER ;

CREATE SEQUENCE TRANSACTION_SEQ START WITH 1 MINVALUE 1 MAXVALUE 9999999999 NOCACHE ORDER ;