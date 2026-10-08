-- Esegui nel SQL Editor di Supabase.
-- Se la tabella diario_salute esiste già con colonne diverse e NON contiene dati importanti,
-- togli il commento alla riga seguente (cancella la tabella e tutto il suo contenuto):
-- drop table if exists public.diario_salute;

create table if not exists public.diario_salute (
  id text primary key,
  tipo text not null,            -- bambino | farmaco | dose | vaccino
  dati jsonb not null,           -- contenuto del record
  aggiornato_il timestamptz not null default now()
);

alter table public.diario_salute enable row level security;

create policy "app_select" on public.diario_salute for select to anon, authenticated using (true);
create policy "app_insert" on public.diario_salute for insert to anon, authenticated with check (true);
create policy "app_update" on public.diario_salute for update to anon, authenticated using (true) with check (true);
create policy "app_delete" on public.diario_salute for delete to anon, authenticated using (true);
