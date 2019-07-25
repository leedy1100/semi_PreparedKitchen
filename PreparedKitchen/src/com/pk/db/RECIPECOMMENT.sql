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
	
	CONSTRAINT FK_RECIPECOMMENT_RECIPEBOARD_NO FOREIGN KEY(RECIPEBOARD_NO) 
	REFERENCES RECIPEBOARD(RECIPEBOARD_NO)
);

