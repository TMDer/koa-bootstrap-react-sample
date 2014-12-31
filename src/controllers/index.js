exports.index = function *() {
  var username = ""

  if(this.isAuthenticated())
    this.username = this.passport.user.username

  this.isLogin = this.isAuthenticated()

  this.body = yield this.render("index", {
    isLogin: this.isLogin,
    username: this.username
  });
};
