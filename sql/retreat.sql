create extension if not exists "pgcrypto";

-- orgs/members reused pattern (optional if shared DB)
create table if not exists public.orgs (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  owner uuid references auth.users(id),
  created_at timestamptz default now()
);

create table if not exists public.members (
  org_id uuid references public.orgs(id) on delete cascade,
  user_id uuid references auth.users(id) on delete cascade,
  role text check (role in ('owner','admin','member')) default 'member',
  primary key (org_id, user_id),
  created_at timestamptz default now()
);

alter table public.orgs enable row level security;
alter table public.members enable row level security;

create policy "org visibility to members" on public.orgs
for select using (exists (select 1 from public.members m where m.org_id = orgs.id and m.user_id = auth.uid()));
create policy "member reads own rows" on public.members
for select using (user_id = auth.uid());

-- enquiries
create table if not exists public.enquiries (
  id uuid primary key default gen_random_uuid(),
  org_id uuid references public.orgs(id),
  contact_name text,
  contact_email text not null,
  pax int,
  destination text,
  travel_window daterange,
  notes text,
  status text default 'new',
  created_at timestamptz default now()
);

alter table public.enquiries enable row level security;

create policy "org members can read enquiries" on public.enquiries
for select using (
  exists (select 1 from public.members m where m.org_id = enquiries.org_id and m.user_id = auth.uid())
);

create policy "org admins can insert enquiries" on public.enquiries
for insert with check (
  exists (select 1 from public.members m where m.org_id = enquiries.org_id and m.user_id = auth.uid() and m.role in ('owner','admin'))
);
