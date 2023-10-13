# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# GOTHAM

Welcome to Gotham, a Rails-based application designed to manage and present information pertaining to fighting events, fighters, and associated multimedia content. Dive into a platform that allows you to structure, organize, and showcase fighting events, complete with rich details and associated imagery.
* Key Features
* Events Management

    * Events Creation: Create and manage fighting events, complete with a title, date, location, and description.

* Fighter Profiles

    * Fighter Management: Build profiles for fighters, detailing their name, age, weight, origin city, club, and professional records.
    * Fighter Imagery: Associate multiple images with fighters, managed by users.

* Fights Management

    * Fight Details: Handle fight information, linked with fighters and events, and details like weight class and status (finished or not).
    * Fight Participants: Keep track of the participating fighters and their respective fights.

* Articles Management

    * Content Creation: Manage articles with detailed information, each connected with a user.
    * Photo Management: Add and manage photos related to articles and managed by users.

* User Management

    * User Authentication: Utilize Devise for user authentication, allowing for secure sign-up, login, and management of user details.
    * Admin Role: Determine user admin status for access to potential exclusive functionalities.

* Multimedia Uploads

    * Image Uploads: Utilize CarrierWave and fog-aws for image uploading and storage, with potential AWS S3 integration.

* Technology Stack
* Core

    * Rails: Utilizing version 6.1.0, as a robust framework for web application development.

* Database

    * PostgreSQL: Employed as a relational database to manage structured data, including entities like events, fighters, fights, articles, and images.

* Front-End

    * SCSS: For stylish and maintainable stylesheets.
    * Webpacker: For managing app-like JavaScript.
    * Font Awesome: For utilizing scalable vector icons that can be customized with the power of CSS.
    * Bootstrap 5: For responsive views and outstanding look

* Authentication

    * Devise: Integrated for user authentication and management.

* Authorization

    * Pundit: Employed for defining access policies.

* Image Management

    * CarrierWave: Used for file uploads, with a focus on image uploads for various models.
    * Rmagick: An image processing library utilized alongside CarrierWave.
    * Fog-aws: For managing uploads to AWS S3.

* I18n

    * Rails-i18n: For internationalization of the application.

* Testing

    * Capybara: For system testing and interaction with web pages.

* Deployment

    * Capistrano: Along with its extensions for deploying the application, potentially to a server with RVM and Puma set up.
