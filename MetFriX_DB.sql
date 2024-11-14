CREATE DATABASE MetFriX;

CREATE TABLE Movies (
    MovieID INT,
    Title VARCHAR(30),
    Genre VARCHAR(30),
    Cast VARCHAR(255),
    Description VARCHAR(255),
    Year DATE,
    MovieCoverImage VARCHAR(30),
    PRIMARY KEY (MovieID)
);

CREATE TABLE Users (
    Username VARCHAR(30),
    Name VARCHAR(30),
    Password VARCHAR(30),
    DateOfAccountCreation DATE,
    Bio VARCHAR, 
    PRIMARY KEY (Username),
    FOREIGN KEY (Name) References ActorOrDirectorMovieList (Name)
);

CREATE TABLE Friends (
    UsernameOfUser VARCHAR(30),
    UsernameOfFriend VARCHAR(30),
    NameOfUser VARCHAR(30),
    NameOfFriend VARCHAR(30),
    PRIMARY KEY (UsernameOfUser, UsernameOfFriend),
    FOREIGN KEY (UsernameOfUser) References Users (Username),
    FOREIGN KEY (UsernameOfFriend) References Users (Username)
);

CREATE TABLE Reviews (
    Username VARCHAR(30),
    MovieID INT,
    Reviews VARCHAR(255),
    Rating CHAR(2),
    PRIMARY KEY (Username, MovieID),
    FOREIGN KEY (Username) References Users (Username),
    FOREIGN KEY (MovieID) References Movies (MovieID)
);

CREATE TABLE MoviesWatched (
    Username VARCHAR(30),
    MovieID INT,
    PRIMARY KEY (Username, MovieID),
    FOREIGN KEY (Username) References Users (Username),
    FOREIGN KEY (MovieID) References Movies (MovieID)
);

CREATE TABLE ActorOrDirectorMovieList (
    Name VARCHAR,
    MovieID INT,
    MovieTitle VARCHAR,
    PRIMARY KEY (Name),
    FOREIGN KEY (MovieID) References Movies (MovieID),
    FOREIGN KEY (MovieTitle) References Movies (Title)
);
