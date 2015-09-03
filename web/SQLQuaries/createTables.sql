use ToDoList;

create table ToDo(
	ID int NOT NULL AUTO_INCREMENT,
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
Insert into category (catName)
value ('Birthday'), ('Work'), ('Hobby'), ('Other');
Insert into frequency (theDay)
value ('Mon'), ('Tue'), ('Wed'), ('Thurs'), ('Fri'),
		('Sat'), ('Sun'), ('Weekend'), ('Weekday'), 
        ('Everyday'), ('Year');
insert into ToDo (textToDo, remind, dato, freq, cat)
values ('This is my Birthday text', true, now(), 1, 11),
		('This is my Work text', true, now(), 2, 9),
        ('This is my Hobby text', true, now(), 3, 8),
        ('This is my Other text', true, now(), 4, 3);
SELECT * FROM ToDo;