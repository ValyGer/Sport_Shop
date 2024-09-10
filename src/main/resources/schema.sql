DROP TABLE IF EXISTS OPERATIONS;
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS PRODUCTS;

CREATE TABLE USERS (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  EMAIL VARCHAR(256) NOT NULL UNIQUE,
  USER_NAME VARCHAR(256) NOT NULL,
  USER_ROLE VARCHAR(25) NOT NULL,
  USER_PASSWORD VARCHAR(25) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE PRODUCTS (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  KEY_PRODUCT BIGINT NOT NULL UNIQUE,
  PRODUCT_NAME VARCHAR(256) NOT NULL,
  DESCRIPTION VARCHAR(1024) NOT NULL,
  MAKER VARCHAR(256) NOT NULL,
  PRICE BIGINT NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE OPERATIONS (
  ID BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  NUMBER_OPERATION BIGINT NOT NULL UNIQUE,
  KEY_PRODUCT BIGINT NOT NULL UNIQUE,
  PRODUCT_NAME VARCHAR(256) NOT NULL,
  USER_ID BIGINT NOT NULL,
  PRICE BIGINT NOT NULL,
  CREATE_ON TIMESTAMP NOT NULL,
  PRIMARY KEY (ID)
);


ALTER TABLE OPERATIONS ADD CONSTRAINT FK_OPERATION_USER  FOREIGN KEY (USER_ID) REFERENCES USERS (ID) ON DELETE CASCADE;

ALTER TABLE OPERATIONS ADD CONSTRAINT FK_OPERATION_PRODUCT FOREIGN KEY (KEY_PRODUCT) REFERENCES OPERATIONS (KEY_PRODUCT) ON DELETE CASCADE;


insert into users("id", email, user_name, user_password, user_role) values (1, 'user@user.ru', 'Valy', '123', 'admin')