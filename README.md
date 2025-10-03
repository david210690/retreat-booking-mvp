
---

## 2️⃣ **retreat-booking-mvp**

```md
# 🏝️ Retreat Booking MVP

A **corporate retreat booking workflow** MVP: from enquiry → quote → approval → payment → reports.  
Built with **Next.js + Supabase**, with extendable schemas for real-world retreat management.

---

## ✨ Features
- 📝 Enquiry capture form  
- 📑 Auto-generated PDF quotes  
- ✅ Approval workflow (status updates)  
- 💳 Stripe-ready payment hooks  
- 📊 Reporting dashboard (Supabase queries)  

---

## 📂 Structure
- `/app` → booking routes (enquiry, quotes, approval)  
- `/lib` → Supabase client utilities  
- `/sql` → retreat schema (enquiries, orgs, members, quotes, payments)  
- `.env.example` → environment template  

---

## 🚀 Quickstart
```bash
pnpm i
cp .env.example .env.local
pnpm dev
