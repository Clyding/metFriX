CREATE DATABASE MetFriX;

-- Table: Movies
CREATE TABLE Movies (
    MovieID INT AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(30),
    Cast VARCHAR(255),
    Description TEXT,
    Year YEAR,
    CoverImage VARCHAR(255),
    PRIMARY KEY (MovieID)
);

-- Table: Users
CREATE TABLE Users (
    Username VARCHAR(30) PRIMARY KEY,
    Name VARCHAR(50),
    Password VARCHAR(255) NOT NULL, 
    DateOfAccountCreation DATE,
    Bio TEXT
);

-- Table: Friends
CREATE TABLE Friends (
    UsernameOfUser VARCHAR(30),
    UsernameOfFriend VARCHAR(30),
    PRIMARY KEY (UsernameOfUser, UsernameOfFriend),
    FOREIGN KEY (UsernameOfUser) REFERENCES Users (Username) ON DELETE CASCADE,
    FOREIGN KEY (UsernameOfFriend) REFERENCES Users (Username) ON DELETE CASCADE
);

-- Table: Reviews
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT,
    Username VARCHAR(30),
    MovieID INT,
    ReviewText TEXT,
    Rating DECIMAL(2, 1) CHECK (Rating BETWEEN 0 AND 10),
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (Username) REFERENCES Users (Username) ON DELETE CASCADE,
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID) ON DELETE CASCADE
);

-- Table: MoviesWatched
CREATE TABLE MoviesWatched (
    Username VARCHAR(30),
    MovieID INT,
    PRIMARY KEY (Username, MovieID),
    FOREIGN KEY (Username) REFERENCES Users (Username) ON DELETE CASCADE,
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID) ON DELETE CASCADE
);

-- Table: ActorOrDirectorMovieList
CREATE TABLE ActorOrDirectorMovieList (
    RecordID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Role VARCHAR(30), -- e.g., "Actor" or "Director"
    MovieID INT,
    PRIMARY KEY (RecordID),
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID) ON DELETE CASCADE
);

SHOW TABLES;
select MovieID 
from metfrix.movieswatched 
where `MovieID` = 'Movies'