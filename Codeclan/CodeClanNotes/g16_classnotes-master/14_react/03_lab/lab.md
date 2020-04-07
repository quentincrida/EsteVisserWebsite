# React Practice

Today, we're going to consolidate everything we've done in React so far. You can choose from the following mini-projects.

## Mortgage Calculator

Build a simple mortgage affordability calculator, which takes in a person's salary (and optionally, their partner's salary). Display the maximum value of the property that the person or couple can afford. (Use a simple calculation of `combined salary * 3` to begin with).

Choose this project if you want to practice:

- Components, state + props
- Business logic
- Controlled form components

As an extension, you can add more fields - and therefore complexity - to the calculation. For example:

- Add a deposit field, which is added on to the maximum value of the property
- Add a field for "other monthly commitments", which should reduce the maximum possible value

As an advanced extension:

- Allow the user to enter the interest rate of the mortgage, and the length of the mortgage term in years. Output their monthly repayments.

_*Hint:*_ Think carefully about the SOLID principles, and in particular, the Single Responsibility principle. Where are the calculations going to be performed? Plan your work carefully.

## Hacker News Client

Build a filterable front-end for [Hacker News](https://news.ycombinator.com/). Using the following endpoints, allow the user to view a list of top stories, and filter them by title.

- https://hacker-news.firebaseio.com/v0/topstories.json - Latest Stories
- https://hacker-news.firebaseio.com/v0/item/{storyId}.json - Story Detail

Choose this project if you want to practice:

- Working with components, state + props
- Working with requests
- Working with forms

_*Hint:*_ How can you send multiple requests and wait for responses? Research [Promise.all](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all).
