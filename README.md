rails-instagram-uid
===================

Instagram User ID Lookup for Ruby on Rails

## Overview

This is the codebase (ported to Ruby on Rails) for the Instagram User ID application, originally written for Django, located [here](http://instagram-uid.herokuapp.com/). It includes a basic implementation of the Instagram API and can be modified and expanded to utilize the full functionality of the API. 

This application adheres to generally accepted Rails 3.2 best practices and works both with and without Javascript. As-is, this codebase is ready for deployment both locally and in production via Heroku.

See this application written for [Django](http://www.github.com/zeantsoi/django-instagram-uid).

## Dependencies

This application utilizes the [instagram-ruby-gem](https://github.com/Instagram/instagram-ruby-gem) by Instagram.

    # Gemfile
    
    gem 'instagram'

## Usage

This application requires an Instagram access token, which is available by registering for [an Instagram developer's account](http://instagram.com/developer/register/). Your access token can be passed to the application either during your lookup request or by modifying the Instagram initializer file.

    # config/initializers/instagram.rb
    
    INSTAGRAM_ACCESS_TOKEN = 'YOUR INSTAGRAM ACCESS TOKEN'
    
## License

Copyright (c) 2013 Zean Tsoi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.