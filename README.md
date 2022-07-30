# Blog App

**Blog App** is a Blog website that shows a list of posts that empower readers to interact with them by adding comments and liking posts. 


Enjoy!

## Built With

- Ruby on Rails
- Ruby
- CSS
- HTML
- JavaScript
- Terminal
- IRB
- PostgreSQL
- Rubocop (linters)

## Milestones

- [x] Milestone 1: Creating a data model
- [x] Milestone 2: Validations and Model specs
- [x] Milestone 3: Processing data in models
- [x] Milestone 4: Setup and controllers
- [x] Milestone 5: Controllers specs
- [x] Milestone 6: Views
- [x] Milestone 7: Forms
- [x] Milestone 8: Integration specs for Views and fixing n+1 problems
- [x] Milestone 9: Add Devise
- [x] Milestone 10: Add authorization rules
- [] Milestone 11: Add API endpoints
- [] Milestone 12: API documentation

## Getting Started

To get a local copy up and running follow these simple example steps.

### Install

In your terminal, navigate to your current directory and run this code

`https://github.com/steveWDamesJr/blog-app.git`

Locate the directory in your file explorer

`cd blog-app`

### Install Rubocop

`bundle install`

### Run the seeder

`rails db:seed`

### To start interactive `puma` server

`rails s` 

### View APP in browser

Open `http://localhost:3000` in your browser.


## Testing

### Run Test for models

`rspec spec/models`

### Run Test for views

`bundle exec rspec spec/views`

## Run Linters:

### To run rubocop we use:

`rubocop`

### To autocorrect offenses with rubocop we use:

`rubocop --auto-correct-all` or
`rubocop -A`

### Run linter for styling

`npx stylelint "**/*.{css,scss}"`

### To autocorrect offenses with stylelint we use

`npx stylelint "**/*.{css,scss}" --fix`

## Usage

- Navigate between posts and comments
- Like posts and view number of likes per post
- Comment on posts and view all comments and number of comments per post
- View all posts per user

Have fun blogging and supporting blog posts with comments and likes in your awesome Blog App website!

## Author1

👤 **STEVE W DAMES JR**

- GitHub: [@githubhandle](https://github.com/steveWDamesJr)
- Twitter: [@twitterhandle](https://twitter.com/Steve88312331)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/steve-w-dames-jr/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/steveWDamesJr/blog-app/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc
- Thank you sincerely to all of you taking the time to review this project with special thanks to you code reviewers out there.

## License

This project is [MIT](./MIT.md) licensed.
