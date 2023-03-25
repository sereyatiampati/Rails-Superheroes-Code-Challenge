# Superheroes
## Introduction

Superheroes is a Rails application that implements a many-to-many relationship between `Hero` and `Power` models and it is API for tracking heroes and their superpowers.

The relationships between database tables is represented by the following associations between models:
- A `Hero` has many `Power`s through `HeroPower`
- A `Power` has many `Hero`s through `HeroPower`
- A `HeroPower` belongs to a `Hero` and belongs to a `Power`

### Requirements
* Ruby 3.0.0 or higher
* Rails 6.1.0 or higher
* SQLite

### Getting Started
1. Clone the repository to your local machine: `git@github.com:sereyatiampati/Rails-Superheroes-Code-Challenge.git`.
2. Navigate to the project directory: `cd Rails-Superheroes-Code-Challenge`.
3. Install dependencies: `bundle install`.
4. Run the database migrations: `rails db:migrate`.
5. Seed the database with sample data: `rails db:seed`.
6. Run the server `rails server`.

### Usage
After completing the setup steps above, you can use the application to manage `Hero` and `Powers` records, and the association between them.

You can make the following requests:
* GET /heros
* GET /heros/:id
* GET /powers
* GET /powers/:id
* PATCH /powers/:id
* POST /hero_powers/


## Acknowledgments

List below are resources used and were helpful and I would like to give credit to.

* [Moringa School](https://moringaschool.com/)
* [Active Record Documentation](https://guides.rubyonrails.org/active_record_querying.html#ordering)
* [BSD 2-Clause "Simplified" License](https://opensource.org/licenses/BSD-2-Clause)
* [Rails Active Record Validations](https://guides.rubyonrails.org/active_record_validations.html)
* [Ruby on Rails Guide](https://guides.rubyonrails.org/)
* [Ruby 99 Bottles of OOP - Sandi Metz](https://calibre.leishi.io/show/174/pdf)


## License

Distributed under the MIT License. See `LICENSE.txt` for more information.


