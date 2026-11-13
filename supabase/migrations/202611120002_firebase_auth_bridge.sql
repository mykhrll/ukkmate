alter table public.users
  drop constraint if exists users_id_fkey;

alter table public.users
  alter column id set default gen_random_uuid();

alter table public.users
  add column if not exists firebase_uid text;

create unique index if not exists users_firebase_uid_uidx
  on public.users (firebase_uid)
  where firebase_uid is not null;

create or replace function public.is_ukkmate_firebase_user()
returns boolean
language sql
stable
set search_path = ''
as $$
  select coalesce(
    auth.jwt() ->> 'iss' = 'https://securetoken.google.com/ukkmate'
    and auth.jwt() ->> 'aud' = 'ukkmate'
    and nullif(auth.jwt() ->> 'sub', '') is not null,
    false
  );
$$;

grant execute on function public.is_ukkmate_firebase_user()
  to anon, authenticated;

grant select, insert (firebase_uid, nisn, nama, email)
  on table public.users to anon, authenticated;
grant update (nisn, nama, email, avatar_path)
  on table public.users to anon, authenticated;
grant select on table public.materials to anon, authenticated;
grant select on table public.tasks to anon, authenticated;
grant update (status, submission_path)
  on table public.tasks to anon, authenticated;
grant select, insert (user_id), update (finished_at, status)
  on table public.exam_sessions to anon, authenticated;
revoke all on table public.exam_results from anon, authenticated;

alter table public.users enable row level security;
alter table public.materials enable row level security;
alter table public.tasks enable row level security;
alter table public.exam_sessions enable row level security;
alter table public.exam_results enable row level security;

drop policy if exists users_read_own on public.users;
drop policy if exists users_update_own on public.users;
drop policy if exists firebase_users_read_own on public.users;
drop policy if exists firebase_users_insert_own on public.users;
drop policy if exists firebase_users_update_own on public.users;

create policy firebase_users_read_own
on public.users for select to anon, authenticated
using (
  (select public.is_ukkmate_firebase_user())
  and firebase_uid = (select auth.jwt() ->> 'sub')
);

create policy firebase_users_insert_own
on public.users for insert to anon, authenticated
with check (
  (select public.is_ukkmate_firebase_user())
  and firebase_uid = (select auth.jwt() ->> 'sub')
  and role = 'siswa'
);

create policy firebase_users_update_own
on public.users for update to anon, authenticated
using (
  (select public.is_ukkmate_firebase_user())
  and firebase_uid = (select auth.jwt() ->> 'sub')
)
with check (
  (select public.is_ukkmate_firebase_user())
  and firebase_uid = (select auth.jwt() ->> 'sub')
);

drop policy if exists materials_read_authenticated on public.materials;
drop policy if exists firebase_materials_read on public.materials;
create policy firebase_materials_read
on public.materials for select to anon, authenticated
using ((select public.is_ukkmate_firebase_user()));

drop policy if exists tasks_select_own on public.tasks;
drop policy if exists tasks_insert_own on public.tasks;
drop policy if exists tasks_update_own on public.tasks;
drop policy if exists tasks_delete_own on public.tasks;
drop policy if exists firebase_tasks_read_own on public.tasks;
drop policy if exists firebase_tasks_update_own on public.tasks;

create policy firebase_tasks_read_own
on public.tasks for select to anon, authenticated
using (
  (select public.is_ukkmate_firebase_user())
  and exists (
    select 1 from public.users u
    where u.id = tasks.user_id
      and u.firebase_uid = (select auth.jwt() ->> 'sub')
  )
);

create policy firebase_tasks_update_own
on public.tasks for update to anon, authenticated
using (
  (select public.is_ukkmate_firebase_user())
  and exists (
    select 1 from public.users u
    where u.id = tasks.user_id
      and u.firebase_uid = (select auth.jwt() ->> 'sub')
  )
)
with check (
  (select public.is_ukkmate_firebase_user())
  and status = 'in_progress'
  and exists (
    select 1 from public.users u
    where u.id = tasks.user_id
      and u.firebase_uid = (select auth.jwt() ->> 'sub')
  )
);

drop policy if exists sessions_read_own on public.exam_sessions;
drop policy if exists sessions_insert_own on public.exam_sessions;
drop policy if exists sessions_update_own on public.exam_sessions;
drop policy if exists firebase_sessions_read_own on public.exam_sessions;
drop policy if exists firebase_sessions_insert_own on public.exam_sessions;
drop policy if exists firebase_sessions_update_own on public.exam_sessions;

create policy firebase_sessions_read_own
on public.exam_sessions for select to anon, authenticated
using (
  (select public.is_ukkmate_firebase_user())
  and exists (
    select 1 from public.users u
    where u.id = exam_sessions.user_id
      and u.firebase_uid = (select auth.jwt() ->> 'sub')
  )
);

create policy firebase_sessions_insert_own
on public.exam_sessions for insert to anon, authenticated
with check (
  (select public.is_ukkmate_firebase_user())
  and exists (
    select 1 from public.users u
    where u.id = exam_sessions.user_id
      and u.firebase_uid = (select auth.jwt() ->> 'sub')
  )
);

create policy firebase_sessions_update_own
on public.exam_sessions for update to anon, authenticated
using (
  (select public.is_ukkmate_firebase_user())
  and exists (
    select 1 from public.users u
    where u.id = exam_sessions.user_id
      and u.firebase_uid = (select auth.jwt() ->> 'sub')
  )
)
with check (
  (select public.is_ukkmate_firebase_user())
  and exists (
    select 1 from public.users u
    where u.id = exam_sessions.user_id
      and u.firebase_uid = (select auth.jwt() ->> 'sub')
  )
);

-- Keep client uploads scoped to the signed-in Firebase UID.
drop policy if exists avatars_read_own on storage.objects;
drop policy if exists avatars_upload_own on storage.objects;
drop policy if exists avatars_update_own on storage.objects;
drop policy if exists avatars_delete_own on storage.objects;
drop policy if exists assignments_read_own on storage.objects;
drop policy if exists assignments_upload_own on storage.objects;
drop policy if exists assignments_update_own on storage.objects;
drop policy if exists assignments_delete_own on storage.objects;
drop policy if exists materials_read_authenticated on storage.objects;
drop policy if exists firebase_avatars_read_own on storage.objects;
drop policy if exists firebase_avatars_insert_own on storage.objects;
drop policy if exists firebase_avatars_update_own on storage.objects;
drop policy if exists firebase_avatars_delete_own on storage.objects;
drop policy if exists firebase_assignments_read_own on storage.objects;
drop policy if exists firebase_assignments_insert_own on storage.objects;
drop policy if exists firebase_assignments_update_own on storage.objects;
drop policy if exists firebase_assignments_delete_own on storage.objects;
drop policy if exists firebase_materials_read on storage.objects;

create policy firebase_avatars_read_own
on storage.objects for select to anon, authenticated
using (
  bucket_id = 'avatars'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
);

create policy firebase_avatars_insert_own
on storage.objects for insert to anon, authenticated
with check (
  bucket_id = 'avatars'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
);

create policy firebase_avatars_update_own
on storage.objects for update to anon, authenticated
using (
  bucket_id = 'avatars'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
)
with check (
  bucket_id = 'avatars'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
);

create policy firebase_avatars_delete_own
on storage.objects for delete to anon, authenticated
using (
  bucket_id = 'avatars'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
);

create policy firebase_assignments_read_own
on storage.objects for select to anon, authenticated
using (
  bucket_id = 'assignments'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
);

create policy firebase_assignments_insert_own
on storage.objects for insert to anon, authenticated
with check (
  bucket_id = 'assignments'
  and (select public.is_ukkmate_firebase_user())
  and exists (
    select 1 from public.users u
    join public.tasks t on t.user_id = u.id
    where u.firebase_uid = (select auth.jwt() ->> 'sub')
      and t.id::text = (storage.foldername(name))[2]
  )
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
);

create policy firebase_assignments_update_own
on storage.objects for update to anon, authenticated
using (
  bucket_id = 'assignments'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
)
with check (
  bucket_id = 'assignments'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
);

create policy firebase_assignments_delete_own
on storage.objects for delete to anon, authenticated
using (
  bucket_id = 'assignments'
  and (select public.is_ukkmate_firebase_user())
  and (storage.foldername(name))[1] = (select auth.jwt() ->> 'sub')
);

create policy firebase_materials_read
on storage.objects for select to anon, authenticated
using (
  bucket_id = 'materials'
  and (select public.is_ukkmate_firebase_user())
);
