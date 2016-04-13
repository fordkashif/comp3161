/* Strong Entity Schema*/

CREATE TABLE 'profile'(
    'profile_ID' int(11) NOT NULL,
    'first_name' varchar(40) NOT NULL,
    'last_name' varchar(40) NOT NULL,
    'address' varchar(100) NOT NULL,
    'email' varchar(50) NOT NULL,
    'created' datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (profile_ID)
);

CREATE TABLE 'user'(
    'username' varchar(50) NOT NULL,
    'password' varchar(50) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE 'ingredients'(
    'ingredients_ID' int(11) NOT NULL,
    'ingred_name' VARCHAR(50) NOT NULL,
    'unit' VARCHAR(50) NOT NULL,
    'quantity' int(5) NOT NULL
    PRIMARY KEY (ingredients_ID)
);

CREATE TABLE 'kitchen'(
    'item_ID' int(11) NOT NULL,
    'name' VARCHAR(50) NOT NULL,
    'amount' int(11) NOT NULL,
    PRIMARY KEY (item_ID)
);

CREATE TABLE 'supermarket_list'(
    'item_name' VARCHAR(50) NOT NULL,
    'quantity' int(11) NOT NULL,
    PRIMARY KEY (item_name)
);

CREATE TABLE 'meal'(
    'meal_ID' int(11) NOT NULL,
    'cum_calories' float(11,2) NOT NULL,
    'meal_type' VARCHAR(50) NOT NULL,
    'meal_serving' int(11) NOT NULL,
    'image' VARCHAR(50) NOT NULL,
    PRIMARY KEY(meal_ID)
);

CREATE TABLE 'recipe'(
    'recipe_ID' int(11) NOT NULL,
    'serving_quantity' int(11) NOT NULL,
    'crt_date' date NOT NULL DEFAULT CURRENT_TIMESTAMP,
    'recipe_name' VARCHAR(50) NOT NULL,
    'prep_time' VARCHAR(50) NOT NULL,
    'calorie_count' int(11) NOT NULL ,
    PRIMARY KEY (recipe_ID)
);

CREATE TABLE 'instructions'(
    'instruction_ID' int(11) NOT NULL,
    'step_no' int(11) NOT NULL, 
    'description' VARCHAR(50) NOT NULL,
    PRIMARY KEY (instruction_ID)
);

/* Relational Schema */

CREATE TABLE 'login'(
    'profile_ID' int(11) NOT NULL,
    'username' varchar(50) NOT NULL,
    FOREIGN KEY (profile_ID) references profile(profile_ID),
    FOREIGN KEY (username) references user(username)
);

CREATE TABLE 'stores'(
    'ingredients_ID' int(11) NOT NULL,
    'profile_ID' int (11) NOT NULL,
    FOREIGN KEY (ingredients_ID) references ingredients(ingredients_ID),
    FOREIGN KEY (profile_ID) references profile(profile_ID)
);

CREATE TABLE 'contain'(
    'item_ID' int(11) NOT NULL,
    'ingredients_ID' int(11) NOT NULL,
    FOREIGN KEY (item_ID) references kitchen(item_ID),
    FOREIGN KEY (ingredients_ID) references ingredients(ingredients_ID)
);

CREATE TABLE 'generate'(
    'item_name' VARCHAR(50) NOT NULL,
    'item_id' int(11) not null,
    foreign key (item_name) references supermarket_list(item_name),
    foreign key (item_id) references kitchen(item_ID),
);

CREATE TABLE 'creates'(
    'item_name' varchar(50) not null,
    'meal_ID' int(11) not null,
    foreign key(item_name) references supermarket_list(item_name),
    foreign key(meal_ID) references meal(meal_ID)
);

CREATE TABLE 'forms'(
    'meal_ID' int(11) not null,
    'recipe_ID' int(11) not null,
    foreign key(meal_ID) references meal(meal_ID),
    foreign key(recipe_ID) references recipe(recipe_ID)
);

CREATE TABLE 'have'(
    'recipe_ID' int(11) not null,
    'instruction_ID' int(11) NOT NULL,
    foreign key(recipe_ID) references recipe(recipe_ID),
    foreign key (instruction_ID) references instruction(instruction_ID)
);

CREATE TABLE 'uses'(
    'meal_ID' int(11) not null,
    'ingredients_ID' int(11) NOT NULL,
    foreign key(meal_ID) references meal(meal_ID),
    FOREIGN KEY (ingredients_ID) references ingredients(ingredients_ID)
);

CREATE TABLE 'make'(
    'ingredients_ID' int(11) NOT NULL,
    'recipe_ID' int(11) not null,
    FOREIGN KEY (ingredients_ID) references ingredients(ingredients_ID),
    foreign key(recipe_ID) references recipe(recipe_ID)
);

CREATE TABLE 'plan'(
    'profile_ID' int(11) not null,
    'meal_ID' int(11) not null,
    foreign key(profile_ID) references profile (profile_ID),
    foreign key (meal_ID) references meal(meal_ID)
);

CREATE TABLE 'stored_in'(
    'recipe_ID' int(11) not null,
    'full_name' varchar(50) not null,
    primary key(full_name),
    foreign key (recipe_ID) references recipe(recipe_ID)
);

/* populating tables */

