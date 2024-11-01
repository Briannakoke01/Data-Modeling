--Teams Table
CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    city VARCHAR(100)
);

--Players Table
CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    team_id INT REFERENCES Teams(team_id) ON DELETE SET NULL
);

--Seasons Table
CREATE TABLE Seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

--Matches Table
CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    season_id INT REFERENCES Seasons(season_id) ON DELETE CASCADE,
    team1_id INT REFERENCES Teams(team_id) ON DELETE CASCADE,
    team2_id INT REFERENCES Teams(team_id) ON DELETE CASCADE,
    match_date DATE NOT NULL,
    team1_score INT DEFAULT 0,
    team2_score INT DEFAULT 0,
    UNIQUE (team1_id, team2_id, match_date)
);

--Goals Table
CREATE TABLE Goals (
    goal_id SERIAL PRIMARY KEY,
    match_id INT REFERENCES Matches(match_id) ON DELETE CASCADE,
    player_id INT REFERENCES Players(player_id) ON DELETE SET NULL,
    scoring_team_id INT REFERENCES Teams(team_id) ON DELETE CASCADE,
    goal_time TIME NOT NULL
);

--Referees Tables
CREATE TABLE Referees (
    referee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    certification_level VARCHAR(50)
);

--MatchReferees Table
CREATE TABLE MatchReferees (
    match_id INT REFERENCES Matches(match_id) ON DELETE CASCADE,
    referee_id INT REFERENCES Referees(referee_id) ON DELETE CASCADE,
    PRIMARY KEY (match_id, referee_id)
);


--Standing Table
CREATE TABLE Standings (
    season_id INT REFERENCES Seasons(season_id) ON DELETE CASCADE,
    team_id INT REFERENCES Teams(team_id) ON DELETE CASCADE,
    points INT DEFAULT 0,
    wins INT DEFAULT 0,
    losses INT DEFAULT 0,
    draws INT DEFAULT 0,
    PRIMARY KEY (season_id, team_id)
);
