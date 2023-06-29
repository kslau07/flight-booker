# Odin Rails Project: flight-booker

> Link to project specs can be found here:  
> https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker

> Link to deployed app @ fly.io (app may be offline)  
> https://top-flight-booker.fly.dev/flights


## Demo

[demo.webm](https://github.com/kslau07/flight-booker/assets/106824651/73cbfe1d-7b07-4bfa-9a98-dd826af0f79a)

## Description

We’ll be creating a one-way flight booker. You’ll get lots of practice populating and building dropdown menus, radio buttons, and nested submissions. Let the fun begin!

## My Goals

I will not use any Rails form helpers for project, as recommended by the lesson. I will be working with bare HTML tags and attributes in order to understand how Rails interacts with these HTML controls.  

I hope to gain a better understanding of nested forms, `accepts_nested_attributes_for`, and model associations.

## Known issues

If user is filling out a form for 2 or more passengers, and one of the fields is invalid, eg for email, then all email fields will be marked invalid regardless. The errors hash that Rails provides doesn't seem to indicate which object received the error. There is no issue if we use the form helper.

## Thoughts After

Things I added that were not in the project spec:  
* Remembering the user's choices in the drop down menu
* sortable columns
* "ANY" selection in the dropdown menu that essentially omits that category in the query

I feel much more comfortable with forms and nested attributes after this project. Writing forms manually with bare html is tedious work and I can appreciate how Rails makes things so much simpler with form helpers. This was also good practice for working with association members and how we can create association members going through parent objects.
