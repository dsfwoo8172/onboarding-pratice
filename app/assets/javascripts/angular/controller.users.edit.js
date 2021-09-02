var app = angular.module('UsersEditApp', []);

app.controller('UsersEditController', function($scope, $http, user_config) {
  $scope.config = user_config
  $scope.inteValidation = /^\d+$/
  let userId = user_config.user_id

  let getUser = () => {
    $http.get(`/users/${userId}/edit.json`).then(res => {
      $scope.user = res.data.user
    }, err => console.log(err.message)) 
  }

  getUser()

  $scope.submit = () => {
    let token = document.querySelector('[name="csrf-token"]').content
    $http.defaults.headers.common['X-CSRF-TOKEN'] = token
    $http.patch(`/users/${userId}.json`, { user: $scope.user } ).then(res => {
      location.replace(res.data.url.replace('.json', ''))
      alert('successfully')
    })
  }
})