DROP DATABASE IF EXISTS TaskManagerSystemDB;
CREATE DATABASE TaskManagerSystemDB;
USE TaskManagerSystemDB;

CREATE TABLE Task(
    id              INT     NOT NULL AUTO_INCREMENT,
    title           VARCHAR(100)    NOT NULL,
    description     VARCHAR(300)    ,
    votes           SMALLINT        DEFAULT 0,
    # category - CATEGORY RELATIONSHIP attribute
    category_id     INT     ,
    # user - USER RELATIONSHIP attribute
    user_id         INT     ,
    # Chamge to make the default data now()
    created_on      DATETIME        NOT NULL,
    completed_on    DATETIME        ,
    # Constraint required to specific keywords
    priority        VARCHAR(50)     DEFAULT 'NORMAL',
    # Constraint required to specific keywords
    status          VARCHAR(50)     DEFAULT 'READY',
    PRIMARY KEY (id),
    -- FOREIGN KEY (category_id) REFERENCES Category(id),
    CONSTRAINT CHK_PriorityValue CHECK (priority='LOW' OR priority='NORMAL' OR priority='HIGH'),
    CONSTRAINT CHK_StatusValue
        CHECK (
            status='READY' OR
            status='ON HOLD' OR
            status='ACTIVE' OR
            status='COMPLETE'
        )
);

-- ALTER TABLE Task ADD CONSTRAINT CHK_PriorityValue
--     CHECK (
--         priority='LOW' OR
--         priority='NORMAL' OR
--         priority='HIGH'
--     );
-- ALTER TABLE Task ADD CONSTRAINT CHK_StatusValue
--     CHECK (
--         status='On Hold' OR
--         status='Active' OR
--         status='Complete'
--     );


CREATE TABLE Category(
    # Name updates require, foreign key relations to be updated
    -- id              VARCHAR(12),
    id              INT NOT NULL AUTO_INCREMENT,
    name            VARCHAR(100),
    description     VARCHAR(300),
    user_id         INT,
    PRIMARY KEY (id)
    -- FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE User(
    id              INT NOT NULL AUTO_INCREMENT,
    username        VARCHAR(50),
    password_hash   VARCHAR(128),
    name            VARCHAR(100),
    surname         VARCHAR(100),
    email           VARCHAR(200),
    active          BIT,
    -- password_salt   CHAR(128),
    PRIMARY KEY (id)
);

# Now that the tables all exist, add the constraints here

ALTER TABLE Task
ADD FOREIGN KEY (category_id) REFERENCES Category(id);

ALTER TABLE Task
ADD FOREIGN KEY (user_id) REFERENCES User(id);

ALTER TABLE Category
ADD FOREIGN KEY (user_id) REFERENCES User(id);

# insert a dummy user with password='password'

INSERT INTO USER (username, password_hash, name, surname, email, active)
VALUES (
    'dummy_user',
    '$2y$10$N07Id6NUwyJGa8w02AWmTeGy0Gr11auQEkkLfhVXUyTd1ziFdoGGe',
    'Test',
    'User',
    'User@example.com',
    0
);

# Modify table for value format
-- ALTER TABLE `category` CHANGE `user_id` `user_id` INT(11) NULL DEFAULT NULL;