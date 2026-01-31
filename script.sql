-- DIM TABLE
CREATE TABLE dim_category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    full_date DATE UNIQUE NOT NULL,
    year INT,
    month INT,
    day INT
);

CREATE TABLE dim_source (
    source_id SERIAL PRIMARY KEY,
    source_name VARCHAR(100),
    source_url TEXT
);

-- FACT TABLE
CREATE TABLE fact_bbc_news (
    news_id SERIAL PRIMARY KEY,
    title TEXT,
    summary TEXT,
    news_url TEXT UNIQUE,
    category_id INT,
    date_id INT,
    source_id INT,
    CONSTRAINT fk_category FOREIGN KEY (category_id)
        REFERENCES dim_category(category_id),
    CONSTRAINT fk_date FOREIGN KEY (date_id)
        REFERENCES dim_date(date_id),
    CONSTRAINT fk_source FOREIGN KEY (source_id)
        REFERENCES dim_source(source_id)
);



SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'dim_source';


