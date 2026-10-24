-- Run this once in Supabase: SQL Editor > New query > paste > Run.
create table public.scores (
  id bigint generated always as identity primary key,
  name text not null check (char_length(name) between 1 and 16),
  dist integer not null check (dist between 0 and 100000),
  flies integer not null check (flies between 0 and 10000),
  created_at timestamptz not null default now()
);

alter table public.scores enable row level security;

-- Anyone can read scores and add a score. Nobody can edit or delete.
create policy "anyone can read scores" on public.scores
  for select to anon using (true);

create policy "anyone can add a score" on public.scores
  for insert to anon with check (true);
