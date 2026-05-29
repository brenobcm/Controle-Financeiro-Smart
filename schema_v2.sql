-- ============================================================
-- BCM Finance · Schema v2 — Categorias de Receita
-- Execute no Supabase: SQL Editor → New query → Cole → Run
-- ============================================================

create table if not exists cat_receitas (
  id text primary key,
  user_id uuid references auth.users not null,
  nome text,
  emoji text,
  created_at timestamptz default now()
);

alter table cat_receitas enable row level security;

create policy "own_cat_receitas" on cat_receitas for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
