$( document ).ready(function() {
    addEventListners();
});





var addEventListners = function(){
  $("#login-button").click(showLogin)
  $("#signup-button").click(showSignup)
}

var showSignup = function(){
  $('#signup').removeClass('invisible')
  $('#login').addClass('invisible')

}

var showLogin = function(){

  $('#login').removeClass('invisible')
  $('#signup').addClass('invisible')

}