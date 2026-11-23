-- Spokewell Bike Repair

CREATE TABLE IF NOT EXISTS repairs (
    ticket_id TEXT PRIMARY KEY,
    customer TEXT NOT NULL,
    bike TEXT NOT NULL,
    status TEXT NOT NULL,
    pickup_date TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS parts (
    name TEXT PRIMARY KEY,
    price REAL NOT NULL,
    stock INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS change_requests (
    number INTEGER PRIMARY KEY AUTOINCREMENT,
    ticket_id TEXT NOT NULL,
    new_date TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'waiting'
);

-- Sample repairs
INSERT OR IGNORE INTO repairs
(ticket_id, customer, bike, status, pickup_date)
VALUES
('R200', 'Jordan Lee', 'road bike', 'in repair', '2026-11-20'),
('R201', 'Priya Nair', 'kids bike', 'ready', '2026-11-18');

-- Sample parts
INSERT OR IGNORE INTO parts (name, price, stock)
VALUES
('inner tube', 8.00, 25),
('brake pads', 15.00, 0);

INSERT OR IGNORE INTO repairs
(ticket_id, customer, bike, status, pickup_date)
VALUES
('R200', 'Joe Burrow', 'road bike', 'in repair', '2026-11-20'),
('R201', 'Jordan Love', 'kids bike', 'ready', '2026-11-18'),
('R202', 'JJ Mccarthy', 'mountain bike', 'waiting for parts', '2026-11-25'),
('R203', 'Aaron Rodgers', 'hybrid bike', 'in repair', '2026-11-26'),
('R204', 'Josh Allen', 'electric bike', 'ready', '2026-11-27');

INSERT OR IGNORE INTO parts
(name, price, stock)
VALUES
('inner tube', 8.00, 25),
('brake pads', 15.00, 0),
('chain', 21.00, 7),
('bike tire', 39.00, 6),
('bike seat', 24.00, 16);