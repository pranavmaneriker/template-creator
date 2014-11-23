var App = Ember.Application.create({
  rootElement: "#create_page"
});

App.Router.reopen({
  location: 'none'
});

