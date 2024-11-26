SHOW TABLES;

SELECT m.Title, r.ReviewText, r.Rating 
FROM MoviesWatched mw
LEFT JOIN Movies m ON mw.MovieID = m.MovieID
LEFT JOIN Reviews r ON mw.MovieID = r.MovieID AND mw.Username = r.Username
WHERE mw.Username = 'username';


SELECT *
FROM friends;

-- Insert data into Movies table
INSERT INTO Movies (MovieID, Title, Genre, Description, Year, CoverImage)
VALUES
    (1, 'Money Heist: MetFriX Edition', 'Action', NULL, NULL, NULL),
    (2, 'The Matrix', 'Arcade', NULL, NULL, NULL),
    (3, 'T.I.M', 'Horror', NULL, NULL, NULL),
    (4, 'The After', 'Thriller', NULL, NULL, NULL),
    (5, 'Oppenheimer', NULL, 'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb. Based on the Pulitzer Prize-winning book \"American Prometheus\".', 2023, NULL);



INSERT INTO Users (Username, Name, Password, DateOfAccountCreation, Bio)
VALUES
    ('michael johnson', 'Michael Mosuro', 'password123', '2024-11-26', 'Avid movie watcher.'),
    ('condensatonpolymerization', 'clyde', 'securepass', '2024-11-25', 'Loves thrillers and sci-fi.'),
    ('tiff', 'Tiffany Holness', 'moviebuff2024', '2024-11-20', 'Action movie enthusiast.');

INSERT INTO Reviews (Username, MovieID, ReviewText, Rating)
VALUES
    ('michael johnson', 1, 'An epic twist to the Money Heist story!', 9.0),
    ('user', 2, 'The Matrix is a classic that never gets old.', 10.0),
    ('user', 5, 'Oppenheimer is a masterpiece of storytelling and science.', 9.5);

INSERT INTO MoviesWatched (Username, MovieID)
VALUES
    ('michael johnson', 1),
    ('clyde', 2),
    ('clyde', 5),
    ('tiff', 3),
    ('oladunns', 4);

INSERT INTO ActorOrDirectorMovieList (Name, Role, MovieID)
VALUES
    ('Cillian Murphy', 'Actor', 5),
    ('Emily Blunt', 'Actor', 5),
    ('Matt Damon', 'Actor', 5),
    ('Robert Downey Jr.', 'Actor', 5),
    ('Christopher Nolan', 'Director', 5);

INSERT INTO Friends (UsernameOfUser, UsernameOfFriend)
VALUES
    ('michael_johnson', 'clyde'),
    ('clyde', 'tiff'),
    ('clyde', 'oladunns'),
    ('tiff', 'oladunns'),
    ('oladunns', 'michael_johnson');


SHOW TABLES;

