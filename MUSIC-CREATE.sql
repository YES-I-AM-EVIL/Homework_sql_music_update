CREATE table if not EXISTS Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE table if not EXISTS Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE table if not EXISTS Albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL
);

CREATE table if not EXISTS Tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration TIME NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums (id)
);

CREATE table if not EXISTS Collections (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL
);

CREATE table if not EXISTS Artist_Genre (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artists (id),
    FOREIGN KEY (genre_id) REFERENCES Genres (id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE table if not EXISTS Artist_Album (
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artists (id),
    FOREIGN KEY (album_id) REFERENCES Albums (id),
    PRIMARY KEY (artist_id, album_id)
);

CREATE table if not EXISTS Track_Collection (
    track_id INT NOT NULL,
    collection_id INT NOT NULL,
    FOREIGN KEY (track_id) REFERENCES Tracks (id),
    FOREIGN KEY (collection_id) REFERENCES Collections (id),
    PRIMARY KEY (track_id, collection_id)
);