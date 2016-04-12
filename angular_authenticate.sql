CREATE TABLE 'profile'(
    'profile_ID' int(11) NOT NULL,
    'first_name' varchar(40) NOT NULL,
    'last_name' varchar(40) NOT NULL,
    'password' varchar(30) NOT NULL,
    'address' varchar(100) NOT NULL,
    'email' varchar(50) NOT NULL,
    'created' datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (profile_ID)
);