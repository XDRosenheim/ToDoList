use ToDoList;

create table ToDo(
	ID int NOT NULL AUTO_INCREMENT,
    userOwner int NOT NULL REFERENCES users(id),
	textToDo text,
	remind boolean NOT NULL,
	dato date,
	freq int references frequency(ID),
	cat int references category(ID),
    PRIMARY KEY (ID)
);
create table frequency(
	ID int NOT NULL AUTO_INCREMENT,
    theDay text,
	PRIMARY KEY (ID)
);
create table category(
	ID int NOT NULL AUTO_INCREMENT,
    catName text,
    PRIMARY KEY (ID)
);
create table users(
	ID int NOT NULL AUTO_INCREMENT,
	username text NOT NULL,
    passphrase text NOT NULL,
    PRIMARY KEY (ID)
    );

Insert into category
value (NULL, 'Birthday'), (NULL, 'Work'), (NULL, 'Hobby'), (NULL, 'Other');

Insert into frequency
values (NULL, 'Mon'), (NULL, 'Tue'), (NULL, 'Wed'), (NULL, 'Thurs'), (NULL, 'Fri'),
		(NULL, 'Sat'), (NULL, 'Sun'), (NULL, 'Weekend'), (NULL, 'Weekday'), 
        (NULL, 'Everyday'), (NULL, 'Year');
        
insert into ToDo (userOwner, textToDo, remind, dato, freq, cat)
values (1, 'This is my Birthday text', true, now(), 1, 11),
		(1, 'This is my Work text', true, now(), 2, 9),
        (1, 'This is my Hobby text', true, now(), 3, 8),
        (2, 'This is my Other text', true, now(), 4, 3);

SELECT * FROM ToDo;