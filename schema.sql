-- ============================================================
-- BCM Finance · Schema Supabase
-- Execute este arquivo no SQL Editor do seu projeto Supabase
-- supabase.com → seu projeto → SQL Editor → New query → Run
-- ============================================================

create table if not exists receitas (
  id text primary key,
  user_id uuid references auth.users not null,
  nome text, valor numeric default 0, data text,
  categoria text, banco text, tipo text, frequencia text, tipo_icone text,
  created_at timestamptz default now()
);
alter table receitas enable row level security;
create policy "own_receitas" on receitas for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists despesas (
  id text primary key,
  user_id uuid references auth.users not null,
  nome text, valor numeric default 0, data text,
  categoria text, forma_pagamento text, tipo text, emoji text, observacao text,
  created_at timestamptz default now()
);
alter table despesas enable row level security;
create policy "own_despesas" on despesas for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists categorias (
  id text primary key,
  user_id uuid references auth.users not null,
  nome text, emoji text, limite numeric default 0,
  created_at timestamptz default now()
);
alter table categorias enable row level security;
create policy "own_categorias" on categorias for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists cartoes (
  id text primary key,
  user_id uuid references auth.users not null,
  banco text, bandeira text, numero text,
  limite numeric default 0, fatura_aberta numeric default 0,
  vencimento text, melhor_dia text,
  created_at timestamptz default now()
);
alter table cartoes enable row level security;
create policy "own_cartoes" on cartoes for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists contas (
  id text primary key,
  user_id uuid references auth.users not null,
  banco text, tipo text, agencia text, conta text, saldo numeric default 0,
  created_at timestamptz default now()
);
alter table contas enable row level security;
create policy "own_contas" on contas for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists investimentos (
  id text primary key,
  user_id uuid references auth.users not null,
  ticker text, nome text, tipo text,
  quantidade numeric default 0, preco numeric default 0,
  valor_total numeric default 0, variacao numeric default 0,
  created_at timestamptz default now()
);
alter table investimentos enable row level security;
create policy "own_investimentos" on investimentos for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists metas (
  id text primary key,
  user_id uuid references auth.users not null,
  nome text, meta numeric default 0, acumulado numeric default 0,
  prazo text, descricao text,
  created_at timestamptz default now()
);
alter table metas enable row level security;
create policy "own_metas" on metas for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists desejos (
  id text primary key,
  user_id uuid references auth.users not null,
  nome text, emoji text, preco numeric default 0,
  poupado numeric default 0, prioridade text, link text,
  created_at timestamptz default now()
);
alter table desejos enable row level security;
create policy "own_desejos" on desejos for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists emprestimos (
  id text primary key,
  user_id uuid references auth.users not null,
  nome text, relacao text, valor numeric default 0,
  pago numeric default 0, data_concessao text,
  prazo text, forma text, observacao text,
  created_at timestamptz default now()
);
alter table emprestimos enable row level security;
create policy "own_emprestimos" on emprestimos for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
