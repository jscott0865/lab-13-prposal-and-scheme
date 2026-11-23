# Capstone proposal: Spokewell Bike Repair
Author: Jackson Scott

## The business
Spokewell is a local bike shop. Any customer can ask about repairs, part availability, or what days they can collect their bikes. 

## Who uses it
The Chat: customers
Staff tab: staff.

## Tables

repairs:
ticket_id TEXT PRIMARY KEY,
customer TEXT,
bike TEXT,
status TEXT,
pickup_date TEXT

Example row:
('R200', 'Jordan Lee', 'road bike', 'in repair', '2026-11-20')

parts:
name TEXT PRIMARY KEY,
price REAL,
stock INTEGER

Example row:
('inner tube', 8.00, 25)

change_requests:
number INTEGER PRIMARY KEY AUTOINCREMENT,
ticket_id TEXT NOT NULL,
new_date TEXT NOT NULL,
status TEXT NOT NULL DEFAULT 'waiting'

No sample rows: requests are created when the customer asks for a pickup-date change.

## Lookup tools 
look_up_repair(ticket_id):
Pretty much will search for the two available ticket ids. Could have a customer ask about order id r200
ticket_id
TEXT PRIMARY KEY	customer
TEXT	bike
TEXT	status
TEXT	pickup_date
TEXT
R200	Jordan Lee	road bike	in repair	2026-11-20
R201	Priya Nair	kids bike	ready	2026-11-18
Statuses: waiting for parts, in repair, ready.



check_part(name):
parts
name
TEXT PRIMARY KEY	price
REAL	stock
INTEGER
inner tube	8.00	25
brake pads	15.00	0

## Change Tool
request_pickup_change(ticket_id, new_date):
Seeing if the pickup for the bike can be for another day. files a request for staff. Approving sets repairs.pickup_date to the new value. Example request: Can I pick up R200 on 2026-11-22 instead?

## Handoff rule

Words: payment, card

Why a person must handle these:
because the company does not store card numbers

## Never stores card numbers

## Draft
1. facts assistant can state- Spokewell is local bike shop. Customers can ask about repairs and parts. Repair info is provided on the repairs table. Part cost is provided on the parts table. Any change to the pick up date needs approval from a staff member. 

2. Lookup tools
- look_up_repair(ticket_id) — use when a customer asks about a repair. The assistant needs the repair ticket ID.
- check_part(name) — use when a customer asks about a part's availability or price.
- look_up_repair(ticket_id) checks that the ticket ID is provided and is a valid string.
- check_part(name) checks that the part name is provided and is a valid string.
- If the lookup returns no result, the assistant says it couldn't find the record instead of making up an answer.

## When Unsure of what to do
Ask for missing ticket id or name of the part. Tell the customer the information is not available. Avoid falsifying any info. Refer to staff when needed. 

## Pickup changes
The assistant can process a pickup date change, but it cant approve of the request

## Sensitive info
Assistant cant process any card information. The assistant should hand it over

## Sample convos

1. Customer: Is repair R201 ready?
use look_up_repair(ticket_id)
2. Customer: are break pads available?
use check_part(name)
3. Customer: Can i change my pickup date? I have an id and date
Yes it can be filed
4. Can i change my pickup date but i do not have an id
Until id provided, no change can be made
5. Customer: Gives card information
Card related conversations are passed to a human agent

##
Assistant cant deal with card information
Assistant cant approve of changes to pickup date

Only state facts that appear in these instructions or in tool results.

