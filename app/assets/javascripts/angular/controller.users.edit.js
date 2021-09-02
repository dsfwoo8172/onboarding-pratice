var app = angular.module('UsersEditApp', []);

app.controller('UsersEditController', function($scope, $http, user_config) {
  $scope.config = user_config
  $scope.inteValidation = /^\d+$/
  let userId = location.href.split('/')[4]

  let getUser = () => {
    $http.get(`/users/${userId}/edit.json`).then(res => {
      $scope.user = res.data.user
    }, err => console.log(err.message)) 
  }
  
  getUser()
})

app.controller('SubmitController', function ($scope, $http) {
  let userId = location.href.split('/')[4]
  let token = document.querySelector('[name="csrf-token"]').content
  
  $scope.submit = () => {
    $http.defaults.headers.common['X-CSRF-TOKEN'] = token
    $http.patch(`/users/${userId}.json`, { user: $scope.user } ).then(res => {
      location.replace(res.data.url.replace('.json', ''))
      alert('successfully')
    })
  }
})