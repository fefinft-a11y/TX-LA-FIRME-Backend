CREATE TABLE IF NOT EXISTS users (
 id BIGSERIAL PRIMARY KEY, name TEXT NOT NULL, email TEXT NOT NULL UNIQUE,
 password_hash TEXT NOT NULL, phone TEXT, role TEXT NOT NULL DEFAULT 'passenger' CHECK(role IN ('passenger','admin','driver')),
 created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS routes (
 id BIGSERIAL PRIMARY KEY, origin TEXT NOT NULL, destination TEXT NOT NULL,
 active BOOLEAN NOT NULL DEFAULT TRUE, UNIQUE(origin,destination)
);
CREATE TABLE IF NOT EXISTS fares (
 id BIGSERIAL PRIMARY KEY, route_id BIGINT NOT NULL REFERENCES routes(id),
 modality TEXT NOT NULL CHECK(modality IN ('shared','exclusive')), price NUMERIC(10,2) NOT NULL CHECK(price>0),
 UNIQUE(route_id,modality)
);
CREATE TABLE IF NOT EXISTS trips (
 id BIGSERIAL PRIMARY KEY, route_id BIGINT NOT NULL REFERENCES routes(id), departure_at TIMESTAMPTZ NOT NULL,
 modality TEXT NOT NULL CHECK(modality IN ('shared','exclusive')), total_seats INT NOT NULL DEFAULT 4,
 available_seats INT NOT NULL DEFAULT 4, price_per_seat NUMERIC(10,2) NOT NULL,
 status TEXT NOT NULL DEFAULT 'open' CHECK(status IN ('open','closed','cancelled')),
 CHECK(available_seats>=0 AND available_seats<=total_seats)
);
CREATE TABLE IF NOT EXISTS bookings (
 id BIGSERIAL PRIMARY KEY, user_id BIGINT NOT NULL REFERENCES users(id), trip_id BIGINT NOT NULL REFERENCES trips(id),
 seats INT NOT NULL CHECK(seats BETWEEN 1 AND 4), total_amount NUMERIC(10,2) NOT NULL,
 status TEXT NOT NULL DEFAULT 'pending' CHECK(status IN ('pending','confirmed','cancelled')),
 created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
