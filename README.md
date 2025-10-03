# Corporate Retreat Booking MVP

End-to-end flow: enquiry → quote (PDF) → approval → payment → invoice.

## Modules
- Enquiries (public form) → CRM view
- Quotes (PDF) with line items & taxes
- Approvals (manager/admin) + email
- Payments (Stripe-ready scaffold)
- Reports: bookings by org, margin, status

## Setup
- Run `/sql/retreat.sql` in Supabase (SQL Editor).
- Add env vars as in the starter repo.
- Optional: expose `/api/quote` to generate a sample PDF.

