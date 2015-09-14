#My ToDo app

##This app can help track your tasks from Incomplete to Complete
### To run this file
--Using Ruby
-- -- `ruby bin/todo.rb`

### The ToDo app allows you to build a list of tasks you would like to complete. You may mark tasks as completed (true), edit a previously added task, or delete one. The list is printed out to the screen for easy viewing. Enjoy!



.
├── Gemfile             # Details which gems are required by the project
├── README.md           # This file
├── Rakefile            # Defines `rake generate:migration` and `db:migrate`
├── config
│   └── database.yml    # Defines the database config (e.g. name of file)
├── console.rb          # `ruby console.rb` starts `pry` with models loaded
├── db
│   ├── dev.sqlite3     # Default location of the database file
│   ├── migrate         # Folder containing generated migrations
│   └── setup.rb        # `require`ing this file sets up the db connection
└── lib                 # Your ruby code (models, etc.) should go here
    └── all.rb          # Require this file to auto-require _all_ `.rb` files in `lib`
