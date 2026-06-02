CREATE DATABASE marvel_mcu_analysis;
USE marvel_mcu_analysis;
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    release_year INT,
    phase_number INT,
    runtime_mins INT,
    genre VARCHAR(255),
    director VARCHAR(255)
);
CREATE TABLE ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    imdb_rating FLOAT,
    rt_critic_score INT,
    rt_audience_score INT,

    FOREIGN KEY (movie_id)
    REFERENCES movies(movie_id)
);
CREATE TABLE box_office (
    boxoffice_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    production_budget BIGINT,
    worldwide_box_office BIGINT,
    domestic_box_office BIGINT,
    international_box_office BIGINT,
    opening_weekend BIGINT,

    FOREIGN KEY (movie_id)
    REFERENCES movies(movie_id)
);
CREATE TABLE streaming_stats (
    stream_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    trailer_views BIGINT,
    trailer_likes BIGINT,
    trailer_count INT,

    FOREIGN KEY (movie_id)
    REFERENCES movies(movie_id)
);
CREATE TABLE movie_success_metrics (
    metric_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    profit BIGINT,
    roi DECIMAL(10,2),
    success_category VARCHAR(50),

    FOREIGN KEY (movie_id)
    REFERENCES movies(movie_id)
);

# movies table

INSERT INTO movies (
title,
release_year,
phase_number,
runtime_mins,
genre,
director
)

SELECT
title,
release_year,
mcu_phase_number,
`runtime (mins)`,
genres,
director

FROM movies_raw;


# Ratings Table

INSERT INTO ratings (
movie_id,
imdb_rating,
rt_critic_score,
rt_audience_score
)

SELECT
movie_id,
imdb_rating,
rt_tomato_meter,
rt_audience_score

FROM movies_raw mr
JOIN movies m
ON mr.title = m.title;

# Box Office Table

INSERT INTO box_office (
movie_id,
production_budget,
worldwide_box_office,
domestic_box_office,
international_box_office,
opening_weekend
)

SELECT
m.movie_id,
mr.production_budget,
mr.worldwide_box_office,
mr.domestic_box_office,
mr.international_box_office,
mr.`opening weekend`

FROM movies_raw mr
JOIN movies m
ON mr.title = m.title;


# Streaming Stats Table

INSERT INTO streaming_stats (
movie_id,
trailer_views,
trailer_likes,
trailer_count
)

SELECT
m.movie_id,
mr.trailer_views,
mr.trailer_likes,
mr.trailer_count

FROM movies_raw mr
JOIN movies m
ON mr.title = m.title;

# Success Metrics Table


INSERT INTO movie_success_metrics (
movie_id,
profit,
roi,
success_category
)

SELECT
m.movie_id,
mr.profit,
mr.roi,
mr.success_category

FROM movies_raw mr
JOIN movies m
ON mr.title = m.title;

DESC movie_success_metrics;
SELECT COUNT(*) FROM movies;
SELECT COUNT(*) FROM ratings;
SELECT COUNT(*) FROM box_office;
SELECT COUNT(*) FROM streaming_stats;
SELECT COUNT(*) FROM movie_success_metrics;

# Verify JOINs

SELECT
m.title,
r.imdb_rating,
b.worldwide_box_office

FROM movies m
JOIN ratings r
ON m.movie_id = r.movie_id

JOIN box_office b
ON m.movie_id = b.movie_id

LIMIT 10;

# Top Revenue Movies

SELECT
m.title,
b.worldwide_box_office

FROM movies m
JOIN box_office b
ON m.movie_id = b.movie_id

ORDER BY b.worldwide_box_office DESC
LIMIT 10;

# Highest ROI Movies

SELECT
m.title,
s.roi

FROM movies m
JOIN movie_success_metrics s
ON m.movie_id = s.movie_id

ORDER BY s.roi DESC
LIMIT 10;

# Best MCU Phase

SELECT
m.phase_number,
SUM(b.worldwide_box_office) total_revenue

FROM movies m
JOIN box_office b
ON m.movie_id = b.movie_id

GROUP BY m.phase_number
ORDER BY total_revenue DESC;

# Top Directors by Revenue

SELECT
director,
SUM(worldwide_box_office) AS revenue
FROM movies m
JOIN box_office b
ON m.movie_id=b.movie_id
GROUP BY director
ORDER BY revenue DESC;

# Window Functions

# Rank Movies by Revenue

SELECT
m.title,
b.worldwide_box_office,

RANK() OVER(
ORDER BY b.worldwide_box_office DESC
) revenue_rank

FROM movies m
JOIN box_office b
ON m.movie_id=b.movie_id;

# Rank Movies Within Phase 

SELECT
title,
phase_number,

RANK() OVER(
PARTITION BY phase_number
ORDER BY worldwide_box_office DESC
) phase_rank

FROM movies m
JOIN box_office b
ON m.movie_id=b.movie_id;

# Movies Above Average Revenue

SELECT
title,
worldwide_box_office

FROM movies m
JOIN box_office b
ON m.movie_id=b.movie_id

WHERE worldwide_box_office >

(
SELECT AVG(worldwide_box_office)
FROM box_office
);

# Create Views

# Revenue Analysis View

CREATE VIEW marvel_executive_dashboard AS

SELECT
m.title,
m.release_year,
r.imdb_rating,
b.worldwide_box_office,
s.roi,
s.success_category

FROM movies m

JOIN ratings r
ON m.movie_id=r.movie_id

JOIN box_office b
ON m.movie_id=b.movie_id

JOIN movie_success_metrics s
ON m.movie_id=s.movie_id;

# MCU Success Intelligence Query

CREATE VIEW marvel_success_score AS

SELECT
m.title,

(
    r.imdb_rating * 10
    +
    r.rt_audience_score
    +
    s.roi
) AS success_score

FROM movies m

JOIN ratings r
ON m.movie_id = r.movie_id

JOIN movie_success_metrics s
ON m.movie_id = s.movie_id;

SELECT *
FROM marvel_success_score
ORDER BY success_score DESC;


# Director Intelligence Dashboard

CREATE VIEW director_performance AS

SELECT
m.director,
COUNT(*) AS total_projects,
AVG(r.imdb_rating) AS avg_imdb,
AVG(s.roi) AS avg_roi,
SUM(b.worldwide_box_office) AS total_revenue

FROM movies m

JOIN ratings r
ON m.movie_id=r.movie_id

JOIN box_office b
ON m.movie_id=b.movie_id

JOIN movie_success_metrics s
ON m.movie_id=s.movie_id

GROUP BY m.director;

# MCU Phase Intelligence

CREATE VIEW phase_performance AS

SELECT
phase_number,

COUNT(*) AS projects,

AVG(imdb_rating) AS avg_rating,

SUM(worldwide_box_office) AS revenue

FROM movies m

JOIN ratings r
ON m.movie_id=r.movie_id

JOIN box_office b
ON m.movie_id=b.movie_id

GROUP BY phase_number;

# Audience vs Critics Gap

CREATE VIEW audience_critic_gap AS

SELECT

m.title,

r.rt_audience_score,

r.rt_critic_score,

(
r.rt_audience_score
-
r.rt_critic_score
)

AS score_gap

FROM movies m

JOIN ratings r
ON m.movie_id=r.movie_id;

# Underrated Movie Detector

SELECT
title,
imdb_rating,
worldwide_box_office

FROM marvel_executive_dashboard

WHERE imdb_rating > 7.5
AND worldwide_box_office <
(
SELECT AVG(worldwide_box_office)
FROM box_office
);

# DIRECTOR INTELLIGENCE ENGINE

SELECT

director,

COUNT(*) movies,

ROUND(
AVG(imdb_rating),
2
) avg_imdb,

SUM(worldwide_box_office)
total_revenue,

ROUND(
AVG(roi),
2
) avg_roi

FROM movies_raw

GROUP BY director

ORDER BY total_revenue DESC;
