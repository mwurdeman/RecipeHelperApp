var recipeHelperApp = angular.module('recipeHelperApp', [
    'ngRoute',
    'recipeHelperControllers'
]);

recipeHelperApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
            when('/home', {
                templateUrl: 'partials/home.html',
                controller: 'homeController'
            }).
            when('/RecipeSearch', {
                templateUrl: 'partials/RecipeSearch.html',
                controller: 'recipeSearchController'
            }).
            otherwise({
                redirectTo: '/home'
            });
    }
]);