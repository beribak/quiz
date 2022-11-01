# 1. holds information in tables and has the ability to associate tables, table = model, row = instance, column = instance variable

# 2. one to one, one to many, many to many

# 5. SQL structured query language

# 6. SELECT * FROM books WHERE year < 1985;

# 7. SELECT * FROM books
#    JOIN authors ON books.author_id = authors.id
#    WHERE authors.name = 'Jules Verne'
#    ORDER BY year DESC
#    LIMIT 3

# 8. No SQL, ORM to match instance variables to column of an SQL db

# 9. a file that defines what needs to be changed in the structure of the db

# 10. rake db:migrate

# 11. 
class CreateAuthors < ActiveRecord::Migration[7.0]
    def change
        create_table :authors do |t|
            t.string :name
            t.timestamps
        end
    end
end

# 12. 
class CreateBooks < ActiveRecord::Migration[7.0]
    def change
        create_table :books do |t|
            t.string :title
            t.integer :year
            t.references :author, foreign_key: true
            t.timestamps
        end
    end
end
  
# 13. 
class CreateUsers < ActiveRecord::Migration[7.0]
    def change
        create_table :users do |t|
            t.string :name
            t.timestamps
        end
    end
end

# 14. 
class CreateReadings < ActiveRecord::Migration[7.0]
    def change
        create_table :books_users do |t|
            t.date :date
            t.references :books, foreign_key: true
            t.references :users, foreign_key: true
            t.timestamps
        end
    end
end

# 15.
class AddCategoryToBooks < ActiveRecord::Migration[7.0]
    def change
        add_column :books, :category, :string
    end
end

# 16. 

class Author
    has_many :books
end

class Book
    has_many :books_users
    has_many :users, trough: :books_users
    belong_to :author

end

class User
    has_many :books_users
    has_many :books, trough: :books_users
end

class BooksUsers
    belong_to :book
    belong_to :user
end

# 17.

    #1. Add your favorite author to the DB
        author = Author.create(name: "J.K Rowling")
        # OR
        author = Author.new(name: "J.K Rowling")
        author.save
    #2. Get all authors
        Author.all
    #3. Get author with id=8
        Author.find(8)
    #4. Get author with name="Jules Verne", store it in a variable: jules
        jules = Author.find_by(name: "Jules Verne")
    #5. Get Jules Verne's books
        jules.books
    #6. Create a new book "20000 Leagues under the Seas". Store it in a variable: twenty_thousand
        twenty_thousand = Book.create(title: "20000 Leagues under the Seas")
        twenty_thousand = Book.new(title: "20000 Leagues under the Seas")
    #7. Add Jules Verne as this book's author
        twenty_thousand.author = jules
    #8. Now save this book in the DB!
        twenty_thousand.save


# 18. 
class Author
    validate :name, presence: true, uniquness: true
end

# 19. 
# NO