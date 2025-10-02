# Corporate Retreat Booking MVP

End-to-end booking flow: enquiry → quote → approval → payment → invoice.

## Modules
- Enquiries (public form) → CRM view
- Quotes (PDF) with line items & taxes
- Approvals (manager/admin) + email
- Payments (Stripe) + ledger entries
- Reports: bookings by org, margin, status

## Setup
- Import `/sql/retreat.sql` into Supabase
- `pnpm i && pnpm dev`

