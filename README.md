# README

### Postgres for Database
1. gem 'pg', '~> 1.1'
2. bundle install
3. create database.yml file
4. rails db:create
5. rails db:migrate
6. rails db:seed


### Release Note
1. Create database.yml file inside config folder; by renaming database.yml.example file
2. Create database using command: rails db:create
3. Run migrations using command: rails db:migrate
4. Run rails db:seed to add records of seeds file (It will create super-admin)
5. There are three types of role in user: 'super-admin', 'school-admin', 'student'
6. Super-admin: 
    - Can access everything
    - Can create student and school-admin
7. School-admin:
    - Can update information about the school 
    - Can create a student
    - Can create batch, course, schools
    - Can add student to batch
    - Can approve or deny student requests
8. Student:
    - Can send request for batch enroll
    - Can check other user progress 
9. First time super-admin can only login as other user won't present.
10. Super admin will create studnet and school-admin, after that they can login with system
11. To run test suite use command: bundle exec rspec spec
12. Added a strong paramter for injection Attacks


