-- Esegui nel SQL Editor di Supabase.
-- Se la tabella registro_farmaci esiste già con colonne diverse e NON contiene dati importanti,
-- togli il commento alla riga seguente (cancella la tabella e tutto il suo contenuto):
-- drop table if exists public.registro_farmaci;

create table if not exists public.registro_farmaci (
  id text primary key,
  tipo text not null,            -- bambino | farmaco | dose | vaccino
  dati jsonb not null,           -- contenuto del record
  aggiornato_il timestamptz not null default now()
);

alter table public.registro_farmaci enable row level security;

create policy "app_select" on public.registro_farmaci for select to anon, authenticated using (true);
create policy "app_insert" on public.registro_farmaci for insert to anon, authenticated with check (true);
create policy "app_update" on public.registro_farmaci for update to anon, authenticated using (true) with check (true);
create policy "app_delete" on public.registro_farmaci for delete to anon, authenticated using (true);
