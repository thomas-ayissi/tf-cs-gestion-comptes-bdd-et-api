/* PART 1 - Les 5 tables principales */

CREATE TABLE account
(
    id INT PRIMARY KEY NOT NULL,
    numero VARCHAR(16),
    receiver VARCHAR(16),
    communication VARCHAR(100),
    descriminor NVARCHAR(7), 
        CHECK (descriminor in ('courant', 'epargne','titre'))
    isOwner BOOLEAN,    
);

CREATE TABLE user
(
    id INT PRIMARY KEY NOT NULL,
    username VARCHAR(10),
    email VARCHAR(55),
    password VARCHAR(30) /* comment hacher ce mot de passe ? */ ,
    createdAt DATE,
    updatedAt DATE,
    isActive BOOLEAN,  
)


CREATE TABLE budget
(
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(20),
    prenom VARCHAR(20),
    period DATE,
    updatedAt DATE,
    isActive BOOLEAN, 
    
)


CREATE TABLE category
(
    id INT PRIMARY KEY NOT NULL,
    label VARCHAR(100),
    createdAt DATE,
    upcreatedAt DATE,
    isActive BOOLEAN, 
)


CREATE TABLE transaction
(
    id INT PRIMARY KEY NOT NULL,
    totalAmount INT,
    createdAt DATE,
    upcreatedAt DATE,
    isActive BOOLEAN, 
)


/* PART 2 - Les relations */


/* 2-1 creds */ 

CREATE TABLE creds (
FOREIGN KEY (account_id) REFERENCES account (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (transaction_id) REFERENCES transaction (id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (account_id, transaction_id)
);



/* 2-2 create */
CREATE TABLE create (
FOREIGN KEY (account_id) REFERENCES account (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (account_id, user_id)
);


/* 2-3 debts */ 
CREATE TABLE debts (
FOREIGN KEY (account_id) REFERENCES account (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (transaction_id) REFERENCES transaction (id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (account_id, transaction_id)
);


/* 2-4 define */ 
/* Parti pris de traiter d'abords la relation du bas avant de "remonter" car les trois autres comportent au moins un champ*/
CREATE TABLE define (
FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (budget_id) REFERENCES budget (id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (category_id, budget_id)
);


/* 2-5 ventile */ 
CREATE TABLE ventile (
amount REAL NOT NULL,    
FOREIGN KEY (transaction_id) REFERENCES category (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (category_id) REFERENCES budget (id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (transaction_id, category_id)
);


/* 2-6 define */ 
CREATE TABLE concern (
executionDate DATE NOT NULL,       
FOREIGN KEY (transaction_id) REFERENCES category (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (budget_id) REFERENCES budget (id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (transaction_id, budget_id)
);



/* 2-7 define */ 
CREATE TABLE create (
createdAt DATE NOT NULL,       
FOREIGN KEY (user_id) REFERENCES category (id) ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (budget_id) REFERENCES budget (id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (user_id, budget_id)
);