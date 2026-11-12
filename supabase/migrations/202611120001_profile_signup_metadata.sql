alter table public.users
  add column if not exists avatar_path text;

alter table public.tasks
  add column if not exists submission_path text;

grant update (nisn, nama, email, avatar_path)
  on table public.users to authenticated;

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  insert into public.users (id, nisn, email, nama, role)
  values (
    new.id,
    nullif(new.raw_user_meta_data ->> 'nisn', ''),
    new.email,
    coalesce(
      new.raw_user_meta_data ->> 'nama',
      new.raw_user_meta_data ->> 'full_name',
      new.raw_user_meta_data ->> 'name',
      ''
    ),
    'siswa'
  )
  on conflict (id) do update
  set nisn = coalesce(public.users.nisn, excluded.nisn),
      email = excluded.email,
      nama = coalesce(nullif(public.users.nama, ''), excluded.nama);

  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute function public.handle_new_user();