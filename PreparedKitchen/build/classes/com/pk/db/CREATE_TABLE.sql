DROP TABLE MEMBER;

CREATE TABLE MEMBER(

	ID 			VARCHAR2(500) 	PRIMARY KEY,
	PW 			VARCHAR2(500) 	NOT NULL,
	NAME 		VARCHAR2(1000) 	NOT NULL,
	EMAIL 		VARCHAR2(1000) 	NOT NULL,
	PHONE 		VARCHAR2(1000) 	NOT NULL,
	ADDR 		VARCHAR2(2000) 	NOT NULL,
	ENABLED 	VARCHAR2(2) 	NOT NULL,
	BIRTH 		VARCHAR2(1000) 	NOT NULL,
	REGDATE 	DATE 			NOT NULL,
	ROLE		VARCHAR2(20)	NOT NULL,
	
	CONSTRAINT CHECK_ENABLED CHECK(ENABLED IN('Y','N'))
);

---------------------------------------------------------------

DROP SEQUENCE RECIPESEQ;
DROP TABLE RECIPE;

CREATE SEQUENCE RECIPESEQ;
CREATE TABLE RECIPE(

	RECIPE_NO 			NUMBER 			PRIMARY KEY,
	RECIPE_NAME 		VARCHAR2(1000) 	NOT NULL,
	RECIPE_CONTENT 		VARCHAR2(4000) 	NOT NULL,
	RECIPE_NUTRIENT 	VARCHAR2(300) 	NOT NULL,
	RECIPE_CATEGORY 	VARCHAR2(300) 	NOT NULL
);

---------------------------------------------------------------

DROP SEQUENCE RECIPEBOARDSEQ;
DROP TABLE RECIPEBOARD;

CREATE SEQUENCE RECIPEBOARDSEQ;
CREATE TABLE RECIPEBOARD(

	RECIPEBOARD_NO 			NUMBER 			 PRIMARY KEY,
	ID 						VARCHAR2(500) 	 NOT NULL,
	RECIPEBOARD_TITLE 		VARCHAR2(2000)	 NOT NULL,
	RECIPEBOARD_CONTENT	 	VARCHAR2(4000)	 NOT NULL,
	RECIPEBOARD_REGDATE		VARCHAR2(500)	 NOT NULL,
	RECIPEBOARD_READCOUNT	NUMBER			 NOT NULL,
	RECIPEBOARD_LIKE		NUMBER			 NOT NULL,
	
	CONSTRAINT FK_RECIPEBOARD_ID FOREIGN KEY(ID) 
	REFERENCES MEMBER(ID)
);

---------------------------------------------------------------

DROP SEQUENCE RECIPECOMMENTSEQ;
DROP TABLE RECIPECOMMENT;

CREATE SEQUENCE RECIPECOMMENTSEQ;
CREATE TABLE RECIPECOMMENT(

	COMMENT_NO 			NUMBER 			PRIMARY KEY,
	RECIPEBOARD_NO		NUMBER 			NOT NULL,
	ID					VARCHAR2(500) 	NOT NULL,
	COMMENT_CONTENT 	VARCHAR2(4000) 	NOT NULL,
	COMMENT_REGDATE 	VARCHAR2(500) 	NOT NULL,
	COMMENT_GROUPNO 	NUMBER 			NOT NULL,
	COMMENT_ORDER 		NUMBER 			NOT NULL,
	COMMENT_TAB 		NUMBER 			NOT NULL,
	
	CONSTRAINT FK_COMMENT_RECIPEBOARD_NO FOREIGN KEY(RECIPEBOARD_NO) 
	REFERENCES RECIPEBOARD(RECIPEBOARD_NO)
);

---------------------------------------------------------------

DROP SEQUENCE MATERIALSEQ;
DROP TABLE MATERIAL;

CREATE SEQUENCE MATERIALSEQ;
CREATE TABLE MATERIAL(

	MATERIAL_NO 		NUMBER,
	RECIPE_NO 			NUMBER,
	MATERIAL_NAME 		VARCHAR2(500) 	NOT NULL,
	MATERIAL_CAPACITY 	VARCHAR2(500) 	NOT NULL,
	MATERIAL_TYPECODE 	NUMBER 			NOT NULL,
	MATERIAL_TYPENAME 	VARCHAR2(200) 	NOT NULL,
	
	CONSTRAINT PK_MATERIAL PRIMARY KEY(MATERIAL_NO, RECIPE_NO),
	CONSTRAINT FK_MATERIAL_RECIPE_NO FOREIGN KEY(RECIPE_NO)
	REFERENCES RECIPE(RECIPE_NO)
);

---------------------------------------------------------------

DROP SEQUENCE PRODUCTLISTSEQ;
DROP TABLE PRODUCTLIST;

CREATE SEQUENCE PRODUCTLISTSEQ;
CREATE TABLE PRODUCTLIST(

	PRODUCTLIST_NO 	NUMBER 			PRIMARY KEY,
	RECIPE_NO 		NUMBER 			NOT NULL,
	RECIPE_NAME 	VARCHAR2(1000) 	NOT NULL,
	RECIPE_IMG 		VARCHAR2(1000) 	NOT NULL,
	SALES_COUNT 	NUMBER 			NOT NULL,
	VIEW_NO 		NUMBER 			NOT NULL,
	
	CONSTRAINT FK_PRODUCTLIST_RECIPE_NO FOREIGN KEY(RECIPE_NO)
	REFERENCES RECIPE(RECIPE_NO)
);

---------------------------------------------------------------

DROP SEQUENCE PAYMENTSEQ;
DROP TABLE PAYMENT;

CREATE SEQUENCE PAYMENTSEQ;
CREATE TABLE PAYMENT(

	PAYMENT_NO 			NUMBER 			PRIMARY KEY,
	PAYMENT_GROUPNO 	NUMBER 			NOT NULL,
	ID 					VARCHAR2(500) 	NOT NULL,
	PAYMENT_PRICE 		VARCHAR2(500) 	NOT NULL,
	RECIPE_NO 			NUMBER 			NOT NULL,
	MATERIAL_NO 		NUMBER 			NOT NULL,
	PAYMENT_DATE 		DATE 			NOT NULL,
	SHIPPING_ADDR 		VARCHAR2(2000) 	NOT NULL,
	
	CONSTRAINT FK_PAYMENT_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID),
	CONSTRAINT FK_PAYMENT_MATERIAL_NO FOREIGN KEY(MATERIAL_NO, RECIPE_NO)
	REFERENCES MATERIAL(MATERIAL_NO, RECIPE_NO)
);

---------------------------------------------------------------

DROP SEQUENCE INTERESTLISTSEQ;
DROP TABLE INTERESTLIST;

CREATE SEQUENCE INTERESTLISTSEQ;
CREATE TABLE INTERESTLIST(

	INTERESTLIST_NO 	NUMBER 			PRIMARY KEY,
	ID 					VARCHAR2(500) 	NOT NULL,
	RECIPE_NO 			NUMBER 			NOT NULL,
	
	CONSTRAINT FK_INTEREST_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID),
	CONSTRAINT FK_INTEREST_RECIPE_NO FOREIGN KEY(RECIPE_NO)
	REFERENCES RECIPE(RECIPE_NO)
);

---------------------------------------------------------------

DROP SEQUENCE CARTSEQ;
DROP TABLE CART;

CREATE SEQUENCE CARTSEQ;
CREATE TABLE CART(

	CART_NO 		NUMBER 			PRIMARY KEY,
	ID 				VARCHAR2(500) 	NOT NULL,
	RECIPE_NO		NUMBER 			NOT NULL,
	MATERIAL_NO 	NUMBER 			NOT NULL,
	
	CONSTRAINT FK_CART_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID),
	CONSTRAINT FK_CART_MATERIAL_NO FOREIGN KEY(MATERIAL_NO, RECIPE_NO)
	REFERENCES MATERIAL(MATERIAL_NO, RECIPE_NO)
);
