window.MSCWYApp.Router.map ->
  @resource 'index', { path: '/' }
  @resource 'groups', { path: '/groups' }
  @resource 'login', { path: '/login' }

window.MSCWYApp.Router.reopen
  location: 'hash'
